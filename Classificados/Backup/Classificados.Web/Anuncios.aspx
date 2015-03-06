<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anuncios.aspx.cs" Inherits="Classificados.Web.Anuncios" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:Menu ID="Menu1" runat="server" />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="odsAnuncios" 
        DefaultMode="Insert" Font-Names="Arial" Font-Size="8pt" GridLines="Both" oniteminserting="FormView1_ItemInserting" 
        >
        <EditItemTemplate>
            idAnuncio:
            <asp:TextBox ID="idAnuncioTextBox" runat="server" 
                Text='<%# Bind("idAnuncio") %>' />
            <br />
            titulo:
            <asp:TextBox ID="tituloTextBox" runat="server" Text='<%# Bind("titulo") %>' />
            <br />
            descricao:
            <asp:TextBox ID="descricaoTextBox" runat="server" 
                Text='<%# Bind("descricao") %>' />
            <br />
            foto:
            <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' />
            <br />
            dtPublicacao:
            <asp:TextBox ID="dtPublicacaoTextBox" runat="server" 
                Text='<%# Bind("dtPublicacao") %>' />
            <br />
            dtValidade:
            <asp:TextBox ID="dtValidadeTextBox" runat="server" 
                Text='<%# Bind("dtValidade") %>' />
            <br />
            destaque:
            <asp:CheckBox ID="destaqueCheckBox" runat="server" 
                Checked='<%# Bind("destaque") %>' />
            <br />
            promocao:
            <asp:CheckBox ID="promocaoCheckBox" runat="server" 
                Checked='<%# Bind("promocao") %>' />
            <br />
            secoes:
            <asp:TextBox ID="secoesTextBox" runat="server" Text='<%# Bind("secoes") %>' />
            <br />
            secoesReference:
            <asp:TextBox ID="secoesReferenceTextBox" runat="server" 
                Text='<%# Bind("secoesReference") %>' />
            <br />
            EntityState:
            <asp:TextBox ID="EntityStateTextBox" runat="server" 
                Text='<%# Bind("EntityState") %>' />
            <br />
            EntityKey:
            <asp:TextBox ID="EntityKeyTextBox" runat="server" 
                Text='<%# Bind("EntityKey") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Título:
            <asp:TextBox ID="tituloTextBox" runat="server" Text='<%# Bind("titulo") %>' 
                Width="195px"  />
            <br />
            Descrição:
            <asp:TextBox ID="descricaoTextBox" runat="server" 
                Text='<%# Bind("descricao") %>' Rows="4" TextMode="MultiLine" />
            <br />
            Data Publicação:
            <asp:Calendar ID="dtPublicacao" runat="server" 
                SelectedDate='<%# Bind("dtPublicacao") %>'></asp:Calendar>
            <br />
            Destaque:
            <asp:CheckBox ID="destaqueCheckBox" runat="server" 
                Checked='<%# Bind("destaque") %>' />
            <br />
            Promoção:
            <asp:CheckBox ID="promocaoCheckBox" runat="server" 
                Checked='<%# Bind("promocao") %>' />
            <br />
            Seções:
            <asp:DropDownList ID="ddlSecoes" runat="server" DataSourceID="odsSecoes" 
                DataTextField="descricao" DataValueField="idSecao" Height="20px" 
                Width="168px">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="odsSecoes" runat="server" SelectMethod="Listar" 
                TypeName="Classificados.BLL.SecoesBLL"></asp:ObjectDataSource>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Inserir" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            idAnuncio:
            <asp:Label ID="idAnuncioLabel" runat="server" Text='<%# Bind("idAnuncio") %>' />
            <br />
            titulo:
            <asp:Label ID="tituloLabel" runat="server" Text='<%# Bind("titulo") %>' />
            <br />
            descricao:
            <asp:Label ID="descricaoLabel" runat="server" Text='<%# Bind("descricao") %>' />
            <br />
            foto:
            <asp:Label ID="fotoLabel" runat="server" Text='<%# Bind("foto") %>' />
            <br />
            dtPublicacao:
            <asp:Label ID="dtPublicacaoLabel" runat="server" 
                Text='<%# Bind("dtPublicacao") %>' />
            <br />
            dtValidade:
            <asp:Label ID="dtValidadeLabel" runat="server" 
                Text='<%# Bind("dtValidade") %>' />
            <br />
            destaque:
            <asp:CheckBox ID="destaqueCheckBox" runat="server" 
                Checked='<%# Bind("destaque") %>' Enabled="false" />
            <br />
            promocao:
            <asp:CheckBox ID="promocaoCheckBox" runat="server" 
                Checked='<%# Bind("promocao") %>' Enabled="false" />
            <br />
            secoes:
            <asp:Label ID="secoesLabel" runat="server" Text='<%# Bind("secoes") %>' />
            <br />
            secoesReference:
            <asp:Label ID="secoesReferenceLabel" runat="server" 
                Text='<%# Bind("secoesReference") %>' />
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
    <p>
        &nbsp;</p>
    <div>
    
        <br />
        <asp:DropDownList ID="ddlSecoes" runat="server" AutoPostBack="True" 
            DataSourceID="ODSSecoes" DataTextField="descricao" DataValueField="idSecao" 
            Height="21px" Width="180px" 
            onselectedindexchanged="ddlSecoes_SelectedIndexChanged" 
            ondatabound="ddlSecoes_DataBound" >
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ODSSecoes" runat="server" SelectMethod="Listar" 
            TypeName="Classificados.BLL.SecoesBLL" ></asp:ObjectDataSource>
    
        <asp:GridView ID="gvAnuncios" runat="server" AutoGenerateColumns="False" 
            AllowPaging="True" PageSize="5" 
            DataKeyNames="idAnuncio" Font-Names="Arial" Font-Size="9pt" Height="16px" 
            Width="597px" CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowdatabound="gvAnuncios_RowDataBound" 
            onrowcancelingedit="gvAnuncios_RowCancelingEdit" 
            onrowediting="gvAnuncios_RowEditing" 
            onrowupdating="gvAnuncios_RowUpdating" onrowdeleting="gvAnuncios_RowDeleting">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="idAnuncio" HeaderText="ID" 
                    SortExpression="idAnuncio" Visible="False" />
                <asp:BoundField DataField="titulo" HeaderText="Título" 
                    SortExpression="titulo" />
                <asp:BoundField DataField="descricao" HeaderText="Descrição" 
                    SortExpression="descricao" />
                <asp:BoundField DataField="dtPublicacao" HeaderText="Dt Publicação" 
                    SortExpression="dtPublicacao" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="dtValidade" HeaderText="Dt Validade" 
                    SortExpression="dtValidade" DataFormatString="{0:d}"/>
                <asp:TemplateField HeaderText="Destaque" SortExpression="destaque">
                    <ItemTemplate>
                        <asp:Label ID="lblDestaque" runat="server" Text='<%# SetMarcacao(Eval("destaque")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Promoção" SortExpression="promocao">
                    <ItemTemplate>
                        <asp:Label ID="lblPromocao" runat="server" Text='<%# SetMarcacao(Eval("promocao")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Seção">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlSecoesGdv" runat="server" DataSourceID="ODSSecoes" 
                            DataTextField="Descricao" DataValueField="idSecao" Enabled="False">
                        </asp:DropDownList>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlSecoesGdv" runat="server" DataSourceID="ODSSecoes" 
                            DataTextField="Descricao" DataValueField="idSecao">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" CancelText="Cancelar" EditText="Editar" 
                    HeaderText="Editar" ShowEditButton="True" UpdateText="Salvar" />
                <asp:TemplateField HeaderText="Excluir">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            OnClientClick="javascript:if(confirm('Deseja realmente excluir o anúncio?')) return true; else return false;" 
                            Text="Excluir" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <em>Nenhum anúncio localizado para esta seção.</em>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsAnuncios" runat="server" 
            SelectMethod="ListarSecao" TypeName="Classificados.BLL.AnunciosBLL"
            EnablePaging='True' MaximumRowsParameterName="maxRows" 
            StartRowIndexParameterName="startRow" SelectCountMethod="Count" 
            DataObjectTypeName="Classificados.Dominio.Anuncios" InsertMethod="Inserir" 
            DeleteMethod="Excluir">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSecoes" Name="idSecao" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="startRow" Type="Int32" />
                <asp:Parameter Name="maxRows" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
