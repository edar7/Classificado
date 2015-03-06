<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Classificados.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    <asp:Panel ID="pnlSemAutenticacao" runat="server">
        <br />
        Área de Autenticação<table style="width: 100%;">
            <tr>
                <td>
                    Login:
                </td>
                <td>
                    <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Senha:
                </td>
                <td>
                    <asp:TextBox ID="txtSenha" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnEntrar" runat="server" OnClick="btnEntrar_Click" Text="Entrar" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlAutenticado" runat="server">
        <br />
        Você já está logado
    </asp:Panel>
    </form>
</body>
</html>
