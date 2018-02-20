using NHibernate.Cfg;
using NHibernate.Dialect;
using NHibernate.Driver;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace GunService
{
    class Program
    {
        static void Main(string[] args)
        {
            using (ServiceHost host = new ServiceHost(typeof(WCFGunService)))
            {
                host.Open();
                Console.WriteLine("Service is open.");
                Console.WriteLine("Press <ENTER> to close.");
                Console.ReadLine();
            }
        }
    }
}
