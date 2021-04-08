<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link href="../../resources/PersonaP.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script language="javascript" type="text/javascript">  
		$.expr[":"].containsNoCase = function (el, i, m) {
			var search = m[3];
			if (!search) return false;
			return eval("/" + search + "/i").test($(el).text());
		};

		$(document).ready(function () {
			$('#txtNomUsuario').keyup(function () {
				if ($('#txtNomUsuario').val().length > 1) {
					$('#dgvUsuarios tr').hide();
					$('#dgvUsuarios tr:first').show();
					$('#dgvUsuarios tr td:containsNoCase(\'' + $('#txtNomUsuario').val() + '\')').parent().show();
				}
				else if ($('#txtNomUsuario').val().length == 0) {
					resetSearchValue();
				}

				if ($('#dgvUsuarios tr:visible').length == 1) {
					$('.norecords').remove();
					$('#dgvUsuarios').append('<tr class="norecords"><td colspan="6" class="Normal" style="text-align: center">No records were found</td></tr>');
				}
			});

			$('#txtNomUsuario').keyup(function (event) {
				if (event.keyCode == 27) {
					resetSearchValue();
				}
			});
		});

		function resetSearchValue() {
			$('#txtNomUsuario').val('');
			$('#dgvUsuarios tr').show();
			$('.norecords').remove();
			$('#txtNomUsuario').focus();
		}

	</script>
</head>

<body>
    <form id="form1" runat="server"  class="form-horizontal colorFondo">
         <div class=" container well contenedor">
            <!--BontonNueboOP-->
             <div class="row">
                <div class ="col-12">
                    <h1>Usuario</h1>
                </div>
            </div> 
             <div class="row">
                 <div class="col-xl-1 col-sm-1">
                    <asp:Label ID="Label1" runat="server" CssClass="control-label col-sm-2" Text="Nombre:"></asp:Label>
			    </div>
                 <div class="col-xl-1 col-sm-1">
                     <asp:TextBox ID="txtNomUsuario" Width="174px" CssClass="form-control" runat="server" OnTextChanged="txtNomUsuario_TextChanged" AutoCompleteType="Search" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
			    </div>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="col-xl-1 col-sm-1">
        	        <asp:Button ID="Button3" runat="server"  CssClass="btn btn-primary" OnClick="Button3_Click" Text="Buscar" />
                </div>
                 <div class="col-xl-1 col-sm-1">
        	        <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClick="Button1_Click" Text="Agregar" />
                 </div>
             </div>
             <div class="row">
                 <div class="col-xl-1 col-sm-1">
			        <asp:Label ID="Label2" CssClass="control-label col-sm-2" runat="server" Text="Estado"></asp:Label>
                </div>
                 <div class="col-xl-1 col-sm-1">
			        <asp:DropDownList ID="ddlEstadoUser" runat="server"  CssClass="btn btn-secondary dropdown-toggle" Height="39px" Width="177px" AutoPostBack="True" OnSelectedIndexChanged="ddlEstadoUser_SelectedIndexChanged" ></asp:DropDownList>
                </div>
            </div>
            <!---BuscarUsuarioEnd-->
            <!--tablaop-->
             <div class="container"> 
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
            <asp:GridView ID="dgvUsuarios" runat="server"
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcesUsuario"  CellPadding="3" GridLines="Horizontal" 
               onrowcommand="dgvPersonas_RowCommand"
                ViewStateMode="Disabled" class="table table-active table-striped  table-responsive-md table-responsive-lg table-responsive-xl" OnSelectedIndexChanged="dgvUsuarios_SelectedIndexChanged">
            <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="strUsuario" HeaderText="strUsuario" ReadOnly="True" SortExpression="strUsuario" />
                    
                	<asp:BoundField DataField="dtFehca" HeaderText="dtFehca" ReadOnly="True" SortExpression="dtFehca" />
                    <asp:BoundField DataField="dbo_EstadoLogin" HeaderText="Estado" ReadOnly="True" SortExpression="dbo_EstadoLogin" />
                    <asp:TemplateField HeaderText="Editar"><ItemTemplate>           
                        <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" /></ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar" Visible="True">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')"/>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            	   <asp:ScriptManager ID="ScriptManager1" runat="server">
				   </asp:ScriptManager>
            </ContentTemplate> 
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtNomUsuario" EventName="TextChanged"></asp:AsyncPostBackTrigger>
                    <asp:AsyncPostBackTrigger ControlID="Button3" EventName="click"></asp:AsyncPostBackTrigger>
                    <asp:AsyncPostBackTrigger ControlID="txtNomUsuario" EventName="TextChanged"></asp:AsyncPostBackTrigger>
                    <asp:AsyncPostBackTrigger ControlID="ddlEstadoUser" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                </Triggers>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtNomUsuario" EventName="TextChanged" />
              </Triggers>
              <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlEstadoUser" EventName="SelectedIndexChanged" />
              </Triggers>
            </asp:UpdatePanel>
            <!--TablaEnd-->
             </div>
        	<asp:LinqDataSource ID="DataSourcesUsuario" runat="server" ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" EntityTypeName=""  onselecting="DataSourcePersona_Selecting" Select="new (id, strUsuario, dtFehca, dbo_EstadoLogin, Persona, Persona1)" TableName="dbo_Login">
			</asp:LinqDataSource>
        	
        	<br />
             <div class="row">
                 <div class="auto-style1">
			    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Salir" />
                     </div>
             </div>
        </div>
    </form>
</body>
</html>
