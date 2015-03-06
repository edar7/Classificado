using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classificados.Dominio
{
    public class Anuncios
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int idAnuncio { get; set; }

        public string Descricao { get; set; }    

        public string Titulo { get; set; }        

        public byte[] Foto { get; set; }

        public DateTime dtPublicacao { get; set; }

        public DateTime dtValidade { get; set; }
        
        public bool Destaque { get; set; }

        public bool Promocao { get; set; }

        public Secoes secoes { get; set; }

    }
}
