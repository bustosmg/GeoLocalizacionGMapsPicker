<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormPrincipal.aspx.cs" Inherits="GeoLocalizacionEx02.WebFormPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #0066FF;
        }
        .auto-style6 {
            width: 98%;
            border: 3px solid #800080;
        }
        .auto-style8 {
            margin-left: 0px;
        }
        .auto-style9 {
            width: 288px;
        }
        .auto-style10 {
            width: 232px;
        }
        .auto-style11 {
            margin-left: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <h1><strong>Lista de Entidades</strong></h1>
    
    </div>
        <asp:GridView ID="GridViewEntidad" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idDomicilios" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="98%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="direccion" HeaderText="Domicilio" SortExpression="direccion" />
                <asp:BoundField DataField="altura" HeaderText="Altura" SortExpression="altura" />
                <asp:BoundField DataField="latitud" HeaderText="Latitud" SortExpression="latitud" />
                <asp:BoundField DataField="longitud" HeaderText="Longitud" SortExpression="longitud" />
                <asp:BoundField DataField="partido" HeaderText="Partido" SortExpression="partido" />
                <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                <asp:BoundField DataField="pais" HeaderText="Pais" SortExpression="pais" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GeoLocalizacionConnectionString %>" DeleteCommand="DELETE FROM [Domiclios] WHERE [idDomicilios] = @idDomicilios" InsertCommand="INSERT INTO [Domiclios] ( [direccion], [altura], [latitud], [longitud], [partido], [provincia], [pais]) VALUES ( @direccion, @altura, @latitud, @longitud, @partido, @provincia, @pais)" SelectCommand="SELECT * FROM [Domiclios]" UpdateCommand="UPDATE [Domiclios] SET [direccion] = @direccion, [altura] = @altura, [latitud] = @latitud, [longitud] = @longitud, [partido] = @partido, [provincia] = @provincia, [pais] = @pais WHERE [idDomicilios] = @idDomicilios" OnSelecting="SqlDataSource1_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="idDomicilios" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="direccion" Type="String" />
                <asp:Parameter Name="altura" Type="Int32" />
                <asp:Parameter Name="latitud" Type="Decimal" />
                <asp:Parameter Name="longitud" Type="Decimal" />
                <asp:Parameter Name="partido" Type="String" />
                <asp:Parameter Name="provincia" Type="String" />
                <asp:Parameter Name="pais" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="direccion" Type="String" />
                <asp:Parameter Name="altura" Type="Int32" />
                <asp:Parameter Name="latitud" Type="Decimal" />
                <asp:Parameter Name="longitud" Type="Decimal" />
                <asp:Parameter Name="partido" Type="String" />
                <asp:Parameter Name="provincia" Type="String" />
                <asp:Parameter Name="pais" Type="String" />
                <asp:Parameter Name="idDomicilios" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <hr />
        <asp:CheckBox ID="chk_nuevo" runat="server" OnCheckedChanged="chk_nuevo_CheckedChanged" Text="Nuevo Registro" />
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="246px">
            <table class="auto-style6">
                <tr>
                    <td class="auto-style9">Domicilio</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_dom" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Altura</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_altura" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Partido</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_partido" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Provincia</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_provicnia" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Pais</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_pais" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Latitud</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_latitud" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Logintud</td>
                    <td colspan="2">
                        <asp:TextBox ID="longitud" runat="server" CssClass="auto-style8" Width="394px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Tipo de Entidad</td>
                    <td colspan="2">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style11" DataSourceID="SqlDataSourceEntidades" DataTextField="nombre" DataValueField="nombre">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceEntidades" runat="server" ConnectionString="<%$ ConnectionStrings:GeoLocalizacionConnectionString %>" SelectCommand="SELECT [nombre] FROM [TiposEntidad]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style10">
                        <asp:Button ID="btn_alta" runat="server" OnClick="btn_alta_Click" Text="Guadar" Width="165px" />
                    </td>
                    <td>
                        <asp:Button ID="btn_cancelar" runat="server" OnClick="btn_cancelar_Click" Text="Cancelar" Width="125px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <asp:Button ID="btn_ubicacion" runat="server" OnClick="btn_ubicacion_Click" Text="Mostrar Ubicación" />
        <br />
    </form>
</body>
</html>
