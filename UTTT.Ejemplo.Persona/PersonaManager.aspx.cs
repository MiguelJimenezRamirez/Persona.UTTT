﻿#region Using

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Text.RegularExpressions;
using System.Net.Mail;
#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }
                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList(); 
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";

                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;

                    List<CatEstadoCivil> listaEstadoCivil = dcGlobal.GetTable<CatEstadoCivil>().ToList();
                    this.ddlEstadoCivil.DataTextField = "strValor";
                    this.ddlEstadoCivil.DataValueField = "id";
                    if (this.idPersona == 0)
                    {
                        lblAccion.Text = "Agregar";
                        txtCalendar2.Text = DateTime.Now.ToString("dd/MM/yyyy");
                        CatSexo catSexo = new CatSexo();
                        catSexo.id = -1;
                        catSexo.strValor = "Seleccionar ";
                        lista.Insert(0, catSexo);
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();
                        this.ddlEstadoCivil.DataSource = listaEstadoCivil;
                        this.ddlEstadoCivil.DataBind();
                    }
                    else
                    {
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();
                        this.setItem(ref this.ddlSexo, this.baseEntity.CatSexo.strValor);
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);

                        DateTime? date = this.baseEntity.dtFechaDNaci;
                        this.txtCalendar2.Text = date.ToString().Split(' ')[0];
                        this.txtNumeroHermanos.Text = this.baseEntity.intNumHermano.ToString();
                        this.txtCorreoElectronico.Text = this.baseEntity.strCorreoElectronico;
                        this.txtCodigoPostal.Text = this.baseEntity.strCodigoP;
                        this.txtRFC.Text = this.baseEntity.strRFC;
                        //cat estado civil
                        if (baseEntity.CatEstadoCivil == null) 
                        {
                            CatEstadoCivil catEstadoCivilTemp = new CatEstadoCivil();
                            catEstadoCivilTemp.id = -1;
                            catEstadoCivilTemp.strValor = "Seleccionar";
                            listaEstadoCivil.Insert(0,catEstadoCivilTemp);
                        }
                        this.ddlEstadoCivil.DataSource = listaEstadoCivil;
                        this.ddlEstadoCivil.DataBind();
                        if (baseEntity.CatEstadoCivil != null) 
                        {
                            this.setItem(ref this.ddlEstadoCivil, baseEntity.CatEstadoCivil.strValor);
                        }  
                    }
                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;
                    this.ddlEstadoCivil.SelectedIndexChanged += new EventHandler(ddlEstadoCivil_SelectedIndexChanged);
                    this.ddlEstadoCivil.AutoPostBack = true;

                }

            }
            catch (Exception _e)
            {
                error(_e.ToString());
                Response.Redirect("~/Error.aspx" ,false);
                //this.showMessage("Ha ocurrido un problema al cargar la página");
                //this.Response.Redirect("~/PersonaPrincipal.aspx", false);
				//error(_e.ToString());
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                if (this.idPersona == 0)
                {
                    //agrega
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    persona.idCatEstadoCivil = int.Parse(this.ddlEstadoCivil.Text);
                    //El calendar
                    //DateTime dateTime = Convert.ToDateTime(txtMes.Text + "/" + txtDia.Text + "/" + txtAnio.Text, CultureInfo.InvariantCulture);
                    DateTime dateTime = Convert.ToDateTime(txtCalendar2.Text, CultureInfo.CurrentCulture);
                    persona.dtFechaDNaci = dateTime;


                    //agregar hermanos
                    persona.intNumHermano = int.Parse(this.txtNumeroHermanos.Text);
                    //Correo Electronico
                    persona.strCorreoElectronico = this.txtCorreoElectronico.Text.Trim();
                    //Codigo postal
                    persona.strCodigoP = this.txtCodigoPostal.Text;
                    //RFC
                    persona.strRFC = this.txtRFC.Text.Trim();
                    //Funcionalidad para hermanos
                    persona.intNumHermano = !this.txtNumeroHermanos.Text.Equals(string.Empty) ?
                        int.Parse(this.txtNumeroHermanos.Text) : 0;
                    string mensaje = string.Empty;
                    if (!this.validacion(persona, ref mensaje)) {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;

                    }
                    if (!this.validacionSQL( ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;

                    }
                    if (!this.validacionHTML( ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;

                    }

                    dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se agrego correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                    
                }
                if (this.idPersona > 0)
                {
                    //edita ou<
                    persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    persona.idCatEstadoCivil = int.Parse(this.ddlEstadoCivil.Text);
                    //El calendar
                    //DateTime dtStart = DateTime.Parse(txtCalendar2.Text);
                    DateTime dateTime = DateTime.Parse(txtCalendar2.Text);
                    persona.dtFechaDNaci = dateTime;
                    //agregar hermanos
                    persona.intNumHermano =  int.Parse(this.txtNumeroHermanos.Text);
                    //Correo Electronico
                    persona.strCorreoElectronico = this.txtCorreoElectronico.Text.Trim();
                    //Codigo postal
                    persona.strCodigoP = this.txtCodigoPostal.Text;
                    //RFC
                    persona.strRFC = this.txtRFC.Text.Trim();
                    string mensaje = string.Empty;
                    if (!this.validacion(persona, ref mensaje))
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
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se edito correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                }
            }
            catch (Exception _e)
            {
                string datoAcara = _e.ToString()+ ". Clave unica: "+txtClaveUnica.Text+". Nombre: "+txtNombre.Text+". NombreP: "+txtAPaterno.Text+". NombreM: "+txtAMaterno.Text
                    +". Numero Hermanos: "+txtNumeroHermanos.Text+". Correo: "+txtCorreoElectronico.Text+". RFC: "+" Fecha: "+txtCalendar2.Text+ txtRFC.Text+". Codigo: "+txtCodigoPostal.Text;
                this.showMessageException(_e.Message);
                error(datoAcara.ToString());
               // Response.Redirect("~/Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {           
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                
                this.showMessage("Ha ocurrido un error inesperado");
                error(_e.ToString());
                Response.Redirect("~/Error.aspx", false);
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();            
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception _e)
            {

                this.showMessage("Ha ocurrido un error inesperado");
                error(_e.ToString());
                Response.Redirect("~/Error.aspx", false);
            }
        }
        protected void ddlEstadoCivil_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idEstado = int.Parse(this.ddlEstadoCivil.Text);
                Expression<Func<CatEstadoCivil, bool>> predicateEstado = c => c.id == idEstado;
                predicateEstado.Compile();
                List<CatEstadoCivil> lista = dcGlobal.GetTable<CatEstadoCivil>().Where(predicateEstado).ToList();
                CatEstadoCivil catTemp = new CatEstadoCivil();
                this.ddlEstadoCivil.DataTextField = "strValor";
                this.ddlEstadoCivil.DataValueField = "id";
                this.ddlEstadoCivil.DataSource = lista;
                this.ddlEstadoCivil.DataBind();
            }
            catch (Exception _e)
            {

                this.showMessage("Ha ocurrido un error inesperado");
                error(_e.ToString());
                Response.Redirect("~/Error.aspx", false);
            }
        }

        #endregion
        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje) {
            if (_persona.idCatSexo.Equals(-1)) {
                _mensaje = "seleccione el sexo";
                return false;
            }
            if (_persona.strClaveUnica.Equals(String.Empty)) {
                _mensaje = "clave es obligatorio";
            }
            if (_persona.strClaveUnica.Length != 3) {
                _mensaje = "clave unica no valida";
                return false;
            }

            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "Nombre esta vacio";
                return false;
            }
            if (_persona.strNombre.Length > 50) {
                _mensaje = "Solo se permienten 50 caracteres en Nombre";
                return false;
            }
            bool resultadoNom = Regex.IsMatch(_persona.strNombre,@"[a-zA-Z]+$");
            if (!resultadoNom) {
                _mensaje = "Solo se permienten Letras en nombre";
                return false;
            }

            if (_persona.strAPaterno.Equals(String.Empty)) {
                _mensaje = "Apellido paterno esta Vacio";
                return false;
            }
            if (_persona.strAPaterno.Length>50) {
                _mensaje = "Solo se permienten 50 caracteres en Apellido Paterno";
                return false;
            }
            if (_persona.strAMaterno.Length>50) {
                _mensaje = "Solo se permienten 50 caracteres en Apellido Materno";
                return false;
            }
            bool resultadoAp = Regex.IsMatch(_persona.strAPaterno, @"[a-zA-Z]+$");
            if (!resultadoAp)
            {
                _mensaje = "Solo se permienten Letras en Apellido Paterno";
                return false;
            }
            if (_persona.strAMaterno.Length>0) {
                bool resultadoAm = Regex.IsMatch(_persona.strAMaterno, @"[a-zA-Z]+$");
                if (!resultadoAm)
                {
                    _mensaje = "Solo se permienten Letras en Apellido Materno";
                    return false;
                } 
            }
            //int diaNaci = int.Parse(txtDia.Text);
            //int mesNaci = int.Parse(txtMes.Text);
            //int anioNaci = int.Parse(txtAnio.Text);
            DateTime dtStart = DateTime.Parse(txtCalendar2.Text);
            TimeSpan sp = DateTime.Now - dtStart;
            double edadC = 18 * 365.3;
            if (sp.Days <edadC )
            {
                _mensaje = "No se admiten menores de edad";
                return false;
            }

        //  DateTime fechaNaci = new DateTime(anioNaci, mesNaci, diaNaci);
        //    double edad = (DateTime.Now.Subtract(fechaNaci).Days/365.3);
        //    if (edad < 18) {
        //        _mensaje = "No se admiten menores de edad";
        //        return false;
        //    }
            
            if (_persona.intNumHermano > 20 ) {
                _mensaje = "Numero de hermanos no valido";
                return false;
            }
            if (_persona.intNumHermano<0) {
                _mensaje = "Numero de hermanos no valido";
                return false;
            }
            if (_persona.intNumHermano.ToString() == "" ) {
                _mensaje = "El campo Numero de hermanos es requerido ";
                return false;
            }
			if (_persona.strCorreoElectronico.Equals(String.Empty) ) {
                _mensaje = "El campo Correo Electronico es requerido ";
                return false;
            }
			//Validar Email
			Regex patternCorreo = new Regex("w+([-+.']w+)*@w+([-.]w+)*.w+([-.]w+)*");
            bool respuesta = patternCorreo.IsMatch(_persona.strCorreoElectronico.ToString()); 
            if (respuesta)
			{
                _mensaje = "Formato no admitido para Email";
                return false;
            }

			
            if (_persona.strCodigoP.ToString().Equals(String.Empty))
            {
                _mensaje = "El campo Codigo postal es requerido ";
                return false;
            }
			//Regex patternCDP = new Regex("^[0-5][0-9]{3}[0-9]$");
			//bool respuesCDP = patternCDP.IsMatch(_persona.strCodigoP.ToString());
			//if (respuesCDP)
			//{
			//	_mensaje = "Formato no admitido para Codigo Postal";
			//	return false;
			//}

			//Validar RFC
			if (_persona.strRFC.Equals(String.Empty))
            {
                _mensaje = "El campo RFC es requerido ";
                return false;
            }
                                        
            Regex patternRFC = new Regex("^[a-zA-Z]{3,4}(d{6})((D|d){2,3})?$");
            bool respues = patternRFC.IsMatch(_persona.strRFC.ToString());
            if (respues)
			{
                _mensaje = respuesta.ToString();
                return false;
            }
            
			//
			
            //Regex patternCodigoP = new Regex("^[0-5][1-9]{3}[0-9]$");
            //bool menCP = ;
            //if (patternCodigoP.IsMatch(_persona.intCodigoPostal.ToString()))
            //{
            //    _mensaje = "Formato no admitido para Codigo Postal";
            //    return false;
            //}

            return true;
        }
        public bool validacionHTML( ref String _mensaje) {
            CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
            string mensaheFuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtClaveUnica))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtNombre.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensaheFuncion, "A paterno", ref this.txtAPaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensaheFuncion, "A Materno", ref this.txtAMaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensaheFuncion, "A Materno", ref this.txtAMaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCalendar2.Text.Trim(), ref mensaheFuncion, "Dia", ref this.txtCalendar2))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            //if (valida.htmlInyectionValida(this.txtMes.Text.Trim(), ref mensaheFuncion, "Mes", ref this.txtMes))
            //{
            //    _mensaje = mensaheFuncion;
            //    return false;
            //}
            //if (valida.htmlInyectionValida(this.txtAnio.Text.Trim(), ref mensaheFuncion, "Año", ref this.txtAnio))
            //{
            //    _mensaje = mensaheFuncion;
            //    return false;
            //}
            if (valida.htmlInyectionValida(this.txtNumeroHermanos.Text.Trim(), ref mensaheFuncion, "Numero Hermanos", ref this.txtNumeroHermanos))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCorreoElectronico.Text.Trim(), ref mensaheFuncion, "Correo Electronico", ref this.txtCorreoElectronico))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtRFC.Text.Trim(), ref mensaheFuncion, "RFC", ref this.txtRFC))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensaheFuncion, "Codigo Posgal", ref this.txtCodigoPostal))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            return true;
        }
        public bool validacionSQL( ref String _mensaje) 
        {
            CtrlvalidaInyeccion valida = new CtrlvalidaInyeccion();
            string mensaheFuncion = string.Empty;
            if (valida.SQLInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensaheFuncion, "Clave Unica", ref this.txtClaveUnica))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtNombre.Text.Trim(), ref mensaheFuncion, "Nombre", ref this.txtNombre)) 
                {
                _mensaje = mensaheFuncion;
                return false;
                }
            if (valida.SQLInyectionValida(this.txtAPaterno.Text.Trim(), ref mensaheFuncion, "Apellido paterno", ref this.txtAPaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtAMaterno.Text.Trim(), ref mensaheFuncion, "Apellido Materno", ref this.txtAMaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtAMaterno.Text.Trim(), ref mensaheFuncion, "Apellido Materno", ref this.txtAMaterno))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
			if (valida.SQLInyectionValida(this.txtCalendar2.Text.Trim(), ref mensaheFuncion, "Dia", ref this.txtCalendar2))
			{
				_mensaje = mensaheFuncion;
				return false;
			}
			//if (valida.SQLInyectionValida(this.txtMes.Text.Trim(), ref mensaheFuncion, "Mes", ref this.txtMes))
			//{
			//    _mensaje = mensaheFuncion;
			//    return false;
			//}
			//if (valida.SQLInyectionValida(this.txtAnio.Text.Trim(), ref mensaheFuncion, "Año", ref this.txtAnio))
			//{
			//    _mensaje = mensaheFuncion;
			//    return false;
			//}
			if (valida.SQLInyectionValida(this.txtNumeroHermanos.Text.Trim(), ref mensaheFuncion, "Hermanos", ref this.txtNumeroHermanos))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtCorreoElectronico.Text.Trim(), ref mensaheFuncion, "Correo", ref this.txtCorreoElectronico))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtRFC.Text.Trim(), ref mensaheFuncion, "RFC", ref this.txtRFC))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            if (valida.SQLInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensaheFuncion, "Codigo postal", ref this.txtCodigoPostal))
            {
                _mensaje = mensaheFuncion;
                return false;
            }
            return true;
        }
        public void error(string error)
        {
            string body = "<p>"+error+"<p>";
            string emailOrigen = "18301044@uttt.edu.mx";
            string emailDestino = "18301044@uttt.edu.mx";
            string constrase = "Maldito007.10";
            MailMessage oMailMessage = new MailMessage(emailOrigen, emailDestino,"Error en servidor UTTT",body);
            
            oMailMessage.IsBodyHtml = true;

            SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
            oSmtpClient.EnableSsl = true;
            oSmtpClient.UseDefaultCredentials = false;
            //oSmtpClient.Host = "smpt.gmail.com";
            oSmtpClient.Port = 587;
            oSmtpClient.Credentials = new System.Net.NetworkCredential(emailOrigen,constrase);

            oSmtpClient.Send(oMailMessage);
            oSmtpClient.Dispose();
           // smtp.Send(mail);
        }


        #region   

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

		#endregion

		//protected void dteCalendar_SelectionChanged(object sender, EventArgs e)
		//{
  //          txtDia.Text = dteCalendar.SelectedDate.Day.ToString();
  //          txtMes.Text = dteCalendar.SelectedDate.AddDays(7).Month.ToString();
  //          txtAnio.Text = dteCalendar.SelectedDate.AddDays(7).Year.ToString();
           
		//}

		protected void txtClaveUnica_TextChanged(object sender, EventArgs e)
		{

		}
	}
}