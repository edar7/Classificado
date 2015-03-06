<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="Classificados.Web.Menu" %>
<asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DisappearAfter="200" 
    DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
    ForeColor="#990000" Orientation="Horizontal" StaticSubMenuIndent="10px">
    <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicMenuStyle BackColor="#FFFBD6" />
    <DynamicSelectedStyle BackColor="#FFCC66" />
    <Items>
        <asp:MenuItem NavigateUrl="~/ManterAnuncios" Text="Anúncios" Value="Anúncios">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/ManterSecoes" Text="Seções" Value="Seções">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/ManterClientes" Text="Clientes" Value="Clientes">
        </asp:MenuItem>
    </Items>
    <StaticHoverStyle BackColor="#990000" ForeColor="White" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticSelectedStyle BackColor="#FFCC66" />
</asp:Menu>

