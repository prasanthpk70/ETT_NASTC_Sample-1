using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace NASTC.BO.Models
{
    [DataContract]
    public class NastcMemberDetails
    {
        [DataMember]
        public long MemberDetailsId { get; set; }
        [DataMember]
        public long MembershipId { get; set; }
        [DataMember]
        public string FirstName { get; set; }
        [DataMember]
        public string LastName { get; set; }
        [DataMember]
        public string BusinessName { get; set; }
        [DataMember]
        public bool IsValidMember { get; set; }
    }
}
