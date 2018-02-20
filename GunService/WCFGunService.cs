using DomainModel;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Dialect;
using NHibernate.Driver;
using SharedServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace GunService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WCFGunService" in both code and config file together.
    public class WCFGunService : IWCFGunService
    {
        private readonly ISessionFactory sefact;

        public WCFGunService()
        {
            var cfg = new Configuration();

            string connString = @"Data Source = LAPTOP-7CSJCLE6\SQLSERVER; Initial Catalog = GunPermissions; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = True; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";

            //string DataSource = @"LAPTOP-7CSJCLE6\SQLSERVER";
            //string InitialCatalog = "GunPermissions";
            //string IntegratedSecurity = "True";
            //string ConnectTimeout = "30";
            //string Encrypt = "False";
            //string TrustServerCertificate = "True";
            //string ApplicationIntent = "ReadWrite";
            //string MultiSubnetFailover = "False";

            cfg.DataBaseIntegration(x => {
                x.ConnectionString = connString;
                x.Driver<SqlClientDriver>();
                x.Dialect<MsSql2012Dialect>();
            });

            cfg.AddAssembly(Assembly.GetExecutingAssembly());

            sefact = cfg.BuildSessionFactory();           
        }

        public IEnumerable<Persons> DoWork()
        {
            IList<Persons> persons;

            try
            {
                using (var session = sefact.OpenSession())
                {
                    using (var tx = session.BeginTransaction())
                    {
                        persons = session.CreateCriteria<Persons>().List<Persons>();                        
                    }
                }

            }
            catch (Exception ex)
            {
                throw;
            }
                       
            return persons.Where(x => x.Id < 10);
        }
    }
}
