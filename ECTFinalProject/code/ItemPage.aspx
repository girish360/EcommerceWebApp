<%@ Page Title="" Language="C#" MasterPageFile="~/code/Site.Master" AutoEventWireup="true" CodeBehind="ItemPage.aspx.cs" Inherits="ECTFinalProject.code.ItemPage"%>
<%@MasterType VirtualPath="~/code/Site.Master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/style.css" />
   </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
       <h1>Sandwiches</h1>
    
     <asp:panel runat="server" ID="panel1" CssClass="inLineBlockOne">
         
         <asp:ListView ID="productListView" runat="server">
             <ItemTemplate>
                 <br /><br /><br /><br />
            <asp:label ID="nameLbl" runat="server" CssClass="name" Text='<%#Eval("Name")%>' ></asp:label><br />
                <asp:label ID="description" CssClass="description" Width="300px" runat="server" Text='<%#Eval("Description")%>'></asp:label><br /><br />
               
                <img style="border:10px solid black;" width="300"height="300" src ='../Pictures/<%#Eval("ID")%>.jpg' /> 
                   
                 <br />
                 <br />
                
              
                 <asp:Label runat="server" Font-Size="20px" ID="priceLbl" Text='<%# "Price: $" + Eval("Cost")%>'></asp:Label>
                 <br />
                 <br />
                 <asp:Label runat="server" ID="quantitylbl" Text="Quantity" Font-Size="18px"></asp:Label>
            
                 <asp:TextBox runat="server" ID="quantityText" Width="25px" Text="1" Font-Size="Medium"></asp:TextBox>
                 <br />
                 <br />
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                 <asp:Button runat="server" Font-Size="15px" ID="addToCart" OnClick="addToCartClick" Text="Add To Cart" BackColor="ControlLightLight" Font-Bold="true" CommandArgument='<%#Eval("Id")%>' />
                 </ContentTemplate>
                      </asp:UpdatePanel>
                        
                 
                
                    
                 
                 </ItemTemplate>
             </asp:ListView>
            </asp:panel>
        
        
       

        <asp:Panel ID="panel2" runat="server" CssClass="inLineBlockTwo">
         <asp:ListView ID="productListView2" runat="server">
             <ItemTemplate>
               
            <br /><br /><br /><br />
           <asp:label ID="nameLbl" runat="server" Text='<%#Eval("Name")%>' CssClass="name" ></asp:label>
                <br />
                  <asp:label ID="description" CssClass="description"  Width="300px" runat="server" Text='<%#Eval("Description")%>'></asp:label><br /><br />
                 <img style="border:10px solid black;" width="300" height="300" src ='../Pictures/<%#Eval("ID")%>.jpg' /><br /><br />
                 <asp:Label runat="server" CssClass="priceLbl" Font-Size="20px" ID="priceLbl" Text='<%# "Price: $" + Eval("Cost") %>'></asp:Label>
                 <br /><br />
                
                 <asp:Label runat="server" ID="quantitylbl" Text="Quantity" Font-Size="18px"></asp:Label>
                <asp:TextBox runat="server" ID="quantityText" Width="25px" Text="1" Font-Size="Medium"></asp:TextBox>
                 <br />
                 <br />
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                 <asp:Button runat="server" Font-Size="15px" ID="addToCartBtn" OnClick="addToCartClick"  Text="Add To Cart" BackColor="ControlLightLight" Font-Bold="true" CommandArgument='<%#Eval("ID") %>'/>
                 </ContentTemplate>
                      </asp:UpdatePanel>
                  
                   
               
               
                

       
                 
                 </ItemTemplate>
             </asp:ListView>

         
            </asp:Panel>
         
    

</asp:Content>
