<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
    <title>Perona Main</title>
	
	<link href="resources/PersonaM.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style type="text/css">
		.auto-style3 {
			left: 0px;
			top: 0px;
		}
	</style>
</head>
<body>
    <form runat="server" class="colorFondo">
    <div class="container well ">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <div class="col-4">
            </div>
            <div class="col-sm-4">
                <h2>Persona Manager<h2/> 
            </div>
            <div class="col-4">
            </div>
        </div>
        <div class="row">
                <asp:Label ID="Label3" runat="server" CssClass="text-center" Text="Miguel Jimenez Ramirez"></asp:Label>
            
        </div>
        <div class="row">
                <asp:Label ID="lblAccion" runat="server" CssClass="text-center" Text="Accion" Font-Bold="True"></asp:Label>
            
        </div>
        <br />
        <!--DropListOP-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label2" runat="server"  CssClass="control-label col-sm-2" Text="Label" >Sexo:</asp:Label>
            </div>
            <div class="col-xl-3 col-sm-2">
            <asp:UpdatePanel ID="upSetSession" runat="server">
                <ContentTemplate>
                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="btn btn-secondary dropdown-toggle" Height="40px" Width="249px"></asp:DropDownList>
                    
                </ContentTemplate> 
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
                </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
            </div>
			
        </div>
        <br />
        <!--DropListEN-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label8" runat="server"  CssClass="control-label col-sm-2" Text="Label" >Estado Civil:</asp:Label>
            </div>
            
        <div class="col-xl-3 col-sm-2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" Height="40px" Width="249px" CssClass="btn btn-secondary dropdown-toggle">
				        </asp:DropDownList>
                </ContentTemplate> 
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlEstadoCivil" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            </div>
        </div>
        <br />
        <!--Clave UnicaOP-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label1" CssClass="control-label col-sm-2" runat="server"  >Clave Unica:</asp:Label>
            </div>
            <div class="col-xl-3 col-sm-2">
               <asp:TextBox ID="txtClaveUnica" CssClass="form-control" runat="server" maxlength="3" Width="249px" ViewStateMode="Disabled" pattern="[0-9]+{2,3}" oninput="maximo(this);"  onkeypress="return SoloNumeros(event)"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
               </div>
            <div class="col-xl-3 col-sm-2">
               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Valor no valido" ControlToValidate="txtClaveUnica" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--Clave UnicaED-->
        <!--NombreOP-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label4" CssClass="control-label col-sm-2" runat="server"  > Nombre:</asp:Label>
            </div>
            <div class="col-xl-3 col-sm-2">
                <asp:TextBox maxlength="15" minlength="3" ID="txtNombre" CssClass="form-control" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" ></asp:TextBox>       
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
             </div>
            <div class="col-xl-3 col-sm-2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNombre" ErrorMessage="Valor no Valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>    
            </div>
            <div class="col-xl-3 col-sm-2"></div>
        </div>
        <!--NombreED-->
        <!--APaternoOP-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label5" CssClass="control-label col-sm-2" runat="server" >A Paterno:</asp:Label>
            </div>
            <div class="col-xl-3 col-sm-2">
                <asp:TextBox maxlength="15" CssClass="form-control" minlength="3" ID="txtAPaterno" pattern="[A-Za-z\sáéíóúñÑ]+{3,15}" oninput="maximoNom(this);" onkeypress="return SoloLetras(event)" runat="server" Width="249px" ViewStateMode="Disabled" ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
            </div>
            <div class="col-xl-3 col-sm-2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--APaternoED-->
        <!--AMaternoOP-->
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label6" CssClass="control-label col-sm-2" runat="server"  >A Materno:</asp:Label>
            </div>
            <div class="col-xl-3 col-sm-2">
                <asp:TextBox ID="txtAMaterno" CssClass="form-control" runat="server" Width="249px" maxlength="15" minlength="3" oninput="maximoNom(this);" pattern="[A-Za-z\sáéíóúnÑ]+{3,15}" ViewStateMode="Disabled" onkeypress="return SoloLetras(event)"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-2">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Valor no valido" ValidationExpression="^[A-Za-zÑñ\sáéíóúñÑ]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!--AMaternoED-->
        <!--TextCaledarOP-->
    <div class="row">
        <div class="col-xl-3 col-sm-2">
                <asp:Label ID="Label7" CssClass="control-label col-sm-2"  runat="server"  >Fecha de Nacimiento</asp:Label>
        </div>
        <div class="col-xl-3 col-sm-1">  
			<asp:ImageButton ID="imgButton" runat="server" Height="25px" ImageUrl="~/Images/Calendario.png" Width="25px" />
        
            <asp:TextBox ID="txtCalendar2"  CssClass="form-control" runat="server" Width="249px"></asp:TextBox>
		</div>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="imgButton" PopupPosition="TopRight" TargetControlID="txtCalendar2" BehaviorID="clCalendar" /> 
        
    </div>
    <div class="row">
    </div>
    	<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtCalendar2" ErrorMessage="Formato de fecha no valido" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
    <br />
    
    <!--TextCaledarED-->
    <!--NumeroHermanosOP-->
    <div class="row">
        <div class="col-xl-3 col-sm-2">
            <asp:Label ID="Label10" CssClass="control-label col-sm-2" runat="server"  >Numero de Hermanos</asp:Label>
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:TextBox ID="txtNumeroHermanos" CssClass="form-control" oninput="maximoHer(this);" pattern="[0-9]+{1,2}" maxlength="2" onkeypress="return SoloNumeros(event)"  runat="server"  Width="249px"></asp:TextBox>    
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 col-sm-2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ControlToValidate="txtNumeroHermanos" ErrorMessage="Numero de Requerido"></asp:RequiredFieldValidator>
        </div>
    </div>
    <!--NumeroHermanosED-->
    <!--CorreoElectronicoOP-->
	<div class="row">
        <div class="col-xl-3 col-sm-2">
             <asp:Label ID="Label11" CssClass="control-label col-sm-2" runat="server"  >Correo Electronico</asp:Label>
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="249px"></asp:TextBox>
        </div>
    </div>
	<div class="row">
        <div class="col-xl-3 col-sm-2">
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato no valido" ControlToValidate="txtCorreoElectronico" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
	</div>
	<!--CorreoElectronicoED-->
    <!--RFCOP-->
    <div class="row">
        <div class="col-xl-3 col-sm-2">
            <asp:Label ID="Label12" CssClass="control-label col-sm-2" runat="server"  >RFC Empresa</asp:Label>
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:TextBox ID="txtRFC" maxlength="13" CssClass="form-control" oninput="maximoRFC(this);" runat="server" Width="249px"></asp:TextBox>
        </div>
    </div>
	<div class="row">
        <div class="col-xl-3 col-sm-2">
        </div>
        <div class="auto-style3">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRFC" ErrorMessage="Formato no valido " ValidationExpression="^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$"></asp:RegularExpressionValidator>
        </div>
	</div>
    <!--RFCED-->
    <!--CodigoOP-->
    <div class="row">
        <div class="col-xl-3 col-sm-2">
            <asp:Label ID="Label13" CssClass="control-label col-sm-2" runat="server"  >Codigo Postal</asp:Label>
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:TextBox ID="txtCodigoPostal" CssClass="form-control" onkeypress="return SoloNumeros(event);"   maxlength="5" oninput="maximoPstal(this);" runat="server" Width="249px"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 col-sm-2">
        </div>
        <div class="col-xl-3 col-sm-2">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Formato no valido" ValidationExpression="^[0-5][0-9]{3}[0-9]$"></asp:RegularExpressionValidator>
        </div>
    </div>
	<!--CodigoED-->
    <div class="row">
        <div class="col-xl-2 col-sm-2">
            <asp:Label ID="lblMensaje" runat="server" BackColor="White" BorderColor="Red" EnableTheming="True" ForeColor="Red" Visible="False"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClientClick="return comprueba();" onclick="btnAceptar_Click" CssClass="btn btn-primary" ViewStateMode="Disabled" />  
        </div>
        <div class="col-2 ">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" CssClass="btn btn-danger" ViewStateMode="Disabled" CausesValidation="False" />
        </div>
    </div>
    <script type="text/javascript">
        function calendar(e) {
            console.log(e.value.day);
        }
        function SoloNumeros(evt) {
            if (window.event) {
                keynum = evt.keyCode;
            } else {
                keynum = evt.which;
            }
            if ((keynum > 47 && keynum < 58 || keynum == 8 || keynum == 13)) {
                return true;
            }else {
                alert("ingresa solo numeros");
                return false;
            }
		}
        function SoloLetras(e) {
            key = e.keyCode || e.which;
            tecla = String.fromCharCode(key).toString();
            letras = "qwertyuiopñlkjhgfdsamnbvcxzQWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóúÁÉÍÓÚ"
            especiales = [8, 13];
            tecla_especial = false
            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }
            if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                alert("Ingresa solo letras");
                return false;
            }
        }
        function maximo(obj) {
            if (obj.value.length > obj.maxlength) {
                obj.value = obj.value.slice(0, obj.maxlength);
            }
        }
		function maximoNom(obj) {
			if (obj.value.length > obj.maxlength ) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoHer(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoRFC(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
			}
        }
		function maximoPstal(obj) {
			if (obj.value.length > obj.maxlength) {
				obj.value = obj.value.slice(0, obj.maxlength);
            }
        }
		function comprueba() {
			var elemento = document.getElementById("txtClaveUnica").value
			var elemento1 = document.getElementById("txtNombre").value
			var elemento2 = document.getElementById("txtAPaterno").value
			var elemento4 = document.getElementById("txtNumeroHermanos").value
			var elemento5 = document.getElementById("txtCorreoElectronico").value
			var elemento6 = document.getElementById("txtCodigoPostal").value
			var elemento7 = document.getElementById("txtCalendar2").value
			var elemento8 = document.getElementById("ddlSexo").value
			var elemento9 = document.getElementById("ddlEstadoCivil").value
			if (elemento == "") {
				alert("Clave unica Obligatoria")
				return false
			} else if (elemento1 == "") {
				alert("Nombre Obligatorio")
				return false
			} else if (elemento2 == "") {
				alert("Apellido Paterno Obligatorio")
				return false
			} else if (elemento4 == "") {
				alert("Numero de hermanos Obligatorio")
				return false
			} else if (elemento5 == "") {
				alert("Correo Electronico Obligatorio")
				return false
			} else if (elemento6 == "") {
				alert("Codigo postal Obligatorio")
				return false
			} else if (elemento7 == "") {
				alert("Fecha de Nacimieno Obligatoria")
				return false
			} else if (elemento8 == "-1") {
				alert("Sexo Obligatorio")
				return false
			} else if (elemento9 == "-1") {
				alert("Estado civil Obligatorio")
				return false
			}
		}
	</script>
        <br />
        </div>
    </form>
    </body>
</html>

