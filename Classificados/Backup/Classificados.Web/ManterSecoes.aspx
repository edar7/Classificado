<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManterSecoes.aspx.cs" Inherits="Classificados.Web.ManterSecoes" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Menu ID="Menu1" runat="server" />
        <h2>
            Manter Seções</h2>
        <br />
        <h3>
            Inserir</h3>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                idSecao:
                <asp:TextBox ID="idSecaoTextBox" runat="server" Text='<%# Bind("idSecao") %>' />
                <br />
                Descricao:
                <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>' />
                <br />
                Anuncios:
                <asp:TextBox ID="AnunciosTextBox" runat="server" Text='<%# Bind("Anuncios") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Descricao:
                <asp:TextBox ID="DescricaoTextBox" runat="server" 
                    Text='<%# Bind("Descricao") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Inserir" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                idSecao:
                <asp:Label ID="idSecaoLabel" runat="server" Text='<%# Bind("idSecao") %>' />
                <br />
                Descricao:
                <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Bind("Descricao") %>' />
                <br />
                Anuncios:
                <asp:Label ID="AnunciosLabel" runat="server" Text='<%# Bind("Anuncios") %>' />
                <br />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DataObjectTypeName="Classificados.Dominio.Secoes" SelectMethod="Listar" 
            TypeName="Classificados.BLL.SecoesBLL" UpdateMethod="Alterar" 
            InsertMethod="Inserir">
        </asp:ObjectDataSource>
        <br />
    </div>
    <h3>
        Editar/Excluir</h3>
    <asp:GridView ID="gdvSecoes" runat="server" AutoGenerateColumns="False" DataKeyNames="idSecao"
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                DeleteText="Excluir" EditText="Editar" />
            <asp:BoundField DataField="idSecao" HeaderText="idSecao" SortExpression="idSecao"
                Visible="False" />
            <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
