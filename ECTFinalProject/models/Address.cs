using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECTFinalProject.models
{
    public class Address
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public String Address1 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String AddressType { get; set; }
    }
}