using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using Classificados.Dominio;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Classificados.Persistencia
{
    public class ClassificadosContext : DbContext
    {
        public DbSet<Secoes> Secoes { get; set; }

        public DbSet<Anuncios> Anuncios { get; set; }

        public DbSet<Clientes> Clientes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<ClassificadosContext>(new DropCreateDatabaseIfModelChanges<ClassificadosContext>());
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            base.OnModelCreating(modelBuilder);
        }


    }
}
