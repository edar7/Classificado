using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace Classificados.Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //Implementando o roteamento de url para o sistema de classificados

            #region Anuncios.aspx
            RouteTable.Routes.Add("Anuncios.aspx",
                new Route("ManterAnuncios", new PageRouteHandler("~/Anuncios.aspx")));
            #endregion

            #region AnunciosList.aspx
            RouteTable.Routes.Add("AnunciosList.aspx",
                new Route("Anuncios", new PageRouteHandler("~/AnunciosList.aspx")));
            #endregion

            #region ManterSecoes.aspx
            RouteTable.Routes.Add("ManterSecoes.aspx",
                new Route("ManterSecoes", new PageRouteHandler("~/ManterSecoes.aspx")));
            #endregion

            #region Clientes.aspx
            RouteTable.Routes.Add("Clientes.aspx",
                new Route("ManterClientes", new PageRouteHandler("~/Clientes.aspx")));
            #endregion

            #region Login.aspx
            RouteTable.Routes.Add("Login.aspx",
                new Route("Login", new PageRouteHandler("~/Login.aspx")));
            #endregion


        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}