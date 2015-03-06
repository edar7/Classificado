using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Classificados.Web
{
    public partial class AnunciosList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetTextBoolean(object objBoolean)
        {
            string strText = (objBoolean == null) ? string.Empty : objBoolean.ToString();
            return (strText == "True") ? "Sim" : "Não"; // novo
        }
    }
}