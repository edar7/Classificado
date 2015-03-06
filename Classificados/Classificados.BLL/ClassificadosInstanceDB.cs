using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classificados.Persistencia;

namespace Classificados.BLL
{
    public class ClassificadosInstanceDB
    {
        public static ClassificadosContext db = Repositorio.Iniciar();
    }
}
