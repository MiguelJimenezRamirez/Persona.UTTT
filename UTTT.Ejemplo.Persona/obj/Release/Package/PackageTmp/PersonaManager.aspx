<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
    <title>Perona Main</title>
    <link href="resources/PersonaManager.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
    <form runat="server">
    <div class=" container well contenedor2  ">
        <div class="row">
            <div class="col-sx-12">
                <h2>Persona Manager<h2/> 
                <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
                    <br />
                <asp:Label ID="Label3" runat="server" Text="Miguel Jimenez Ramirez"></asp:Label>
            </div>
        </div>
        
                     <asp:Label ID="Label2" runat="server" Text="Label" >Sexo:</asp:Label>
                     <asp:DropDownList ID="ddlSexo" runat="server"  Height="25px" Width="253px" onselectedindexchanged="ddlSexo_SelectedIndexChanged"></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Sexo Requerido" InitialValue="-1"></asp:RequiredFieldValidator>
        
                <br />
        
                <asp:Label ID="Label1" CssClass="control-label col-sm-2" runat="server"  >Clave Unica:</asp:Label>
                
                    <asp:TextBox ID="txtClaveUnica" CssClass="form-control" runat="server" maxlength="3" Width="249px" ViewStateMode="Disabled" pattern="[0-9]+{2,3}" oninput="maximo(this);" required onkeypress="return SoloNumeros(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Clave Unica Requerida"></asp:RequiredFieldValidator>    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Valor no valido" ControlToValidate="txtClaveUnica" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
                

 
    	<br />
                
       
     

    
     
 
   
        <asp:Label ID="Label4" CssClass="control-label col-sm-2" runat="server"  > Nombre:</asp:Label>
    <asp:TextBox maxlength="15" minlength="3" ID="txtNombre" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" required></asp:TextBox>       
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre Requerido"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNombre" ErrorMessage="Valor no Valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>    

    	<br />

   
        <asp:Label ID="Label5" CssClass="control-label col-sm-2" runat="server" >A Paterno:</asp:Label>
    <asp:TextBox maxlength="15" minlength="3" ID="txtAPaterno" pattern="[A-Za-z\sáéíóúñÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" required></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Apellido Requerido"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>

    	<br />

    
    <asp:Label ID="Label6" CssClass="control-label col-sm-2" runat="server"  >A Materno:</asp:Label>
    <asp:TextBox ID="txtAMaterno" runat="server" Width="248px" maxlength="15" minlength="3" oninput="maximoNom(this);" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" ViewStateMode="Disabled" onkeypress="return SoloLetras(event)"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>

 
    <asp:Calendar required oninput="calendar(this);" ID="dteCalendar" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="dteCalendar_SelectionChanged">
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
    <DayStyle BackColor="#CCCCCC" />
	<NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
	<OtherMonthDayStyle ForeColor="#999999" />
	<SelectedDayStyle BackColor="#333399" ForeColor="White" />
	<TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
	<TodayDayStyle BackColor="#999999" ForeColor="White" />
	</asp:Calendar>
    <br />
	<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDia" ErrorMessage="Dia Requerido"></asp:RequiredFieldValidator>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMes" ErrorMessage="Mes Requerido"></asp:RequiredFieldValidator>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAnio" ErrorMessage="Año Requerido"></asp:RequiredFieldValidator>
	<br />
	Dia
	<asp:TextBox ID="txtDia" required ENABLED="false" runat="server" maxlength="2"  oninput="maximoDia(this);" onkeypress="return SoloNumeros(event);"></asp:TextBox>
	Mes<asp:TextBox ID="txtMes" required ENABLED="false" runat="server" maxlength="2" oninput="maximoMes(this);" onkeypress="return SoloNumeros(event);"></asp:TextBox>
	Año<asp:TextBox ID="txtAnio"  required ENABLED="false" runat="server"  maxlength="4"  onkeypress="return SoloNumeros(event);"></asp:TextBox>
	<br />
	<br />
	Numero de Hermanos<asp:TextBox ID="txtNumeroHermanos"  oninput="maximoHer(this);" pattern="[0-9]+{1,2}" maxlength="2" onkeypress="return SoloNumeros(event)" required runat="server" style="margin-left: 4px" Width="250px"></asp:TextBox>    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNumeroHermanos" ErrorMessage="Numero de Requerido"></asp:RequiredFieldValidator>
    <br />
	Correo Electronico
	<asp:TextBox ID="txtCorreoElectronico" runat="server" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="244px"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Correo Requerido"></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato no valido" ControlToValidate="txtCorreoElectronico" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <br />
	RFC Empresa
	<asp:TextBox ID="txtRFC" maxlength="13" oninput="maximoRFC(this);" runat="server" pattern="^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$" Width="247px"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC Requerido"></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRFC" ErrorMessage="Formato no valido " ValidationExpression="^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$"></asp:RegularExpressionValidator>
	<br />
	Codigo Postal
	<asp:TextBox ID="txtCodigoPostal" onkeypress="return SoloNumeros(event);" pattern="^[0-5][0-9]{3}[0-9]$"  maxlength="5" oninput="maximoPstal(this);" runat="server" Width="246px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Codigo Postal Requerido"></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Formato no valido" ValidationExpression="^[0-5][0-9]{3}[0-9]$"></asp:RegularExpressionValidator>

        <br />

    	<asp:Label ID="lblMensaje" runat="server" BackColor="White" BorderColor="Red" EnableTheming="True" ForeColor="Red" Visible="False"></asp:Label>
        <br />

     <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" onclick="btnAceptar_Click" CssClass="float-end btn btn-primary" ViewStateMode="Disabled" />  
     <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" CssClass="float-end btn btn-danger" ViewStateMode="Disabled" />


    <script>
        function calendar(e) {
            console.log(e.value.day);
        }
        function SoloNumeros(evt) {
            if (window.event) {
                keynum = evt.keyCode;
            } else {
                keynum = evt.which;
            }
            if ((keynum > 47 && keynum < 58 || keynum == 8 || keynum == 13)) {
                return true;
            }else {
                alert("ingresa solo numeros");
                return false;
            }
		}
        function SoloLetras(e) {
            key = e.keyCode || e.which;
            tecla = String.fromCharCode(key).toString();
            letras = "qwertyuiopñlkjhgfdsamnbvcxzQWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóúÁÉÍÓÚ"
            especiales = [8, 13];
            tecla_especial = false
            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }
            if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                alert("Ingresa solo letras");
                return false;
            }
        }
        function maximo(obj) {
            if (obj.value.length > obj.maxlength) {
                obj.value = obj.value.slice(0, obj.maxlength);
            }
        }
		function maximoNom(obj) {
			if (obj.value.length > obj.maxlength ) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoHer(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoRFC(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoPstal(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
            }
        }
	</script>

        </div>
    </form>
    </body>
</html>
