<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnunciosList.aspx.cs" Inherits="Classificados.Web.AnunciosList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: 13pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="dtlAnunciosDestaque" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="ODSAnunciosDestaque" Font-Names="Arial" Font-Size="10pt" 
            ForeColor="Black" GridLines="Horizontal" RepeatColumns="2">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                Anúncios em Destaque
            </HeaderTemplate>
            <ItemTemplate>
                <span class="style1">titulo: </span>
                <asp:Label ID="tituloLabel" runat="server" 
                    style="font-weight: 700" Text='<%# Eval("titulo") %>' CssClass="style1" />
                <br class="style1" />
                <span class="style1">descricao:
                <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                <br />
                <br />
                Data Publicação:
                <asp:Label ID="dtPublicacaoLabel" runat="server" 
                    Text='<%# Eval("dtPublicacao", "{0:d}") %>' />
                <br />
                dtValidade:
                <asp:Label ID="dtValidadeLabel" runat="server" 
                    Text='<%# Eval("dtValidade", "{0:d}") %>' />
                <br />
                destaque:
                <asp:Label ID="destaqueLabel" runat="server" 
                    Text='<%# GetTextBoolean(Eval("destaque")) %>' />
                <br />
                promocao:
                <asp:Label ID="promocaoLabel" runat="server" 
                    Text='<%# GetTextBoolean(Eval("promocao")) %>' />
                </span>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:ObjectDataSource ID="ODSAnunciosDestaque" runat="server" SelectMethod="ListarAnunciosAtivosDestaque" 
            TypeName="Classificados.BLL.AnunciosBLL"></asp:ObjectDataSource>
    
        <br />
    
        <asp:DataList ID="dtlAnunciosGerais" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="ODSAnunciosGerais" Font-Names="Arial" Font-Size="10pt" 
            ForeColor="Black" GridLines="Horizontal" RepeatColumns="2">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                Anúncios
            </HeaderTemplate>
            <ItemTemplate>
                titulo:
                <asp:Label ID="tituloLabel" runat="server" 
                    style="font-size: small; font-weight: 700" Text='<%# Eval("titulo") %>' />
                <br />
                descricao:
                <asp:Label ID="descricaoLabel" runat="server" 
                    Text='<%# Eval("descricao") %>' />
                <br />
                <br />
                Data Publicação:
                <asp:Label ID="dtPublicacaoLabel" runat="server" 
                    Text='<%# Eval("dtPublicacao", "{0:d}") %>' />
                <br />
                dtValidade:
                <asp:Label ID="dtValidadeLabel" runat="server" 
                    Text='<%# Eval("dtValidade", "{0:d}") %>' />
                <br />
                destaque:
                <asp:Label ID="destaqueLabel" runat="server" 
                Text='<%# GetTextBoolean(Eval("destaque")) %>' />
                <br />
                promocao:
                <asp:Label ID="promocaoLabel" runat="server" 
                Text='<%# GetTextBoolean(Eval("promocao")) %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:ObjectDataSource ID="ODSAnunciosGerais" runat="server" SelectMethod="ListarAnunciosAtivosGerais" 
            TypeName="Classificados.BLL.AnunciosBLL"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
