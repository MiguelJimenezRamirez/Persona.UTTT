<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevaContra.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.NuevaContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link href="../../css/cssLogin.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"  />
</head>
<body>
	<div id="Contenedor">
    <form id="form1" runat="server">
       <div class="text-center">
                    <!--Icono de usuario-->
                   <h2>Ingresa Contraseña</h2>
		</div>
			<div class="ContentForm">
			
			<asp:Label ID="Label4" runat="server" CssClass="control-label col-sm-4 text-center" Text="Nombre:"></asp:Label>
				
			<asp:Label ID="lblNombre" CssClass="control-label col-sm-4 text-center" runat="server" Text="lblNombre"></asp:Label>
			<br />
			<asp:Label ID="Label2" runat="server" CssClass="control-label col-sm-4 text-center" Text="Contraseña"></asp:Label>
			<asp:TextBox type="password" CssClass="form-control" ID="txtContra" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContra" ErrorMessage="La contraseña debe tener entre 8 y 16 caracteres, un digito y al menos una mayúscula." ValidationExpression="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"></asp:RegularExpressionValidator>
			<br />
			<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContra" ControlToValidate="txtContraNueva" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
			<br />
			<asp:Label ID="Label3" runat="server" CssClass="control-label text-center" Text="Confirma Contraseña"></asp:Label>
			<asp:TextBox ID="txtContraNueva" type="password" CssClass="form-control" runat="server"></asp:TextBox>
			<br />
			<asp:Label ID="lblError" runat="server" CssClass="control-label col-sm-4 text-center" ForeColor="Red" Text="lblError" Visible="False"></asp:Label>
			<br />
			<asp:Button ID="Button1" runat="server" Cssclass="btn btn-lg btn-primary btn-block btn-signin" OnClick="Button1_Click" Text="Aceptar" />
			</div>
    </form>
		</div>
</body>
</html>
