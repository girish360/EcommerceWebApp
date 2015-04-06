using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ECTFinalProject.models;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace ECTFinalProject.models
{
    public class Order
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public String IsCart { get; set; }
        public Decimal Total { get; set; }
        public int ShippingID { get; set; }
        public int ShippingAddressID { get; set; }
        public String Date { get; set; }

        
    }
}