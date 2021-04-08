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
	public partial class NuevaContra : System.Web.UI.Page
	{
		int id;
		
		protected void Page_Load(object sender, EventArgs e)
		{
			DataContext dcGuardar = new DcGeneralDataContext();
			id = int.Parse(Convert.ToString(Request.QueryString["id"]));
			var logi = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().FirstOrDefault(c => c.id == id);
			lblNombre.Visible = true;
			lblNombre.Text =logi.strNombre+" "+logi.strAMaterno;
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			DataContext dcGuardar = new DcGeneralDataContext();
			//validaciones
			var logi = dcGuardar.GetTable<dbo_Login>().FirstOrDefault(c => c.fkPersona == id);
			string mensaje = string.Empty;
			if (txtContra.Text != "")
			{
				Encriptar encriptar = new Encriptar();
				//encriptar
				var encriptacion = encriptar.Encriptartext(txtContra.Text);
				logi.strContraseña = encriptacion;
				
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

				dcGuardar.SubmitChanges();
				this.Response.Redirect("~/views/Login/Login.aspx", false);
			}
			else { lblError.Visible = true; lblError.Text = "Rellene todos los campos"; }
			
		}
		//validaciones
		public bool validacionHTML(ref String _mensaje)
		{
			CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
			string mensaheFuncion = string.Empty;
			if (valida.htmlInyectionValida(this.txtContra.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtContra))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.htmlInyectionValida(this.txtContraNueva.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtContraNueva))
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
			if (valida.SQLInyectionValida(this.txtContra.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtContra))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			if (valida.SQLInyectionValida(this.txtContraNueva.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtContraNueva))
			{
				_mensaje = mensaheFuncion;
				return false;
			}

			return true;
		}

	}
}