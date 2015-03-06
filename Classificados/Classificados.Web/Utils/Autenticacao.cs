using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classificados.Web.Utils
{
    public class Autenticacao
    {
        internal static void VerificarAutenticacao()
        {
            var autenticado = (HttpContext.Current.Session["login"] != null && HttpContext.Current.Session["login"].ToString() == "admin");
            if (!autenticado)
                HttpContext.Current.Response.Redirect("Login");
        }
    }
}