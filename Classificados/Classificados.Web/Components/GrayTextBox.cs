using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classificados.Web.Components
{
    public class GrayTextBox : System.Web.UI.WebControls.TextBox
    {
        public GrayTextBox()
        {
            this.BackColor = System.Drawing.Color.LightGray;
            this.BorderColor = System.Drawing.Color.Black;
            this.Font.Bold = true;
            this.Font.Size = 12;
        }
    }
}