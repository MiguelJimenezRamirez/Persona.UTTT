<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
    <title>Perona Main</title>
	
	<link href="resources/PersonaM.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style type="text/css">
		.auto-style1 {
			flex: 0 0 33.333333%;
			width: 100%;
			position: relative;
			-ms-flex: 0 0 33.333333%;
			max-width: 33.333333%;
			left: 0px;
			top: 1px;
			padding-left: 15px;
			padding-right: 15px;
		}
	</style>
</head>
<body>
    <form runat="server" class="colorFondo">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class=" container well ">
        <div class="row">
            <div class="col-4">
            </div>
            <div class="col-sm-4">
                <h2>Persona Manager<h2/> 
            </div>
            <div class="col-4">
            </div>
        </div>
        <div class="row">
            <div class="col-4">
            </div>
            <div class="col-4">
                <asp:Label ID="Label3" runat="server" Text="Miguel Jimenez Ramirez"></asp:Label>
            </div>
            <div class="auto-style1">
            </div>
        </div>
        <div class="row">
            <div class="col-4">
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-4">
            </div>
        </div>
        <!--DropListOP-->
        <div class="row">
            <div class="col-xl-1 col-sm-2">
                <asp:Label ID="Label2" runat="server"  CssClass="control-label col-sm-2" Text="Label" >Sexo:</asp:Label>
            </div>
            <asp:UpdatePanel ID="upSetSession" runat="server">
                <ContentTemplate>
                    <div class="col-xl-1 col-sm-2">
                        <asp:DropDownList ID="ddlSexo" runat="server"  Height="25px" Width="253px" onselectedindexchanged="ddlSexo_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </ContentTemplate> 
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            
            
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="ddlSexo" ErrorMessage="Sexo Requerido" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
        </div>
        <!--DropListEN-->
        <!--Clave UnicaOP-->
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:Label ID="Label1" CssClass="control-label col-sm-2" runat="server"  >Clave Unica:</asp:Label>
            </div>
            <div class="col-xl-2 col-sm-2">
               <asp:TextBox ID="txtClaveUnica" CssClass="form-control" runat="server" maxlength="3" Width="249px" ViewStateMode="Disabled" pattern="[0-9]+{2,3}" oninput="maximo(this);" required onkeypress="return SoloNumeros(event)"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Clave Unica Requerida"></asp:RequiredFieldValidator>    
               </div>
            <div class="col-xl-2 col-sm-2">
               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Valor no valido" ControlToValidate="txtClaveUnica" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--Clave UnicaED-->
        <!--NombreOP-->
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:Label ID="Label4" CssClass="control-label col-sm-2" runat="server"  > Nombre:</asp:Label>
            </div>
            <div class="col-xl-2 col-sm-2">
                <asp:TextBox maxlength="15" minlength="3" ID="txtNombre" CssClass="form-control" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" required></asp:TextBox>       
            </div>
        </div>
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre Requerido"></asp:RequiredFieldValidator>
             </div>
            <div class="col-xl-2 col-sm-2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNombre" ErrorMessage="Valor no Valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>    
            </div>
            <div class="col-xl-2 col-sm-2"></div>
        </div>
        <!--NombreED-->
        <!--APaternoOP-->
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:Label ID="Label5" CssClass="control-label col-sm-2" runat="server" >A Paterno:</asp:Label>
            </div>
            <div class="col-xl-2 col-sm-2">
                <asp:TextBox maxlength="15" CssClass="form-control" minlength="3" ID="txtAPaterno" pattern="[A-Za-z\sáéíóúñÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" required></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Apellido Requerido"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-2 col-sm-2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--APaternoED-->
        <!--AMaternoOP-->
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                <asp:Label ID="Label6" CssClass="control-label col-sm-2" runat="server"  >A Materno:</asp:Label>
            </div>
            <div class="col-xl-2 col-sm-2">
                <asp:TextBox ID="txtAMaterno" CssClass="form-control" runat="server" Width="248px" maxlength="15" minlength="3" oninput="maximoNom(this);" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" ViewStateMode="Disabled" onkeypress="return SoloLetras(event)"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-2 col-sm-2">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--AMaternoED-->

    <div class="row">
        <div class="col-xl-2 col-sm-2">
                <asp:Label ID="Label7" CssClass="control-label col-sm-2"  runat="server"  >Fecha de Nacimiento</asp:Label>
         </div>
        <div class="col-xl-3 col-sm-3">
            
			<asp:ImageButton ID="imgButton" runat="server" Height="25px" ImageUrl="~/Images/Calendario.png" Width="25px" />
            <asp:TextBox ID="txtCalendar2" CssClass="form-control" runat="server"></asp:TextBox>
			<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="imgButton" PopupPosition="TopRight" TargetControlID="txtCalendar2" /> 
        </div>
    </div>
    <!--TextCaledarOP-->
    	<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCalendar2" ErrorMessage="Fecha Requerida"></asp:RequiredFieldValidator>
    <br />
    
    <!--TextCaledarED-->
    <!--NumeroHermanosOP-->
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:Label ID="Label10" CssClass="control-label col-sm-2" runat="server"  >Numero de Hermanos</asp:Label>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:TextBox ID="txtNumeroHermanos" CssClass="form-control" oninput="maximoHer(this);" pattern="[0-9]+{1,2}" maxlength="2" onkeypress="return SoloNumeros(event)" required runat="server" style="margin-left: 4px" Width="250px"></asp:TextBox>    
        </div>
    </div>
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ControlToValidate="txtNumeroHermanos" ErrorMessage="Numero de Requerido"></asp:RequiredFieldValidator>
        </div>
    </div>
    <!--NumeroHermanosED-->
    <!--CorreoElectronicoOP-->
	<div class="row">
        <div class="col-xl-2 col-sm-2">
             <asp:Label ID="Label11" CssClass="control-label col-sm-2" runat="server"  >Correo Electronico</asp:Label>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="244px"></asp:TextBox>
        </div>
    </div>
	<div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Correo Requerido"></asp:RequiredFieldValidator>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato no valido" ControlToValidate="txtCorreoElectronico" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
	</div>
	<!--CorreoElectronicoED-->
    <!--RFCOP-->
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:Label ID="Label12" CssClass="control-label col-sm-2" runat="server"  >RFC Empresa</asp:Label>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:TextBox ID="txtRFC" maxlength="13" CssClass="form-control" oninput="maximoRFC(this);" runat="server" pattern="^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$" Width="247px"></asp:TextBox>
        </div>
    </div>
	<div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC Requerido"></asp:RequiredFieldValidator>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRFC" ErrorMessage="Formato no valido " ValidationExpression="^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$"></asp:RegularExpressionValidator>
        </div>
	</div>
    <!--RFCED-->
    <!--CodigoOP-->
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:Label ID="Label13" CssClass="control-label col-sm-2" runat="server"  >Codigo Postal</asp:Label>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:TextBox ID="txtCodigoPostal" CssClass="form-control" onkeypress="return SoloNumeros(event);" pattern="^[0-5][0-9]{3}[0-9]$"  maxlength="5" oninput="maximoPstal(this);" runat="server" Width="246px"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Codigo Postal Requerido"></asp:RequiredFieldValidator>
        </div>
        <div class="col-xl-2 col-sm-2">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Formato no valido" ValidationExpression="^[0-5][0-9]{3}[0-9]$"></asp:RegularExpressionValidator>
        </div>
    </div>
	<!--CodigoED-->
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:Label ID="lblMensaje" runat="server" BackColor="White" BorderColor="Red" EnableTheming="True" ForeColor="Red" Visible="False"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" onclick="btnAceptar_Click" CssClass="btn btn-primary" ViewStateMode="Disabled" />  
        </div>
        <div class="col-2 ">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" CssClass="btn btn-danger" ViewStateMode="Disabled" />
        </div>
    </div>
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
        <br />
        </div>
    </form>
    </body>
</html>

