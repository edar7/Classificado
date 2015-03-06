using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classificados.Persistencia
{
    public static class Repositorio
    {
        static ClassificadosContext context;


        public static ClassificadosContext Iniciar()
        {
            context = new ClassificadosContext();
            return context;
        }
    }
}
