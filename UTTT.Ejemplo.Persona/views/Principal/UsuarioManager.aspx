<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Principal.UsuarioManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<asp:Label ID="Label1" runat="server" Text="Manager Usuarios"></asp:Label>
			<br />
			<asp:Label ID="Label7" runat="server" Text="Nombre:"></asp:Label>
&nbsp;<asp:TextBox ID="txtPersona" runat="server" OnClientClick="return comprueba();" Enabled="False"></asp:TextBox>
			<asp:DropDownList ID="ddlPersonaCompleto" runat="server">
			</asp:DropDownList>
			<br />
			<asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label>
&nbsp;<asp:TextBox ID="txtUsuario" maxlength="30" runat="server"></asp:TextBox>
			<asp:Label ID="lblErrorUserExist" runat="server" ForeColor="Red" Text="El usuario ya existe" Visible="False"></asp:Label>
			<br />
			<asp:Label ID="Label3" runat="server" Text="Contraseña:"></asp:Label>
			<asp:TextBox ID="txtContraseña" maxlength="30" OnClientClick="return comprueba();" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContraseña" ErrorMessage="La contraseña debe tener entre 8 y 16 caracteres, un digito y al menos una mayúscula." ValidationExpression="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"></asp:RegularExpressionValidator>
			<br />
			<asp:Label ID="llblEstadoUsu" runat="server" Text="Estado de Usuario"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlEstadoUser" runat="server">
			</asp:DropDownList>
			<br />
			
			<asp:Label ID="Label6" runat="server" Text="Fecha de Ingreso:"></asp:Label>
			<asp:ImageButton ID="boton1" runat="server" Height="25px" ImageUrl="~/Images/Calendario.png" Width="25px" />
			<asp:TextBox ID="txtFecha" maxlength="10" OnClientClick="return comprueba();" runat="server"></asp:TextBox>
			<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="boton1" PopupPosition="BottomRight" TargetControlID="txtFecha" />
			<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFecha" ErrorMessage="El formato de fecha no es el correcto" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
			<br />

			<asp:Label ID="lblMensaje" runat="server" Visible="False"></asp:Label>
			<asp:ScriptManager ID="ScriptManager1" runat="server">
			</asp:ScriptManager>
			<br />
			<asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick="Button1_Click" />
			<asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" />
        </div>
    </form>
	<p>
		&nbsp;</p>
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
