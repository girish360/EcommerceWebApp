using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECTFinalProject.models;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace ECTFinalProject.code
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private int userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!IsPostBack)
                {
                    Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                }

           
            userID = int.Parse(Session["LoggedInId"].ToString());
            String cartCount = Session["cartCount"].ToString();
            Master.CartText = cartCount;
            String userName = Session["UserName"].ToString();
            Master.UserNameHeader = userName;
            Master.FindControl("signOut").Visible = true;

            using (ECTDBContext context = new ECTDBContext())
                    {
                        var orderList = (from o in context.Orders
                                         where o.CustomerID == userID && o.IsCart == "true"
                                         select o).ToList();
                        if (orderList.Count != 0)
                        {
                            var order = orderList.First();
                            var orderDetailList = (from od in context.OrderDetails
                                                   where od.OrderID == order.ID
                                                   select od).ToList();
                            if (!Page.IsPostBack)
                            {
                                totalListView.DataSource = orderList;

                                summaryListView.DataSource = orderDetailList;
                                totalListView.DataBind();

                                summaryListView.DataBind();
                            }

                        }
                    }


                }
             
        
        


        public void removeFromCart(Object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {

                Button b = (Button)sender;
                //store the commandargument attached to the delete button
                int id = Convert.ToInt32(b.CommandArgument.ToString());
                using (ECTDBContext context = new ECTDBContext())
                {
                    var orderDetail = (from o in context.OrderDetails
                                       where o.ID == id
                                       select o).FirstOrDefault();
                    Decimal deletePrice = orderDetail.Cost * orderDetail.Quantity;
                    context.OrderDetails.Remove(orderDetail);
                    context.SaveChanges();
                    //update cart item number at top of page
                    int cartCount = int.Parse(Session["cartCount"].ToString());
                    cartCount -= orderDetail.Quantity;
                    Session["cartCount"] = cartCount;
                    Master.CartText = cartCount.ToString();
                    var updatedOrder = (from order in context.Orders
                                        where order.CustomerID == userID && order.IsCart == "true"
                                        select order).ToList();
                    var newOrder = updatedOrder.First();
                    newOrder.Total -= deletePrice;
                    context.SaveChanges();

                    var updatedOrderDetail = (from od in context.OrderDetails
                                              where od.OrderID == newOrder.ID
                                              select od).ToList();

                    summaryListView.DataSource = updatedOrderDetail;
                    totalListView.DataSource = updatedOrder;
                    summaryListView.DataBind();
                    totalListView.DataBind();

                }
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }
            else
            {
                return;
            }
        }



        public void placeOrderClick(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {

                using (ECTDBContext context = new ECTDBContext())
                {

                    var order = (from or in context.Orders
                                 where or.CustomerID == userID && or.IsCart == "true"
                                 select or).FirstOrDefault();
                    if (order != null)
                    {
                        String cost = order.Total.ToString();
                        String orderID = order.ID.ToString();
                        var orderDetailList = (from od in context.OrderDetails
                                               where od.OrderID == order.ID
                                               select od).ToList();
                        foreach (OrderDetail od in orderDetailList)
                        {
                            if (od.OrderID == order.ID)
                            {

                                int quantity = od.Quantity;
                                int productID = od.ProductID;
                                var product = (from p in context.Products
                                               where p.ID == productID
                                               select p).FirstOrDefault();

                                product.TotalOnHand -= quantity;
                                order.IsCart = "false";
                                order.Date = DateTime.Now.ToString("MM/dd/yy");
                                Session["cartCount"] = "0";
                                context.SaveChanges();




                                RedirectUser(orderID, cost);

                            }
                        }

                        Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                    }
                }
            }
            else
            {
                return;
            }
        }
        




        protected void RedirectUser(String orderID, String cost)
        {
            //Assign the values for the properties we need to pass to the service
            String AppId = ConfigurationManager.AppSettings["CreditAppId"];
            String SharedKey = ConfigurationManager.AppSettings["CreditAppSharedKey"];
            String AppTransId = orderID;
            String AppTransAmount = cost;

            // Hash the values so the server can verify the values are original
            String hash = HttpUtility.UrlEncode(CreditAuthorizationClient.GenerateClientRequestHash(SharedKey, AppId, AppTransId, AppTransAmount));

            //Create the URL and  concatenate  the Query String values
            String url = "http://ectweb2.cs.depaul.edu/ECTCreditGateway/Authorize.aspx";
            url = url + "?AppId=" + AppId;
            url = url + "&TransId=" + AppTransId;
            url = url + "&AppTransAmount=" + AppTransAmount;
            url = url + "&AppHash=" + hash;

            //Redirect the User to the Service
            Response.Redirect(url);
        }

        
        
        protected override void OnPreRender(EventArgs e)
        {

            ViewState["update"] = Session["update"];
        }
    }
}