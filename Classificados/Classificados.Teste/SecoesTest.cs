using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Classificados.Persistencia;
using Classificados.Dominio;

namespace Classificados.Teste
{
    [TestClass]
    public class SecoesTest
    {
        private ClassificadosContext repositorio;

        [TestInitialize]
        public void IniciarTeste()
        {
            repositorio = Repositorio.Iniciar();
        }


        [TestMethod]
        public void inserirSecoesTest()
        {
            var secoes = new Secoes()
                             {
                                 Descricao = "Secao1"
                             };
            repositorio.Secoes.Add(secoes);
            repositorio.SaveChanges();
        }

        [TestMethod]
        public void inserirSecoesBLLTest()
        {
            var secoes = new Secoes()
            {
                Descricao = "SecaoBLL"
            };

            var idSecao = Classificados.BLL.SecoesBLL.Inserir(secoes);

            Assert.IsTrue(idSecao>0);

        }

        [TestMethod]
        public void alterarSecoesBLLTest()
        {
            var secao = Classificados.BLL.SecoesBLL.Listar().FirstOrDefault(d => d.Descricao == "Secao2");
            secao.Descricao = "Secao3";        
            
            Classificados.BLL.SecoesBLL.Alterar(secao);

            var secaoModificada = Classificados.BLL.SecoesBLL.Listar().FirstOrDefault(d => d.idSecao == secao.idSecao);


            Assert.AreEqual(secao.Descricao, secaoModificada.Descricao);
            Assert.AreEqual(secao.idSecao,secaoModificada.idSecao);

        }

        [TestMethod]
        public void excluirSecoesBLLTest()
        {
            Secoes secaoExclusao = Classificados.BLL.SecoesBLL.Listar().FirstOrDefault(p => p.Descricao == "SecaoBLLAlterada");

            if (secaoExclusao != null)
                Classificados.BLL.SecoesBLL.Excluir(secaoExclusao);

            Secoes secaoAposExclusao =
                Classificados.BLL.SecoesBLL.Listar().FirstOrDefault(p => p.Descricao == "SecaoBLLAlterada");

            Assert.IsNull(secaoAposExclusao);

        }
    }
}
