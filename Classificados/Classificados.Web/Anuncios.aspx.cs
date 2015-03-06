using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Classificados.BLL;
using Classificados.Dominio;

namespace Classificados.Web
{
    public partial class Anuncios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected string SetMarcacao(object objBoolean)
        {
            string strText = (objBoolean == null) ? string.Empty : objBoolean.ToString();
            return (strText == "True") ? "X" : string.Empty;
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            DropDownList ddlSecoes = (DropDownList)FormView1.Controls[0].FindControl("ddlSecoes");
            int idSecao = int.Parse(ddlSecoes.SelectedValue);
            Secoes secao = SecoesBLL.Listar().FirstOrDefault(p => p.idSecao == idSecao);
            e.Values.Add("secoes", secao);

            DateTime dt = (DateTime)e.Values["dtPublicacao"];
            int validadeAnuncio = int.Parse(System.Configuration.ConfigurationSettings.AppSettings["ValidadeAnuncio"]);
            e.Values["dtValidade"] = dt.AddDays(validadeAnuncio);
        }

        protected void ddlSecoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            populargvAnuncios();

        }

        private void populargvAnuncios()
        {
            var secaoSelecionada = int.Parse(ddlSecoes.SelectedValue);
            var anuncios = BLL.AnunciosBLL.ListarSecao(secaoSelecionada);
            gvAnuncios.DataSource = anuncios.ToList();
            gvAnuncios.DataBind();
        }

        protected void gvAnuncios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                var secao = BLL.AnunciosBLL.Listar(int.Parse(gvAnuncios.DataKeys[e.Row.RowIndex].Values["idAnuncio"].ToString())).secoes.idSecao;
                ((DropDownList)e.Row.FindControl("ddlSecoesGdv")).Items.FindByValue(secao.ToString()).Selected = true;
            }
        }

        protected void gvAnuncios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAnuncios.SelectedIndex = e.NewEditIndex;
            gvAnuncios.EditIndex = e.NewEditIndex;
            gvAnuncios.Rows[e.NewEditIndex].RowState = DataControlRowState.Edit;
            populargvAnuncios();
        }

        protected void gvAnuncios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAnuncios.SelectedIndex = -1;
            gvAnuncios.EditIndex = -1;
            gvAnuncios.Rows[e.RowIndex].RowState = DataControlRowState.Normal;
            populargvAnuncios();
        }

        protected void gvAnuncios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var idAnuncio = int.Parse(e.Keys["idAnuncio"].ToString());

            var anuncio = AnunciosBLL.Listar(idAnuncio);
            anuncio.Titulo = e.NewValues[0].ToString();
            anuncio.Descricao = e.NewValues[1].ToString();
            anuncio.dtPublicacao = Convert.ToDateTime(e.NewValues[2].ToString());
            anuncio.dtValidade = Convert.ToDateTime(e.NewValues[3].ToString());

            var idSecao =
                int.Parse(((DropDownList)gvAnuncios.Rows[e.RowIndex].FindControl("ddlSecoesGdv")).SelectedValue);
            anuncio.secoes = SecoesBLL.Listar().Where(s => s.idSecao == idSecao).SingleOrDefault();
            AnunciosBLL.Alterar();

            gvAnuncios.SelectedIndex = -1;
            gvAnuncios.EditIndex = -1;
            gvAnuncios.Rows[e.RowIndex].RowState = DataControlRowState.Normal;
            populargvAnuncios();
        }

        protected void gvAnuncios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var Anuncio = new Classificados.Dominio.Anuncios()
                              {
                                  idAnuncio = int.Parse(e.Keys["idAnuncio"].ToString())
                              };

            AnunciosBLL.Excluir(Anuncio);

            populargvAnuncios();

            ClientScript.RegisterStartupScript(Page.GetType(), Guid.NewGuid().ToString(), "alert('Anúncio excluído com sucesso!');", true);

        }

        protected void ddlSecoes_DataBound(object sender, EventArgs e)
        {
            populargvAnuncios();
        }
    }
}