<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuloPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Principal.ModuloPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<asp:Label ID="Label1" runat="server" Text="Persona"></asp:Label>
			<asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label3" runat="server" Text="Usuario"></asp:Label>
			<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Salir" />
        	<br />
			<br />
			<br />
			<asp:ImageButton ID="ImageButton1" runat="server" Height="306px" ImageUrl="~/Images/People_Business-08.png" OnClick="ImageButton1_Click" Width="283px" />
			<asp:ImageButton ID="ImageButton2" runat="server" Height="306px" ImageUrl="~/Images/219986.png" OnClick="ImageButton2_Click" Width="283px" />
			<br />
        </div>
    </form>
</body>
</html>
