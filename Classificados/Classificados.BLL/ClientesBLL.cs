using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classificados.Dominio;

namespace Classificados.BLL
{
    public class ClientesBLL
    {
        #region Listar (R - Retrieve)

        public static IQueryable<Clientes> Listar()
        {
            return ClassificadosInstanceDB.db.Clientes.AsQueryable<Clientes>();
        }

        #endregion

        #region Inserir (C - Create)

        public static int Inserir(Clientes clientes) {
            ClassificadosInstanceDB.db.Clientes.Add(clientes);
            ClassificadosInstanceDB.db.SaveChanges();

            return clientes.idCliente;
        }

        #endregion

        #region Excluir (D - Delete)

        public static void Excluir(Clientes pCliente) {
            Clientes cliente = ClassificadosInstanceDB.db.Clientes.FirstOrDefault(p => p.idCliente == pCliente.idCliente);
            ClassificadosInstanceDB.db.Clientes.Remove(cliente);
            ClassificadosInstanceDB.db.SaveChanges();
        }

        #endregion

        #region Alterar (U - Update)

        public static void Alterar(Clientes c)
        {
            Clientes cliente = ClassificadosInstanceDB.db.Clientes.FirstOrDefault(p => p.idCliente == c.idCliente);
            cliente.Cidade = c.Cidade;
            cliente.Endereco = c.Endereco;
            cliente.Estado = c.Estado;
            cliente.Nome = c.Nome;
            //cliente.Telefone = c.Telefone;            
            ClassificadosInstanceDB.db.SaveChanges();
        }

        #endregion

    }
}
