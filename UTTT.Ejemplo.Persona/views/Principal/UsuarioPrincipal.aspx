<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.views.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server">
        <div>
            <!--BontonNueboOP-->
        	<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Nuevo" />
        	<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Buscar" />
        	<br />
            <!--BotonNuevoEnd-->
            <!--BuscarUsuarioOP-->
			<asp:Label ID="Label1" runat="server" Text="Nombre de Usuario"></asp:Label>
			<asp:TextBox ID="txtNomUsuario" runat="server" OnTextChanged="txtNomUsuario_TextChanged" AutoCompleteType="Search" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
			<br />
            <!--BuscarUsuarioEnd-->
            <!--BuscarEstadoOP-->
			<asp:Label ID="Label2" runat="server" Text="Estado"></asp:Label>
			<asp:DropDownList ID="ddlEstadoUser" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlEstadoUser_SelectedIndexChanged" ></asp:DropDownList>
			<br />
            <!---BuscarUsuarioEnd-->
            <!--tablaop-->
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

        	<asp:LinqDataSource ID="DataSourcesUsuario" runat="server" ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" EntityTypeName=""  onselecting="DataSourcePersona_Selecting" Select="new (id, strUsuario, dtFehca, dbo_EstadoLogin, Persona, Persona1)" TableName="dbo_Login">
			</asp:LinqDataSource>
        	
        	<br />
			<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Salir" />
        </div>
    </form>
</body>
</html>
