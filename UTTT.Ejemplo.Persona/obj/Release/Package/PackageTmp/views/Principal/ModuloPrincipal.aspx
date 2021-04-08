<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuloPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.Principal.ModuloPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link href="../../resources/PersonaM.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 	
    <title></title>
</head>
<body class="colorFondo">
    <form id="form1" runat="server">
        <div>
			<div class="row">
					<h2 class="text-center">Modulo Principal</h2>
				
			</div>
			<br />
			<br />
			<div class="row align-items-center">
				<div class="col" style="text-align: center;">
					<asp:ImageButton ID="ImageButton1" runat="server" CssClass="align-content-center" Height="306px" ImageUrl="~/Images/People_Business-08.png" OnClick="ImageButton1_Click" Width="283px" />
					<br />
					<asp:Label ID="Label4" runat="server" CssClass="control-label col-sm-2 text-center" Text="Persona"></asp:Label>
					
				</div>
				<div class="col" style="text-align: center;">
					<asp:ImageButton ID="ImageButton2" runat="server" CssClass="align-content-center" Height="306px" ImageUrl="~/Images/219986.png" OnClick="ImageButton2_Click" Width="283px" />
					<br />
					<asp:Label ID="Label5" runat="server" CssClass="control-label col-sm-2 text-center" Text="Usuario"></asp:Label>
				
				</div>
			</div>
			
			<br />
			<div class="align-content-center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClick="Button1_Click" Text="Salir" />
        	</div>
		</div>
    </form>
</body>
</html>
