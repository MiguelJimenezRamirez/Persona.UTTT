using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTTT.Ejemplo.Persona.views.Principal
{
	public partial class ModuloPrincipal : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
		{
			//persona
			Response.Redirect("/PersonaPrincipal.aspx");
		}

		protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
		{
			//usuario
			Response.Redirect("/views/Principal/UsuarioPrincipal.aspx");
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Response.Redirect("/views/Login/Login.aspx");
		}
	}
}