<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Principal.UsuarioManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link href="../../resources/PersonaM.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	</head>
<body>
    <form id="form1" runat="server" class="colorFondo">
        <div class="container well">
			<div class="row">
				<div class="col-4">
				</div>
				<div class="col-sm-4">
					<h2>Manager Usuarios<h2/> 
				</div>
				<div class="col-4">
				</div>
			</div>
			<br />
			<div class="row">
                <asp:Label ID="Label1" runat="server" CssClass="text-center" Text="Miguel Jimenez Ramirez"></asp:Label>
	        </div>
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="Label7" runat="server" CssClass="control-label col-sm-2" Text="Nombre:"></asp:Label>
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:TextBox ID="txtPersona" runat="server"  CssClass="form-control" OnClientClick="return comprueba();" Enabled="False"></asp:TextBox>
					<asp:DropDownList ID="ddlPersonaCompleto" runat="server"  CssClass="btn btn-secondary dropdown-toggle" Height="40px" Width="255px"></asp:DropDownList> 
                </div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="Label2" CssClass="control-label col-sm-2" runat="server" Text="Usuario"></asp:Label>
				</div>	
				<div class="col-xl-3 col-sm-2">
					<asp:TextBox ID="txtUsuario" CssClass="form-control" maxlength="30" runat="server"></asp:TextBox>
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="lblErrorUserExist" runat="server" CssClass="control-label col-sm-2" ForeColor="Red" Text="El usuario ya existe" Visible="False"></asp:Label>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="Label3" runat="server" CssClass="control-label col-sm-2" Text="Contraseña:"></asp:Label>
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:TextBox ID="txtContraseña" type="password" CssClass="form-control" maxlength="30" OnClientClick="return comprueba();" runat="server"></asp:TextBox>
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContraseña" ErrorMessage="La contraseña debe tener entre 8 y 16 caracteres, un digito y al menos una mayúscula." ValidationExpression="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"></asp:RegularExpressionValidator>
					<br />
					<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContraseña" ControlToValidate="txtContraCompa" ErrorMessage="Los campos no son iguales"></asp:CompareValidator>
					<br />
				</div>
			</div>
			<!--imagenes-->
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="Label4" runat="server" CssClass="control-label col-sm-2" Text="Repite Contraseña:"></asp:Label>
				</div>	
				
				<div class="col-xl-3 col-sm-2">
					<asp:TextBox ID="txtContraCompa" type="password" CssClass="form-control" runat="server"></asp:TextBox>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="llblEstadoUsu" CssClass="control-label col-sm-2" runat="server" Text="Estado de Usuario"></asp:Label>
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:DropDownList ID="ddlEstadoUser"  CssClass="btn btn-secondary dropdown-toggle" Height="40px" Width="249px" runat="server"></asp:DropDownList>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="Label6" runat="server"  CssClass="control-label col-sm-2" Text="Fecha de Ingreso:"></asp:Label>
				</div>	
				<div class="col-xl-3 col-sm-2">
					<asp:ImageButton ID="boton1" runat="server" Height="25px" ImageUrl="~/Images/Calendario.png" Width="25px" />
					<asp:TextBox ID="txtFecha" maxlength="10" CssClass="form-control" OnClientClick="return comprueba();" runat="server"></asp:TextBox>
					<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="boton1" PopupPosition="BottomRight" TargetControlID="txtFecha" />
				</div>
				<div class="col-xl-3 col-sm-2">
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFecha" ErrorMessage="El formato de fecha no es el correcto" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-sm-2">
					<asp:Label ID="lblMensaje" runat="server"  CssClass="control-label col-sm-2" Visible="False"></asp:Label>
				</div>
			</div>
				<asp:ScriptManager ID="ScriptManager1" runat="server">
				</asp:ScriptManager>
			<div class="row">
				<div class="col-2">
					<asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="Button1_Click" />
				</div>
				<div class="col-2">
					<asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancelar" OnClick="Button2_Click" />
				</div>
			</div>
        </div>
    </form>
</body>
	<script>
		function comprueba() {
			var elemento = document.getElementById("txtUsuario").value
			var elemento1 = document.getElementById("txtContraseña").value
			var elemento3 = document.getElementById("txtFecha").value
			if (elemento == "") {
				alert("Nombre de Usuario Obligatorio")
				return false
			} else if (elemento1 == "") {
				alert("Contraseña obligatoria")
				return false
			}  else if (elemento3 == "") {
				alert("Fecha obligatoria")
				return false
			}
		}
	</script>
</html>
