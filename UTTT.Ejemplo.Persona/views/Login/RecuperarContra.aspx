<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContra.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.RecuperarContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
		<asp:Label ID="Label1" runat="server" Text="Recuperar Contraseña"></asp:Label>
		<br />
		<asp:Label ID="Label2" runat="server" Text="Ingresa Email"></asp:Label>
		<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
		<asp:RegularExpressionValidator ID="rxRecuContra" runat="server" ControlToValidate="txtEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Formato no valido</asp:RegularExpressionValidator>
		<br />
		<asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Email no encontrado" Visible="False"></asp:Label>
		<br />
		<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enviar" />
		<asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" />
	</form>
</body>
</html>
