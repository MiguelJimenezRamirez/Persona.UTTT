<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <title>Perona Main</title>
	<link href="resources/PersonaP.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal colorFondo" >
        <div class=" container well contenedor">
            <div class="row">
                <div class ="col-12">
                    <h1>Persona</h1>
                </div>
            </div>        
            
        <div class="row">
            <div class="col-xl-1 col-sm-1">
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="control-label col-sm-2">Normbre:</asp:Label>
            </div>
            <div class="col-xl-1 col-sm-1">
                <asp:TextBox ID="txtNombre" runat="server" Width="174px" ViewStateMode="Disabled" CssClass="form-control"></asp:TextBox>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="col-xl-1 col-sm-1">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" onclick="btnBuscar_Click" ViewStateMode="Disabled" CssClass="btn btn-primary" />
            </div>
            <div class="col-xl-1 col-sm-1">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" onclick="btnAgregar_Click" ViewStateMode="Disabled" CssClass="btn btn-danger" />
            </div>
        </div>
        <div class="row">
            <div class="col-xl-1 col-sm-1">
                <asp:Label ID="Label2" runat="server" Text="Label">Sexo:</asp:Label>
            </div>
            <div class="col-xl-1 col-sm-1">
                <asp:DropDownList ID="ddlSexo" runat="server" Height="22px" Width="177px"></asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                <asp:Label ID="Label3" runat="server" CssClass="text-info" Text="Label">Detalle</asp:Label>
            </div>
        </div>
        
      <div class="container" >
          <!--TablaOP-->
        <asp:GridView ID="dgvPersonas" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona" CellPadding="3" GridLines="Horizontal" 
                onrowcommand="dgvPersonas_RowCommand"  
                ViewStateMode="Disabled" class="table table-active table-striped  table-responsive-md table-responsive-lg table-responsive-xl">
            <Columns>
                    <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" ReadOnly="True" SortExpression="strClaveUnica" />
                    <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" SortExpression="strNombre" />
                    <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True" SortExpression="strAPaterno" />
                    <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True" SortExpression="strAMaterno" />
                    <asp:BoundField DataField="CatSexo" HeaderText="Sexo" SortExpression="CatSexo" />
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
                    <asp:TemplateField HeaderText="Direccion">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />      
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           <!--TablaED-->
            </div>
        </div>
      
    <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica,id)" 
        TableName="Persona" EntityTypeName="">
    </asp:LinqDataSource>
    </form>
</body>
</html>
