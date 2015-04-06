<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Return.aspx.cs" MasterPageFile="~/code/Site.Master" Inherits="ECTFinalProject.code.Return" %>
<%@MasterType VirtualPath="~/code/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
  
 
    <asp:Label id="lblStatus" runat="server" Text="Thank You For Your Order!" CssClass="purchaseStatus"></asp:Label><br /><br />
    <asp:Label ID="message" runat="server" Text="Your order history can be viewed on your <a href='Account.aspx'>Account Page</a>." CssClass="message"></asp:Label>
     
</asp:Content>

