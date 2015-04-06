<%@ Page Title="" Language="C#" MasterPageFile="~/code/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ECTFinalProject.code.Home" %>
<%@MasterType VirtualPath="~/code/Site.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <h2>The Gr8 Sandwich Shop</h2>
        <img style="border:10px ridge;" class="homePageImage" width="400"height="350" src ='../Pictures/10.jpg' /> 
    
    

      <asp:Button runat="server" ID="sandwichBtn" Text="Menu" CssClass="round-button1" OnClick="sandwichBtn_Click" />
     <asp:Button ID="cartBtn" Text="Cart" runat="server" CssClass="round-button2"  OnClick="cartBtn_Click"/>
     <asp:Button ID="ordersBtn" runat="server" CssClass="round-button3" Text="Account" OnClick="accountBtn_Click" />
       
   
   
    
</asp:Content>
