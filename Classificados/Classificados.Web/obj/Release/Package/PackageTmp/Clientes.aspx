<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Classificados.Web.Clientes" %>
<%@ Register TagPrefix="cc1" Namespace="Classificados.Web.Components" Assembly="Classificados.Web" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:Menu ID="Menu1" runat="server" />
    <div>
    
        <br />
    
        <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="ODSClientes" Font-Names="arial" Font-Size="8pt" 
            ForeColor="#333333" GridLines="None" Height="16px" Width="582px" 
            DataKeyNames="idCliente" 
            onselectedindexchanged="gvClientes_SelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="endereco" HeaderText="Endereço" 
                    SortExpression="endereco" />
                <asp:BoundField DataField="cidade" HeaderText="Cidade" 
                    SortExpression="cidade" />
                <asp:BoundField DataField="estado" HeaderText="UF" SortExpression="estado" />
                <asp:BoundField DataField="telefone" HeaderText="Telefone" 
                    SortExpression="telefone" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Excluir"  
                            OnClientClick="return confirm('Confirma Exclusão ?');"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" SelectText="Alterar" 
                    ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ODSClientes" runat="server" 
            DataObjectTypeName="Classificados.Dominio.Clientes" 
            InsertMethod="Inserir"  DeleteMethod="Excluir"
            SelectMethod="Listar" TypeName="Classificados.BLL.ClientesBLL"
            UpdateMethod="Alterar" OldValuesParameterFormatString="original_{0}">
        </asp:ObjectDataSource>
        <br />
        <asp:FormView ID="fvClientes" runat="server" BorderColor="#E2E2E2" 
            DataSourceID="ODSClientes" DefaultMode="Insert" DataKeyNames="idCliente">
            <EditItemTemplate>
                Nome:
                <cc1:GrayTextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                Endereço:
                <cc1:GrayTextBox ID="enderecoTextBox" runat="server" 
                    Text='<%# Bind("endereco") %>' />
                <br />
                Cidade:
                <cc1:GrayTextBox ID="cidadeTextBox" runat="server" Text='<%# Bind("cidade") %>' />
                <br />
                Estado:
                <cc1:GrayTextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                <br />
                Telefone:
                <cc1:GrayTextBox ID="telefoneTextBox" runat="server" 
                    Text='<%# Bind("telefone") %>' />
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Nome:
                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' 
                    Width="308px" />
                <br />
                <br />
                endereco:
                <asp:TextBox ID="enderecoTextBox" runat="server" Height="58px" Rows="3" 
                    Text='<%# Bind("endereco") %>' TextMode="MultiLine" Width="286px" />
                <br />
                <br />
                cidade:
                <asp:TextBox ID="cidadeTextBox" runat="server" Text='<%# Bind("cidade") %>' />
                <br />
                <br />
                estado:
                <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' 
                    Width="34px" />
                <br />
                <br />
                telefone:
                <asp:TextBox ID="telefoneTextBox" runat="server" 
                    Text='<%# Bind("telefone") %>' />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Inserir" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                idCliente:
                <asp:Label ID="idClienteLabel" runat="server" Text='<%# Bind("idCliente") %>' />
                <br />
                nome:
                <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                endereco:
                <asp:Label ID="enderecoLabel" runat="server" Text='<%# Bind("endereco") %>' />
                <br />
                cidade:
                <asp:Label ID="cidadeLabel" runat="server" Text='<%# Bind("cidade") %>' />
                <br />
                estado:
                <asp:Label ID="estadoLabel" runat="server" Text='<%# Bind("estado") %>' />
                <br />
                telefone:
                <asp:Label ID="telefoneLabel" runat="server" Text='<%# Bind("telefone") %>' />
                <br />
                EntityState:
                <asp:Label ID="EntityStateLabel" runat="server" 
                    Text='<%# Bind("EntityState") %>' />
                <br />
                EntityKey:
                <asp:Label ID="EntityKeyLabel" runat="server" Text='<%# Bind("EntityKey") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>