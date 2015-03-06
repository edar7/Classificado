using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Classificados.Web
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            fvClientes.ChangeMode(FormViewMode.Edit);
            fvClientes.PageIndex = gvClientes.SelectedIndex;
        }
    }
}