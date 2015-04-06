<%@ Page Title="" Language="C#" MasterPageFile="~/code/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="ECTFinalProject.code.CheckOut" %>
<%@MasterType VirtualPath="~/code/Site.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <h1>Cart</h1>
       
        <asp:Panel ID="cartPanel" runat="server" CssClass="cartPanel">
         
        <asp:ListView ID="summaryListView" runat="server">
            <ItemTemplate>
           
            
                      
                          
                            <asp:Label ID="nameLbl" CssClass="cartName" Font-Size="20px" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                          <br />

                         <img width="100" style="border:3px solid black" height="100" src = '../Pictures/<%#Eval("ProductID")%>.jpg'/>
                             <asp:Label ID="quantityLbl" CssClass="cartQ" runat="server" Font-Size="20px" Text='<%# "Quantity:" + " " + Eval("Quantity") %>'></asp:Label>
                        
                          <asp:Label ID="priceLbl" CssClass="cartPrice" runat="server" Font-Size="20px" Text='<%# "$" + Eval("Cost") %>'></asp:Label>
                        
                           <asp:Button runat="server" ID="deleteBtn" OnClick="removeFromCart" Font-Bold="true" Text="Remove" CssClass="deleteBtn" BackColor="Red"  CommandArgument='<%#Eval("ID") %>' />
                          <br /><br />
                          
                         

                      
               
                </ItemTemplate>
            
                   </asp:ListView> <br />
            </asp:Panel>
     <br />
     <br />
     <br />
        <asp:Panel ID="totalPanel" runat="server" CssClass="totalPanel">
            <asp:Label ID="total" runat="server" Text="Total:" CssClass="total"></asp:Label>
            <asp:ListView ID="totalListView" runat="server">
                <ItemTemplate>
     <asp:Label runat="server" ID="totallbl" Text='<%# "$" + Eval("Total") %>' CssClass="totalLbl"></asp:Label>
            </ItemTemplate>
                </asp:ListView>
            <asp:Button ID="placeOrderBtn" OnClick="placeOrderClick" CssClass="placeOrderBtn" runat="server" Text="Place Order"/>
            </asp:Panel>
           
     
     
     
         <br /><br /><br />
            
     

</asp:Content>
