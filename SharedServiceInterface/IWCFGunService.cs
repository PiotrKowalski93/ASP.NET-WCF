using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace SharedServiceInterface
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWCFGunService" in both code and config file together.
    [ServiceContract]
    public interface IWCFGunService
    {
        [OperationContract]
        IEnumerable<Persons> DoWork();
    }
}
