using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona.views.Principal
{
	public partial class UsuarioManager : System.Web.UI.Page
	{
		#region variables

		private SessionManager session = new SessionManager();
		private int idUsuario = 0;
		private UTTT.Ejemplo.Linq.Data.Entity.dbo_Login baseEntity;
		private DataContext dcGlobal = new DcGeneralDataContext();
		private int tipoAccion = 0;
		Encriptar encriptar = new Encriptar();
		#endregion
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				this.Response.Buffer = true;
				this.session = (SessionManager)this.Session["SessionManager"];
				this.idUsuario = this.session.Parametros["idUsuario"] != null ?
					int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
				if (this.idUsuario == 0)
				{
					this.baseEntity = new Linq.Data.Entity.dbo_Login();
					this.tipoAccion = 1;
				}
				else
				{
					this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.dbo_Login>().First(c => c.id == this.idUsuario);
					this.tipoAccion = 2;
				}
				if (!this.IsPostBack)
				{
					if (this.session.Parametros["baseEntity"] == null)
					{
						this.session.Parametros.Add("baseEntity", this.baseEntity);
					}
					List<dbo_EstadoLogin> lista = dcGlobal.GetTable<dbo_EstadoLogin>().ToList();
					this.ddlEstadoUser.DataTextField = "strNombre";
					this.ddlEstadoUser.DataValueField = "id";
					//Usuario nuevo
					if (this.idUsuario == 0)
					{
						//lista de personas
						List<UTTT.Ejemplo.Linq.Data.Entity.Persona> personaLista = 
							dcGlobal.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(p=> p.fkLogin == null).ToList();
						this.ddlPersonaCompleto.DataTextField = "NombreCompleto";
						this.ddlPersonaCompleto.DataValueField = "id";
						this.ddlPersonaCompleto.DataSource = personaLista;
						this.ddlPersonaCompleto.DataBind();
						txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
						CatSexo catSexo = new CatSexo();
						//partes que no deben verse
						txtPersona.Visible = false;
						llblEstadoUsu.Visible = false;
						ddlEstadoUser.Visible = false;
					}
					//usuario editable
					else
					{
						//Partes que nodeben verse
						ddlPersonaCompleto.Visible = false;
						//partes que deen verse
						txtPersona.Visible = true;
						llblEstadoUsu.Visible = true;
						ddlEstadoUser.Visible = true;
						//buscar el nombre
						var validar = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.baseEntity.fkPersona);
						this.txtPersona.Text = validar.NombreCompleto;
						//nombre del usuario
						this.txtUsuario.Text = this.baseEntity.strUsuario;
						//genera droplist
						dbo_EstadoLogin estado = new dbo_EstadoLogin();
						this.ddlEstadoUser.DataSource = lista;
						this.ddlEstadoUser.DataBind();
						//slecciona estado
						this.ddlEstadoUser.SelectedValue = baseEntity.fkEstado.ToString();
						//contraseña
						//ahora desencriptamos
						var desEncrip = encriptar.DesEncriptar(this.baseEntity.strContraseña);
						this.txtContraseña.Text = desEncrip;
						this.txtContraCompa.Text = desEncrip;
						//Fecha de ingreso, no editable
						this.txtFecha.Text = baseEntity.dtFehca.ToString().Split(' ')[0];
					}
				}
			}
			catch(Exception _e) 
			{ 
				
			}
        }

		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				DataContext dcGuardar = new DcGeneralDataContext();
				UTTT.Ejemplo.Linq.Data.Entity.dbo_Login login = new Linq.Data.Entity.dbo_Login();
				UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
				if (this.idUsuario == 0)
				{
					//validar que no exista, poner visible
					try
					{
						var logi = dcGuardar.GetTable<dbo_Login>().Where(c => c.strUsuario == txtUsuario.Text);
						if (logi.Count() == 1)
						{
							lblErrorUserExist.Visible = true;
							lblErrorUserExist.Text = "El usuario ya existe";
							return;
						}
						else { lblErrorUserExist.Visible = false; lblErrorUserExist.Text = "El usuario esta disponible"; }
						logi = null;
					}
					catch (Exception _e) { throw _e; }

					login.strUsuario = this.txtUsuario.Text.Trim();
					//encriptamos la contraseña      
					var encriptacion = encriptar.Encriptartext(txtContraseña.Text);
					login.strContraseña = encriptacion;
					//se agrega solo cuando es primera vez
					//if (ddlEstadoUser.Text.Equals(string.Empty))
					//{
					//	lblMensaje.Text = "Por favor ingrese una persona primero";
					//	this.lblMensaje.Visible = true;
					//	return;
					//}
					//else {
						login.fkEstado = 1;
					//}
					//validaciones 
					if (this.txtFecha.Text.Equals(string.Empty)) {
						lblMensaje.Text = "El campo fecha no debe de estar vacio";
						this.lblMensaje.Visible = true;
						return;
					}
					//
					DateTime date = Convert.ToDateTime(this.txtFecha.Text, CultureInfo.CurrentCulture);
					login.dtFehca = date;
					//validar si ya tiene cuenta
					login.fkPersona = int.Parse(ddlPersonaCompleto.Text);
					string mensaje = string.Empty;
					if (!this.validacion(login, ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					if (!this.validacionSQL(ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					if (!this.validacionHTML(ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					var idpersona = int.Parse(ddlPersonaCompleto.Text);
					dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().InsertOnSubmit(login);
					dcGuardar.SubmitChanges();
					//Buscar el ID de usuario y se agrega a persona
					login = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().First(c => c.fkPersona == idpersona);
					persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idpersona);
					persona.fkLogin = login.id;
					dcGuardar.SubmitChanges();

					this.showMessage("El registro se agrego correctamente.");
					this.Response.Redirect("~/views/Principal/UsuarioPrincipal.aspx", false);

				}
				if(this.idUsuario>0)
				{
					login = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().First(c => c.id == idUsuario);
					login.strUsuario = this.txtUsuario.Text.Trim();
					login.strContraseña = this.txtContraseña.Text.Trim();
					login.fkEstado = int.Parse(this.ddlEstadoUser.Text);
					var encriptacion = encriptar.Encriptartext(txtContraseña.Text);
					login.strContraseña = encriptacion;

					if (this.txtFecha.Text.Equals(string.Empty))
					{
						lblMensaje.Text = "El campo fecha no debe de estar vacio";
						this.lblMensaje.Visible = true;
						return;
					}
					//^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$
					Regex patternRFC = new Regex("^([0-2][0-9]|(3)[0-1])(/)(((0)[0-9])|((1)[0-2]))(/)d{4}$");
					bool respues = patternRFC.IsMatch(txtFecha.Text.ToString());
					if (respues)
					{
						lblMensaje.Text = "La fecha no esta en formato dd/mm/yyyy";
						this.lblMensaje.Visible = true;
						return;
					}

					string mensaje = string.Empty;
					if (!this.validacion(login, ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					if (!this.validacionSQL(ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					if (!this.validacionHTML(ref mensaje))
					{
						this.lblMensaje.Text = mensaje;
						this.lblMensaje.Visible = true;
						return;

					}
					DateTime date = Convert.ToDateTime(this.txtFecha.Text, CultureInfo.CurrentCulture);
					login.dtFehca = date;
					dcGuardar.SubmitChanges();
					this.showMessage("El registro se edito correctamente.");
					this.Response.Redirect("~/views/Principal/UsuarioPrincipal.aspx", false);
				}
			} 
			catch(Exception _e) 
			{
				throw _e;
			}
		}
		public void setItem(ref DropDownList _control, String _value)
		{
			foreach (ListItem item in _control.Items)
			{
				if (item.Value == _value)
				{
					item.Selected = true;
					break;
				}
			}
			_control.Items.FindByText(_value).Selected = true;
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			try
			{
				this.Response.Redirect("~/views/Principal/UsuarioPrincipal.aspx", false);
			}
			catch (Exception _e)
			{

				this.showMessage("Ha ocurrido un error inesperado");
				Response.Redirect("~/Error.aspx", false);
			}
		}
		public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.dbo_Login _persona, ref String _mensaje)
		{
			if (_persona.strUsuario.Equals(String.Empty))
			{
				_mensaje = "El usuario es obligatorio";
				return false;
			}
			if (_persona.strContraseña.Equals(String.Empty))
			{
				_mensaje = "La contraseña es obligatoria";
				return false;
			}

			if (_persona.dtFehca.Equals(String.Empty))
			{
				_mensaje = "Fecha obligatoria";
				return false;
			}
			if (_persona.strUsuario.Length > 16)
			{
				_mensaje = "Solo se permienten 16 caracteres en Usuario";
				return false;
			}
			if (txtContraseña.Text.Length > 16)
			{
				_mensaje = "Solo se permienten 16 caracteres en contraseña";
				return false;
			}
			if (_persona.dtFehca.ToString().Length == 10)
			{
				_mensaje = "Formato no valido en fecha";
				return false;
			}
			if (_persona.strUsuario.Length < 8)
			{
				_mensaje = "El nombre de Usuario es muy corto.";
				return false;
			}
			if (this.txtContraseña.Text.Length < 8)
			{
				_mensaje = "La contraseña es muy corta.";
				return false;
			}
			//Regex contrase = new Regex("^(?=w*d)(?=w*[A-Z])(?=w*[a-z])S{8,16}$");
			//bool respues = contrase.IsMatch(txtContraseña.Text.ToString());
			//if (respues)
			//{
			//	_mensaje = "La contraseña debe tener entre 8 y 16 caracteres, un digito y al menos una mayúscula.";
			//	return false;
			//}
			return true;
		}
		public bool validacionHTML(ref String _mensaje)
		{
			CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
			string mensaheFuncion = string.Empty;
			if (valida.htmlInyectionValida(this.txtUsuario.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtUsuario))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.htmlInyectionValida(this.txtContraseña.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtContraseña))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.htmlInyectionValida(this.txtFecha.Text.Trim(), ref mensaheFuncion, "A paterno", ref this.txtFecha))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			return true;
		}
		public bool validacionSQL(ref String _mensaje)
		{
			CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
			string mensaheFuncion = string.Empty;
			if (valida.SQLInyectionValida(this.txtUsuario.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtUsuario))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.SQLInyectionValida(this.txtContraseña.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtContraseña))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.SQLInyectionValida(this.txtFecha.Text.Trim(), ref mensaheFuncion, "Apellido paterno", ref this.txtFecha))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			
			return true;
		}

	}

}