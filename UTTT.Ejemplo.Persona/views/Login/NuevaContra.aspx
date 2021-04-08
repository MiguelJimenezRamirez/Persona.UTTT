<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevaContra.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.NuevaContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Ingresa contraseña"></asp:Label>
			<br />
			<asp:Label ID="Label4" runat="server" Text="Nombre:"></asp:Label>
			<asp:Label ID="lblNombre" runat="server" Text="lblNombre"></asp:Label>
			<br />
			<asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
			<asp:TextBox ID="txtContra" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContra" ErrorMessage="La contraseña debe tener entre 8 y 16 caracteres, un digito y al menos una mayúscula." ValidationExpression="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"></asp:RegularExpressionValidator>
			<br />
			<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContra" ControlToValidate="txtContraNueva" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
			<br />
			<asp:Label ID="Label3" runat="server" Text="Confirma Contraseña"></asp:Label>
			<asp:TextBox ID="txtContraNueva" runat="server"></asp:TextBox>
			<br />
			<asp:Label ID="lblError" runat="server" ForeColor="Red" Text="lblError" Visible="False"></asp:Label>
			<br />
			<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Aceptar" />
        </div>
    </form>
</body>
</html>
