using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;

namespace UTTT.Ejemplo.Persona.views.Login
{
	public partial class RecuperarContra : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			//aqui validamos que exista
			DataContext dcGuardar = new DcGeneralDataContext();
			//validar sql y html
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
			//busca al usuario del Email
			var persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(c => c.strCorreoElectronico == txtEmail.Text);
			if (txtEmail.Text != "")
			{
				if (persona.Count() < 1)
				{ lblError.Text = "El correo no corresponde a ningun usuario"; lblError.Visible = true; }
				else
				{
					var persona2 = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().FirstOrDefault(c => c.strCorreoElectronico == txtEmail.Text);
					if (persona2.strCorreoElectronico == txtEmail.Text)
					{
						var idPersona = persona2.id;
						//lblError.Text = "Lo encontro y el id es: " + idPersona;
						EnviarEmail(txtEmail.Text, idPersona);
						Response.Redirect("/views/Login/EnvioExitoso.aspx");
					}
					else
					{
						lblError.Visible = true;
					}
				}
			}
			else { lblError.Text = "Ingrese su correo"; lblError.Visible = true; }
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("/views/Login/Login.aspx");
		}
		public void EnviarEmail(string email, int idPersonaa)
		{
			//aqui la url																				
			string body = "<p>" + "Programa: Miguel Jimenez Ramirez. Solicitud de cambio de contraseña, http://www.utttejemplopersona.somee.com/views/Login/NuevaContra.aspx/?id=" + idPersonaa+"<p>";
			string emailOrigen = "18301044@uttt.edu.mx";
			string emailDestino = email;
			string constrase = "Maldito007.10";
			MailMessage oMailMessage = new MailMessage(emailOrigen, emailDestino, "Solicitud de cambio de contraseña", body);

			oMailMessage.IsBodyHtml = true;

			SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
			oSmtpClient.EnableSsl = true;
			oSmtpClient.UseDefaultCredentials = false;
			//oSmtpClient.Host = "smpt.gmail.com";
			oSmtpClient.Port = 587;
			oSmtpClient.Credentials = new System.Net.NetworkCredential(emailOrigen, constrase);

			oSmtpClient.Send(oMailMessage);
			oSmtpClient.Dispose();
			// smtp.Send(mail);
		}
		public bool validacionHTML(ref String _mensaje)
		{
			CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
			string mensaheFuncion = string.Empty;
			if (valida.htmlInyectionValida(this.txtEmail.Text.Trim(), ref mensaheFuncion, "Email", ref this.txtEmail))
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
			if (valida.SQLInyectionValida(this.txtEmail.Text.Trim(), ref mensaheFuncion, "Email", ref this.txtEmail))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			return true;
		}
	}
}