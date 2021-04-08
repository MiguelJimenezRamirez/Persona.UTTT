using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;

namespace UTTT.Ejemplo.Persona.views.Login
{
	public partial class Login : System.Web.UI.Page
	{
		Encriptar encriptar = new Encriptar();
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Response.Redirect("/views/Login/RecuperarContra.aspx");
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			string mensaje = string.Empty;
			if (!this.validacionSQL(ref mensaje))
			{
				this.lblError.Text = mensaje;
				this.lblError.Visible = true;
				return;

			}
			if (!this.validacionHTML(ref mensaje))
			{
				this.lblError.Text = mensaje;
				this.lblError.Visible = true;
				return;

			}
			//comprobar campos llenos
			if (txtUsuario.Text != "" && txtContraseña.Text != "")
			{
				//comprobar que el usuario exista
				try
				{
					DataContext dcGuardar = new DcGeneralDataContext();
					//error corregir
					var logic = dcGuardar.GetTable<dbo_Login>().Where(c => c.strUsuario == txtUsuario.Text);
					if (logic.Count() > 0)
					{
						var logi = dcGuardar.GetTable<dbo_Login>().FirstOrDefault(c => c.strUsuario == txtUsuario.Text);
						var contra = encriptar.DesEncriptar(logi.strContraseña);
						if (contra == txtContraseña.Text)
						{
							if (logi.fkEstado == 1)
							{
								Response.Redirect("/views/Principal/ModuloPrincipal.aspx");
							}
							else
							{
								lblError.Visible = true; lblError.Text = "El usuario no tiene permitido acceder";
							}
						}
						else { lblError.Visible = true; lblError.Text = "Credenciales incorrectas"; }
						logi = null;
					}
					else { lblError.Visible = true; lblError.Text = "Credenciales incorrectas"; }
				}
				catch (Exception _e) { throw _e; }

			}
			else { lblError.Visible = true; lblError.Text = "Llene todos los campos"; }
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
			return true;
		}
	}
}