using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECTFinalProject.models;
using System.Web.UI.HtmlControls;


namespace ECTFinalProject.code
{
    public partial class ItemPage : System.Web.UI.Page 
    {
        private int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["LoggedInId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                }
                userID = int.Parse(Session["LoggedInId"].ToString());
                
                //update cart text in header
                String cartCount = Session["cartCount"].ToString();
                this.Master.CartText = cartCount;
                String userName = Session["UserName"].ToString();
                Master.UserNameHeader = userName;
                Master.FindControl("signOut").Visible = true;
               
                using (ECTDBContext entities = new ECTDBContext())
                {
                    var sorted = entities.Products.OrderBy(c => c.ID);

                    var firstRowProducts = (from p in sorted
                                            select p).Skip(0).Take(5).ToList();

                    var secondRowProducts = (from p in sorted
                                             select p).Skip(5).Take(5).ToList();

                   
                   

                    if (!Page.IsPostBack)
                    {
                        productListView.DataSource = firstRowProducts;
                        productListView2.DataSource = secondRowProducts;

                        productListView.DataBind();
                        productListView2.DataBind();
                    }
                }

            }
        }



        public void addToCartClick(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {

                using (ECTDBContext context = new ECTDBContext())
                {
                    Button b = (Button)sender;
                    //store the commandargument attached to the delete button
                    int id = Convert.ToInt32(b.CommandArgument.ToString());

                    //Get quantity value from textbox
                    ListViewDataItem item = b.NamingContainer as ListViewDataItem;
                    TextBox quantityText = item.FindControl("quantityText") as TextBox;
                    int quantity = Convert.ToInt32(quantityText.Text);
                    if (quantity == 0)
                    {
                        return;
                    }
                    else
                    {
                        var product = (from p in context.Products
                                       where p.ID == id
                                       select p).FirstOrDefault();
                        var userOrdersList = (from o in context.Orders
                                              where o.CustomerID == userID && o.IsCart == "true"
                                              select o).ToList();
                        //If user has an existing cart
                        if (userOrdersList.Count > 0)
                        { 
                            //Edit the cart number at top of page
                            int cartCount = int.Parse(Session["cartCount"].ToString());
                            cartCount += quantity;
                            Session["cartCount"] = cartCount;
                            this.Master.CartText = cartCount.ToString();
                            var userOrders = userOrdersList.First();
                            var repeatOrderDetail = (from or in context.OrderDetails
                                                     where or.OrderID == userOrders.ID && or.ProductID == id
                                                     select or).FirstOrDefault();
                            if (repeatOrderDetail != null)
                            {
                                repeatOrderDetail.Quantity += quantity;
                                userOrders.Total += quantity * product.Cost;
                                context.SaveChanges();
                                var orderDetailSummary = (from orderDetail in context.OrderDetails
                                                          where orderDetail.OrderID == userOrders.ID
                                                          select orderDetail).ToList();
                                var updatedUserOrderList = (from o in context.Orders
                                                            where o.CustomerID == userID && o.IsCart == "true"
                                                            select o).ToList();
                            }
                            else
                            {
                                //Build new OrderDetail entry
                                var newOrderDetail = new OrderDetail();
                                newOrderDetail.ProductID = id;
                                //set orderID to the current order
                                newOrderDetail.OrderID = userOrders.ID;
                                newOrderDetail.Cost = product.Cost;
                                newOrderDetail.ProductName = product.Name;
                                newOrderDetail.Quantity = quantity;

                                //update the running total for entire order
                                userOrders.Total += newOrderDetail.Cost * newOrderDetail.Quantity;
                                context.OrderDetails.Add(newOrderDetail);
                                context.SaveChanges();
                            }
                        }
                        //if user does not have an existing cart
                        else
                        {
                            createNewCart(id, quantity);

                        }
                    }
                }
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }
            else
            {
                return;
            }
        }








        public void createNewCart(int itemID, int quantity)
        {
            using (ECTDBContext context = new ECTDBContext())
            {
                //Edit the cart number at top of page
                int cartCount = int.Parse(Session["cartCount"].ToString());
                cartCount += quantity;
                Session["cartCount"] = cartCount;
                Master.CartText = cartCount.ToString();
               
                
                //Build new Order entry
                var newOrder = new Order();
                newOrder.CustomerID = userID;
                newOrder.IsCart = "true";
                newOrder.Total = 0;
                newOrder.ShippingID = 1;
                newOrder.ShippingAddressID = 1;
                context.Orders.Add(newOrder);
                context.SaveChanges();
                //Build new OrderDetail entry
                var newOrderDetail = new OrderDetail();

                //find new order
                var newOrderVar = (from order in context.Orders
                                       where order.IsCart == "true" && order.CustomerID==userID
                                       select order).FirstOrDefault();
             
                newOrderDetail.OrderID = newOrderVar.ID;
                var product = (from p in context.Products
                               where p.ID == itemID
                               select p).FirstOrDefault();
                newOrderDetail.Cost = product.Cost;
                newOrderDetail.Quantity = quantity;
                newOrderDetail.ProductID = itemID;
                newOrderDetail.ProductName = product.Name;
                newOrderVar.Total += newOrderDetail.Cost * newOrderDetail.Quantity;
                context.OrderDetails.Add(newOrderDetail);
                context.SaveChanges();
               }
        }

        protected override void OnPreRender(EventArgs e){
            
            ViewState["update"] = Session["update"];
        }
     }
 }
        



 
