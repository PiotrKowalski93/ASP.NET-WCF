using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Persons
    {
        public virtual int Id { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string Surname { get; set; }
        public virtual int JobId { get; set; }
        public virtual string Gender { get; set; }
        public virtual string  City { get; set; }
        public virtual int AgeGroupId { get; set; }
    }
}
