using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classificados.Dominio
{
    public class Secoes
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int idSecao { get; set; }

        public string Descricao { get; set; }

        public virtual ICollection<Anuncios> Anuncios { get; set; }
    }
}
