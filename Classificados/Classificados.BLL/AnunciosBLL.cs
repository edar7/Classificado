using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using Classificados.Dominio;

namespace Classificados.BLL
{
    public class AnunciosBLL
    {
        #region Listar (R - Retrieve)

        public static int Count(int idSecao, int startRow, int maxRows)
        {
            return ClassificadosInstanceDB.db.Anuncios.Where(p => p.secoes.idSecao == idSecao).Count();
        }


        public static IQueryable<Anuncios> Listar()
        {
            return ClassificadosInstanceDB.db.Anuncios.AsQueryable<Anuncios>();
        }

        public static IQueryable<Anuncios> ListarAnunciosAtivosGerais()
        {
            return Listar().Where(a => a.dtValidade > DateTime.Now && a.dtPublicacao < DateTime.Now && !a.Destaque);
        }

        public static IQueryable<Anuncios> ListarAnunciosAtivosDestaque()
        {
            return Listar().Where(a => a.dtValidade > DateTime.Now && a.dtPublicacao < DateTime.Now && a.Destaque);
        }

        public static IQueryable<Anuncios> ListarSecao(int idSecao)
        {
            return ClassificadosInstanceDB.db.Anuncios.Where(p => p.secoes.idSecao == idSecao);
        }

        public static IQueryable<Anuncios> ListarSecao(int idSecao, int startRow, int maxRows)
        {
            return ClassificadosInstanceDB.db.Anuncios.Where(p => p.secoes.idSecao == idSecao).OrderBy(p => p.idAnuncio).Skip(startRow).Take(maxRows);
        }


        public static IQueryable<Anuncios> Listar(string busca)
        {
            return ClassificadosInstanceDB.db.Anuncios.Where(p => p.Descricao.Contains(busca) || p.Titulo.Contains(busca));
        }

        public static Anuncios Listar(int idAnuncio)
        {
            return ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.idAnuncio == idAnuncio);
        }

        #endregion

        #region Inserir (C - Create)

        public static int Inserir(Anuncios anuncio) {
            ClassificadosInstanceDB.db.Anuncios.Add(anuncio);
            ClassificadosInstanceDB.db.SaveChanges();

            return anuncio.idAnuncio;
        }

        #endregion

        #region Excluir (D - Delete)

        public static void Excluir(Anuncios pAnuncio)
        {
            Anuncios anuncio = ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.idAnuncio == pAnuncio.idAnuncio);
            ClassificadosInstanceDB.db.Anuncios.Remove(anuncio);
            ClassificadosInstanceDB.db.SaveChanges();
        }

        #endregion

        #region Alterar (U - Update)

        public static void Alterar()
        {
            ClassificadosInstanceDB.db.SaveChanges();
        }

        #endregion

    }
}
