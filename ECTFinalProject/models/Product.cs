using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECTFinalProject.models
{
    public class Product
    {
        public int ID { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public Decimal Cost { get; set; }
        public int TotalOnHand { get; set; }
        public String IsActive { get; set; }
    }
}