using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Classificados.BLL;
using Classificados.Dominio;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Classificados.Teste
{
    [TestClass]
    public class AnunciosTest
    {
        private int idSecao;

        [TestInitialize]
        public void InicializarTeste()
        {
            new SecoesTest().inserirSecoesBLLTest();
            idSecao = SecoesBLL.Listar().FirstOrDefault(s => s.Descricao == "SecaoBLL").idSecao;
            InserirAnuncioBLLTest();
        }

        [TestCleanup]
        public void FinalizarTeste()
        {
            Anuncios AnuncioExclusao = ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.Titulo == "MEU TITULO");

            if (AnuncioExclusao != null)
                AnunciosBLL.Excluir(AnuncioExclusao);
        }

        [TestMethod]
        public void InserirAnuncioBLLTest()
        {
            var anuncio = new Anuncios();
            anuncio.Descricao = "NONOONONONONONONONO";
            anuncio.Destaque = true;
            anuncio.dtPublicacao = DateTime.Now;
            anuncio.dtValidade = DateTime.Now.AddMonths(1);
            anuncio.secoes = ClassificadosInstanceDB.db.Secoes.FirstOrDefault(p => p.idSecao == idSecao);
            anuncio.Titulo = "MEU TITULO";

            int idAnuncio = AnunciosBLL.Inserir(anuncio);

            Assert.IsTrue(idAnuncio > 0);
        }

        [TestMethod]
        public void AlterarAnuncioBLLTest()
        {
            IQueryable<Anuncios> anuncios = AnunciosBLL.Listar();

            var idAnuncio = anuncios.ToList()[0].idAnuncio;

            Anuncios ALTAnuncio = ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.idAnuncio == idAnuncio);
            ALTAnuncio.Titulo = "MEU TITULO ALTERADO";
            ALTAnuncio.Destaque = false;
            AnunciosBLL.Alterar();

            Anuncios AnuncioModificado = ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.idAnuncio == idAnuncio);


            Assert.AreEqual(AnuncioModificado.Titulo, ALTAnuncio.Titulo);
            Assert.AreEqual(AnuncioModificado.Destaque, ALTAnuncio.Destaque);
        }

        [TestMethod]
        public void ExcluirAnuncioBLLTest()
        {
            Anuncios AnuncioExclusao = ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.Titulo == "MEU TITULO ALTERADO");

            if (AnuncioExclusao != null)
                AnunciosBLL.Excluir(AnuncioExclusao);

            Anuncios AnuncioAposExclusao =
                ClassificadosInstanceDB.db.Anuncios.FirstOrDefault(p => p.Titulo == "MEU TITULO ALTERADO");

            Assert.IsNull(AnuncioAposExclusao);
        }

        [TestMethod]
        public void ListarSecaoBLLTest()
        {
            var resultado = AnunciosBLL.ListarSecao(1, 0, 1);

            Assert.IsTrue(resultado.Count() == 1);
        }

        [TestMethod]
        public void ListarAnuncioBLLTest()
        {
            var idAnuncio = ClassificadosInstanceDB.db.Anuncios.ToList()[0].idAnuncio;

            var resultado = AnunciosBLL.Listar(idAnuncio);

            Assert.IsNotNull(resultado);
        }

        [TestMethod]
        public void ListarTotalAnuncioBLLTest()
        {
            var idAnuncio = ClassificadosInstanceDB.db.Anuncios.ToList()[0].idAnuncio;

            var totalRegistros = AnunciosBLL.Count(1, 0, 1);

            Assert.IsTrue(totalRegistros == 1);
        }

        [TestMethod]
        public void ListarStringAnuncioBLLTest()
        {
            var anuncio = ClassificadosInstanceDB.db.Anuncios.ToList()[0];

            var resultado = AnunciosBLL.Listar(anuncio.Titulo);
            var resultado2 = AnunciosBLL.Listar(anuncio.Descricao);

            Assert.IsNotNull(resultado);
            Assert.IsNotNull(resultado2);
        }

        [TestMethod]
        public void ListarSecaoAnuncioBLLTest()
        {
            var idAnuncio = ClassificadosInstanceDB.db.Anuncios.ToList()[0].idAnuncio;

            var totalRegistros = AnunciosBLL.ListarSecao(1).Count();

            Assert.IsTrue(totalRegistros > 0);
        }



    }
}
