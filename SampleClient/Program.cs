using DomainModel;
using SharedServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace SampleClient
{
    class Program
    {
        static void Main(string[] args)
        {
            ChannelFactory<IWCFGunService> channelFactory = new ChannelFactory<IWCFGunService>("HttpEndpointClient");

            IWCFGunService proxy = channelFactory.CreateChannel();

            List<Persons> persons = proxy.DoWork().ToList();

            foreach (var person in persons)
            {
                Console.WriteLine("Name: {0}, Surname: {1}", person.FirstName, person.Surname);
            }

            Console.ReadKey();
        }
    }
}
