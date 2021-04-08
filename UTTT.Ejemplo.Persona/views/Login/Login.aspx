<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	Login<br />
			Usuario<asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
			<br />
			Password:<asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
			<br />
			<asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Las credenciales no coinciden" Visible="False"></asp:Label>
			<br />
			<asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
			<asp:Button ID="btnRecuperar" runat="server" Text="Recuperar Contraseña" OnClick="Button1_Click" />
			<br />
        </div>
    </form>
	<p>
		&nbsp;</p>
</body>
</html>
