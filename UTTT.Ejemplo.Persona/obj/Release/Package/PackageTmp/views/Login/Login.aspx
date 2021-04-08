<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <!-- Temas-->
	<link href="../../css/cssLogin.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"  />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<style type="text/css">
		.auto-style1 {
			display: block;
			width: 100%;
			height: 34px;
			padding: 6px 12px;
			font-size: 14px;
			line-height: 1.42857143;
			color: #555;
			background-color: #fff;
			background-image: none;
			border: 1px solid #ccc;
			border-radius: 4px;
			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
			-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
			transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
			left: 0px;
			top: 0px;
		}
	</style>
</head>
<body>
	<div id="Contenedor">
		<div class="">
                    <!--Icono de usuario-->
                   <h1 class="text-center">Login</h1>
		</div>

	<div class="ContentForm">
    <form id="form1" runat="server">
        <div>
        	<div class="input-group input-group-lg">
				  <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user"></i></span>
				<asp:TextBox  ID="txtUsuario"  CssClass="form-control"  placeholder="Usuario" runat="server"></asp:TextBox>
			</div>
			<br />
			<div class="input-group input-group-lg">
				  <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
				  <asp:TextBox ID="txtContraseña" placeholder="Contraseña"  CssClass="auto-style1" type="password"  runat="server"></asp:TextBox>
			</div>
			<br />
			<div class="input-group input-group-lg">
				  <asp:Label ID="lblError" runat="server"  class="label-danger" ForeColor="White" Text="Las credenciales no coinciden" Visible="False"></asp:Label>
			</div>
			<br />
			<asp:Button ID="btnLogin" runat="server" Cssclass="btn btn-lg btn-primary btn-block btn-signin" OnClick="btnLogin_Click" Text="Login" />
			
			<br />
			<asp:Button ID="btnRecuperar" runat="server" Cssclass="nav-justified navbar-default" Text="Recuperar Contraseña" OnClick="Button1_Click" />
			<br />
        </div>
    </form>
	<p>
		&nbsp;</p>
			</div>
		</div>
</body>
</html>
