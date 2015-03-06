using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Classificados.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var autenticado = (Session["login"] != null && Session["login"].ToString() == "admin");
                pnlAutenticado.Visible = autenticado;
                pnlSemAutenticacao.Visible = !autenticado;
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (txtLogin.Text == "admin" && txtSenha.Text == "admin")
            {
                Session["login"] = "admin";
                Response.Redirect("ManterAnuncios");
            }
            else
            {
                Response.Write("Login ou senha incorretos.");
            }
        }
    }
}