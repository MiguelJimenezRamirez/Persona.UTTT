<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContra.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.RecuperarContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link href="../../css/cssLogin.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"  />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
	<div id="Contenedor">
		<div class="text-center">
                    <!--Icono de usuario-->
                   <h1 class="text-center">Recuperar Contraseña</h1>
		</div>
		<div class="ContentForm">
		<form id="form1" runat="server">
		<br />
		<h3 ID="Label2" runat="server" CssClass="control-label col-sm-4 text-center" >Ingresa Email</h3>
		<asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
		<asp:RegularExpressionValidator ID="rxRecuContra" runat="server" ControlToValidate="txtEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Formato no valido</asp:RegularExpressionValidator>
		<br />
		<asp:Label ID="lblError" runat="server"  ForeColor="Red" Text="Email no encontrado" Visible="False"></asp:Label>
		<br />
		<asp:Button ID="Button1" runat="server" Cssclass="btn btn-lg btn-primary btn-block btn-signin" OnClick="Button1_Click" Text="Enviar" />
		<asp:Button ID="Button2" runat="server" Text="Cancelar" Cssclass="btn btn-lg btn-danger btn-block btn-signin" OnClick="Button2_Click" />
		</form>
			</div>

	</div>
</body>
</html>
