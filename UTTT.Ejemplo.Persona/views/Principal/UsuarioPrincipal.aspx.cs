using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona.views
{
	public partial class UsuarioPrincipal : System.Web.UI.Page
	{
		#region variables
		private SessionManager session = new SessionManager();
		#endregion
		protected void Page_Load(object sender, EventArgs e)
		{
			try 
			{
				//ejemplo
				//List<CatSexo> lista = dcTemp.GetTable<CatSexo>().ToList();
				//CatSexo catTemp = new CatSexo();
				//catTemp.id = -1;
				////catTemp.strValor = "Todos";
				////lista.Insert(0, catTemp);
				//this.ddlSexo.DataTextField = "strValor";
				//this.ddlSexo.DataValueField = "id";
				//this.ddlSexo.DataSource = lista;
				//this.ddlSexo.DataBind();

				DataContext dcTemp = new DcGeneralDataContext();
				List<dbo_EstadoLogin> lista = dcTemp.GetTable<dbo_EstadoLogin>().ToList();
				dbo_EstadoLogin caTmp = new dbo_EstadoLogin();
				caTmp.id = -1;
				caTmp.strNombre = "Todos";
				lista.Insert(0,caTmp);
				this.ddlEstadoUser.DataTextField = "strNombre";
				this.ddlEstadoUser.DataValueField = "id";
				this.ddlEstadoUser.DataSource = lista;
				this.ddlEstadoUser.DataBind();
			} 
			catch (Exception _e)
			{
				this.showMessage("Ha ocurrido un problema al cargar la página");
				throw _e;
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				this.session.Pantalla = "~/views/Principal/UsuarioManager.aspx";
				Hashtable parametrosRagion = new Hashtable();
				parametrosRagion.Add("idUsuario", "0");
				this.session.Parametros = parametrosRagion;
				this.Session["SessionManager"] = this.session;
				this.Response.Redirect(this.session.Pantalla, false);
			}
			catch (Exception _e)
			{
				this.showMessage("Ha ocurrido un problema al agregar");
			}
		}

		protected void DataSourceUsuario_Selecting(object sender, LinqDataSourceSelectEventArgs e)
		{
			try
			{
				DataContext dcConsulta = new DcGeneralDataContext();
				bool nombreBool = false;
				if (!this.txtNomUsuario.Text.Equals(String.Empty))
				{
					nombreBool = true;
				}

				Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login, bool>>
					predicate =
					(c =>
					((nombreBool) ? (((nombreBool) ? c.strUsuario.Contains(this.txtNomUsuario.Text.Trim()) : false)) : true)
					);

				predicate.Compile();

				List<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login> listaPersona =
					dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().Where(predicate).ToList();
				e.Result = listaPersona;
			}
			catch (Exception _e)
			{
				throw _e;
			}
		}

		protected void Button2_Click(object sender, EventArgs e)
		{

			Response.Redirect("/views/Principal/ModuloPrincipal.aspx");
		}

		protected void dgvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
		protected void dgvPersonas_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				int idPersona = int.Parse(e.CommandArgument.ToString());
				switch (e.CommandName)
				{
					case "Editar":
						this.editar(idPersona);
						break;
					case "Eliminar":
						this.eliminar(idPersona);
						break;
				}
			}
			catch (Exception _e) { throw _e; }
		}
		private void editar(int _idUsuario)
		{
			try
			{
				Hashtable parametrosRagion = new Hashtable();
				parametrosRagion.Add("idUsuario", _idUsuario.ToString());
				this.session.Parametros = parametrosRagion;
				this.Session["SessionManager"] = this.session;
				this.session.Pantalla = String.Empty;
				this.session.Pantalla = "~/views/Principal/UsuarioManager.aspx";
				this.Response.Redirect(this.session.Pantalla, false);

			}
			catch (Exception _e)
			{
				throw _e;
			}
		}

		private void eliminar(int _idUsuario)
		{
			try
			{
				//elimina fk de persona
				DataContext dcGuardar = new DcGeneralDataContext();
				UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
				persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.fkLogin == _idUsuario);
				persona.fkLogin = null;
				dcGuardar.SubmitChanges();
				//elimina registro
				DataContext dcDelete = new DcGeneralDataContext();
				UTTT.Ejemplo.Linq.Data.Entity.dbo_Login login = dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().First(
					c => c.id == _idUsuario);
				dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().DeleteOnSubmit(login);
				dcDelete.SubmitChanges();
				this.showMessage("El registro se agrego correctamente.");
				this.DataSourcesUsuario.RaiseViewChanged();

			}
			catch (Exception _e)
			{
				throw _e;
			}
		}

		protected void txtNomUsuario_TextChanged(object sender, EventArgs e)
		{
			ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "", "", true);
		}

		protected void Button3_Click(object sender, EventArgs e)
		{
			try
			{
				this.DataSourcesUsuario.RaiseViewChanged();
			}
			catch (Exception _e)
			{
				this.showMessage("Ha ocurrido un problema al buscar");
			}
		}
		protected void ddlEstado_SelectedIndexChanged1(object sender, LinqDataSourceSelectEventArgs e) 
		{
			try
			{
				DataContext dcConsulta = new DcGeneralDataContext();
				//bool nombreBool = false;
				bool sexoBool = false;

				if (this.ddlEstadoUser.Text != "-1")
				{
					sexoBool = true;
				}

				Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Persona, bool>>
					predicate =
					(c =>
					((sexoBool) ? c.idCatSexo == int.Parse(this.ddlEstadoUser.Text) : true));

				predicate.Compile();

				List<UTTT.Ejemplo.Linq.Data.Entity.Persona> listaPersona =
					dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(predicate).ToList();
				e.Result = listaPersona;
			}
			catch (Exception _e)
			{
				throw _e;
			}
		}
		protected void DataSourcePersona_Selecting(object sender, LinqDataSourceSelectEventArgs e)
		{
			try
			{
				DataContext dcConsulta = new DcGeneralDataContext();
				bool nombreBool = false;
				bool estadoBool = false;
				if (!this.txtNomUsuario.Text.Equals(String.Empty))
				{
					nombreBool = true;

				}
				if (this.ddlEstadoUser.Text != "-1")
				{
					estadoBool = true;
				}

				Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login, bool>>
					predicate =
					(c =>
					((nombreBool) ? (((nombreBool) ? c.strUsuario.Contains(this.txtNomUsuario.Text.Trim()) : false)) : true) &&
					((estadoBool) ? c.fkEstado == int.Parse(this.ddlEstadoUser.Text) : true));
				predicate.Compile();

				List<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login> listaPersona =
					dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.dbo_Login>().Where(predicate).ToList();
				e.Result = listaPersona;
			}
			catch (Exception _e)
			{
				throw _e;
			}
		}

		protected void ddlEstadoUser_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
	}
}