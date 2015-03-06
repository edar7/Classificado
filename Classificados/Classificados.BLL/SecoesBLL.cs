using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classificados.Dominio;

namespace Classificados.BLL
{
    public class SecoesBLL
    {
        #region Listar (R - Retrieve)

        public static IQueryable<Secoes> Listar()
        {
            return ClassificadosInstanceDB.db.Secoes.AsQueryable<Secoes>();
        }

        #endregion

        #region Inserir (C - Create)

        public static int Inserir(Secoes secoes)
        {
            if (!ExisteSecao(secoes))
            {
                ClassificadosInstanceDB.db.Secoes.Add(secoes);
                ClassificadosInstanceDB.db.SaveChanges();
            }
            else
            {
                throw new Exception("Já existe uma secao com esse nome");
            }

            return secoes.idSecao;
        }

        private static bool ExisteSecao(Secoes secoes)
        {
            var retorno = (from s in ClassificadosInstanceDB.db.Secoes
                           where s.Descricao.Contains(secoes.Descricao)
                           select s).ToList();
            return retorno != null && retorno.Count() > 0;
        }

        #endregion

        #region Excluir (D - Delete)

        public static void Excluir(Secoes secoes)
        {
            Secoes secao = ClassificadosInstanceDB.db.Secoes.FirstOrDefault(p => p.idSecao == secoes.idSecao);
            ClassificadosInstanceDB.db.Secoes.Remove(secao);
            ClassificadosInstanceDB.db.SaveChanges();
        }

        #endregion

        #region Alterar (U - Update)

        public static void Alterar(Secoes secoes)
        {
            var secaoUpdate = Listar().Where(s => s.idSecao == secoes.idSecao).SingleOrDefault();
            secaoUpdate.Descricao = secoes.Descricao;


            ClassificadosInstanceDB.db.SaveChanges();            
        }

        #endregion

    }
}
