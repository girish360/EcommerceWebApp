using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECTFinalProject.models
{
    public class OrderDetail
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public Decimal Cost { get; set; }
        public String ProductName { get; set; }
    }
}