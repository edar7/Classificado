using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classificados.Dominio
{
    public class Clientes
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int idCliente { get; set; }

        public string Nome { get; set; }

        public string Endereco { get; set; }

        public string Cidade { get; set; }

        public string Estado { get; set; }

        public string Telefone { get; set; }
    }
}
