using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Classificados.Dominio;
using Classificados.BLL;

namespace Classificados.Teste
{
    [TestClass]
    public class ClientesTest
    {
        private int idCliente;

        [TestInitialize]
        public void InicializarTeste()
        {
            InserirClienteTest();
        }


        [TestMethod]
        public void InserirClienteTest()
        {
            var cliente = new Clientes();
            cliente.Cidade = "Fortaleza";
            cliente.Endereco = "Rua A";
            cliente.Estado = "CE";
            cliente.Nome = "Marcos";
            cliente.Telefone = "1122335678";

            idCliente = ClientesBLL.Inserir(cliente);

            Assert.IsTrue(idCliente > 0);
        }


        [TestMethod]
        public void alterarClienteBLLTest()
        {
            var cliente = ClientesBLL.Listar().FirstOrDefault(d => d.idCliente == idCliente);
            cliente.Cidade = "Recife";

            var clienteAntes = new Clientes();
            clienteAntes.Cidade = cliente.Cidade;
            clienteAntes.idCliente = cliente.idCliente;

            Classificados.BLL.ClientesBLL.Alterar(clienteAntes);

            var clienteModificado = Classificados.BLL.ClientesBLL.Listar().FirstOrDefault(c => c.idCliente == idCliente);


            Assert.AreEqual(clienteAntes.Cidade, clienteModificado.Cidade);
            Assert.AreEqual(clienteAntes.idCliente, clienteModificado.idCliente);
            Assert.AreNotSame(clienteAntes, clienteModificado);

        }

        [TestMethod]
        public void ExcluirClienteBLLTest()
        {
            Clientes ClienteExclusao = ClassificadosInstanceDB.db.Clientes.FirstOrDefault(c => c.idCliente== idCliente);

            if (ClienteExclusao != null)
                ClientesBLL.Excluir(ClienteExclusao);

            Clientes ClienteAposExclusao =
                ClientesBLL.Listar().FirstOrDefault(p => p.idCliente == idCliente);

            Assert.IsNull(ClienteAposExclusao);
        }
    }
}
