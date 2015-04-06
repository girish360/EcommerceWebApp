using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECTFinalProject.models;
using System.Web.UI.HtmlControls;
using System.Data;

namespace ECTFinalProject.code
{
    public partial class Account : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else{

                int userID = Int32.Parse(Session["LoggedInId"].ToString());
                String cartCount = Session["cartCount"].ToString();
                Master.CartText = cartCount;
                String userName = Session["UserName"].ToString();
                Master.UserNameHeader = userName;
                Master.FindControl("signOut").Visible = true;

                //To display order history gridview
                SqlDataSource1.SelectParameters.Add("userID", userID.ToString());
                SqlDataSource1.SelectParameters.Add("false", "false");
                SqlDataSource1.SelectCommand = "select Orders.ID, Orders.Total, Orders.Date from Orders where @userID = Orders.CustomerID and Orders.IsCart = @false";


                using (ECTDBContext context = new ECTDBContext())
                {


                    var customer = (
                        from c in context.Customers
                        where c.ID == userID
                        select c).FirstOrDefault();
                    var address = (
                        from a in context.Addresses
                        where a.CustomerID == userID
                        select a).FirstOrDefault();


                    lblFirst.Text = "First Name: " + customer.FirstName;
                    lblLast.Text = "Last Name: " + customer.LastName;
                    lblEmail.Text = "Email: " + customer.Email;
                    lblAddress.Text = "Address: " + address.Address1;
                    lblCity.Text = "City: " + address.City;
                    lblState.Text = "State: " + address.State;
                }
            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            pnlMain.Visible = false;
            orderHistory.Visible = false;
            pnlUpdate.Visible = true;
          

        }

        protected void btnChangePw_Click(object sender, EventArgs e)
        {
            pnlMain.Visible = false;
            orderHistory.Visible = false;
            pnlPassword.Visible = true;
            

        }



        protected void update_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlMain.Visible = true;
                pnlUpdate.Visible = false;
                using (ECTDBContext entities = new ECTDBContext())
                {
                    var userID = Int32.Parse(Session["LoggedInId"].ToString());
                    var userInfo = (from u in entities.Customers
                                    where u.ID == userID
                                    select u).FirstOrDefault();
                    var userAddress = (from a in entities.Addresses
                                       where a.CustomerID == userID
                                       select a).FirstOrDefault();
                    userInfo.Email = emailTxt.Text;
                    userInfo.FirstName = firstNameTxt.Text;
                    userInfo.LastName = lastNameTxt.Text;
                    userInfo.UserName = userNameTxt2.Text;
                    userAddress.Address1 = addressTxt.Text;
                    userAddress.State = stateTxt.Text;
                    userAddress.City = cityTxt.Text;
                    entities.SaveChanges();
                }
                Response.Redirect("Account.aspx");
            }
        }




        protected void passWordConfirm_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlMain.Visible = true;
                orderHistory.Visible = true;
                pnlPassword.Visible = false;
                using (ECTDBContext entities = new ECTDBContext())
                {
                    var pwdHash = SecuredPassword.GenerateHash(passwordTxt.Text);
                    var userID = Int32.Parse(Session["LoggedInId"].ToString());
                    var customer = (from c in entities.Customers
                                    where c.ID == userID
                                    select c).FirstOrDefault();
                    if (customer.Password == pwdHash && newPasswordTxt.Text.ToString().Length > 0)
                    {
                        customer.Password = SecuredPassword.GenerateHash(newPasswordTxt.Text);
                        entities.SaveChanges();
                    }
                }
            }
        }

        
        
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }



        protected void GridView2_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //databind the orderdetail bulleted list by calling getProducts method
                var rowView = (DataRowView)e.Row.DataItem;
                var bullet = (BulletedList)e.Row.FindControl("bltOrderDetails");
                bullet.DataSource = getProducts(rowView["ID"]);
                bullet.DataBind();

                var list = (BulletedList)e.Row.FindControl("listQuantity");
                list.DataSource = getQuantities(rowView["ID"]);
                list.DataBind();


            }
        }

        private List<String> getProducts(Object ID)
        {

            int orderID = Convert.ToInt32(ID);
            using (ECTDBContext entities = new ECTDBContext())
            {
                var products = (from od in entities.OrderDetails
                                where od.OrderID == orderID
                                select od.ProductName).ToList();
                return products;
            }
        }



        private List<int> getQuantities(Object ID)
        {
            int orderID = Convert.ToInt32(ID);
            using (ECTDBContext entities = new ECTDBContext())
            {
                var quantities = (from od in entities.OrderDetails
                                  where od.OrderID == orderID
                                  select od.Quantity).ToList();
               
                return quantities;

            }





        }
    }
}