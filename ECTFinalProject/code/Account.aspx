<%@ Page Title="" Language="C#" MasterPageFile="~/code/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ECTFinalProject.code.Account" %>
<%@MasterType VirtualPath="~/code/Site.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="../styles/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    

  
      
        
        <asp:Panel id="pnlMain" runat="server"  CssClass ="floatLeft">
            <asp:Label runat="server" Text="User Information" Font-Underline="true" ID="userinfo" CssClass="headerFontSmall"></asp:Label>
           
           
           
         <br />
         
            <br />
            
           <asp:Label ID="lblFirst" runat="server" CssClass="accountFont" /><br /><br />
           <asp:Label ID="lblLast" runat="server" CssClass="accountFont"  /><br /><br />
           <asp:Label ID="lblEmail" runat="server" CssClass="accountFont"></asp:Label><br /><br />
         <asp:Label ID="lblAddress" runat="server" CssClass="accountFont" /><br /><br />
           <asp:Label ID="lblCity" runat="server" CssClass="accountFont" /><br /><br />
           <asp:Label ID="lblState" runat="server" CssClass="accountFont" /><br /><br />
           
            <asp:Button ID="btnUpdate" runat="server" Text="Update Information" CssClass="greenBtn"  OnClick="btnUpdate_Click" /><br /><br />
            <asp:Button ID="btnChangePw" runat="server" Text="Change Password" CssClass="greenBtn" OnClick="btnChangePw_Click" />

        </asp:Panel>
    
     <asp:Panel id="orderHistory" runat="server" CssClass="floatRight">
            <asp:Label runat="server" CssClass="headerFontSmall2" Font-Underline="true" Text="Order History" ></asp:Label><br /><br />
        <asp:GridView ID="GridView2" OnRowDataBound="GridView2_RowDataBound" runat="server" HeaderStyle-CssClass="grid" AutoGenerateColumns="False"  DataKeyNames="ID" DataSourceID="SqlDataSource1" BackColor="Black" HeaderStyle-BackColor="LightGreen" HeaderStyle-Font="Algerian" BorderColor="Black" RowStyle-BackColor="Wheat" CssClass="orderHistory" BorderStyle="Solid" BorderWidth="3px" CellPadding="2" CellSpacing="2" Width="600px">
            <Columns>
       
                <asp:BoundField DataField="ID" HeaderText="Order ID" ItemStyle-Width="70px" InsertVisible="False" ReadOnly="True" SortExpression="ID" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Date" HeaderText="Date"  InsertVisible="false" ReadOnly="true" SortExpression="Date" ItemStyle-HorizontalAlign="Center" />
                 <asp:TemplateField HeaderText="Items" >
                     <ItemStyle Width="180px" />
                <ItemTemplate>
                    
                <asp:BulletedList ID="bltOrderDetails" Runat="server">
            </asp:BulletedList>
            
        </ItemTemplate>
        </asp:TemplateField>
                 <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="90px">
                     
                <ItemTemplate>
                <asp:BulletedList ID="listQuantity" Runat="server" CssClass="bulletList">
            </asp:BulletedList>
                    
            
        </ItemTemplate>
        </asp:TemplateField>
       
                <asp:BoundField HeaderText="Total" DataField="Total" InsertVisible="false" ReadOnly="true" SortExpression="Total" ItemStyle-HorizontalAlign="Center" />
       
            </Columns>
           
            
           
          
    <RowStyle ForeColor="Black" BackColor="#DEDFDE" Font-Bold="true"></RowStyle>
           
            </asp:GridView>
           
       
     
         
        
          
         
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBEntity %>"></asp:SqlDataSource>
           
       
     
         
        
          
         
        </asp:Panel>

       <asp:Panel Visible="false" ID="pnlUpdate" runat="server" CssClass="updatePanel">
    <asp:Label runat="server" ID="registerHeader" CssClass="headerFont" Text="Update Information"></asp:Label><br /><br />
    <asp:Label runat="server" ID="firstNamelbl" CssClass="loginLabel" Text="First Name"></asp:Label><br />
   <asp:Textbox runat="server" ID="firstNameTxt" AutoCompleteType="FirstName"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="firstNameTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
    <asp:Label runat="server" ID="lastNameLbl" CssClass="loginLabel" Text="Last Name"></asp:Label><br />
    <asp:Textbox runat="server" ID="lastNameTxt"  AutoCompleteType="LastName"></asp:Textbox><br />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="lastNameTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
     <asp:Label runat="server" ID="emailLbl" CssClass="loginLabel" Text="Email" ></asp:Label><br />
    <asp:Textbox runat="server" ID="emailTxt"  AutoCompleteType="Email"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="emailTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
      <asp:Label runat="server" ID="addressLbl" CssClass="loginLabel" Text="Address"></asp:Label><br />
    <asp:Textbox runat="server" ID="addressTxt" AutoCompleteType="HomeStreetAddress"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="addressTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
    <asp:Label runat="server" ID="cityLbl" CssClass="loginLabel" Text="City" ></asp:Label><br />
    <asp:Textbox runat="server" ID="cityTxt" AutoCompleteType="HomeCity"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Required" ControlToValidate="cityTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
     <asp:Label runat="server" ID="stateLbl" CssClass="loginLabel" Text="State"></asp:Label><br />
    <asp:Textbox runat="server" ID="stateTxt" AutoCompleteType="HomeState"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Required" ControlToValidate="stateTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
    <asp:Label runat="server" ID="userNamelbl2" CssClass="loginLabel" Text="User Name"></asp:Label><br />
    <asp:Textbox runat="server" ID="userNameTxt2"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Required" ControlToValidate="userNameTxt2" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
    <asp:Button ID="btnConfirmU" runat="server" Text="Update" ValidationGroup="register" OnClick="update_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
       </asp:Panel>

   
    <asp:Panel ID="pnlPassword" runat="server" Visible="false" CssClass="updatePanel">
           <asp:Label runat="server" Text="Change Password" CssClass="headerFont"></asp:Label><br /><br /><br /><br />
            <asp:Label runat="server" ID="passwordLbl" CssClass="loginLabel" Text="Current Password"></asp:Label><br />
            <asp:Textbox runat="server" ID="passwordTxt" TextMode="Password"></asp:Textbox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Required" ControlToValidate="passWordTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br />
     <asp:Label runat="server" ID="newPasswordLbl" CssClass="loginLabel" Text="New Password"></asp:Label><br />
    <asp:TextBox ID="newPasswordTxt" runat="server" TextMode="Password" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="newPassWordTxt" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br /><br />
           <asp:Label runat="server" ID="confirmLbl" CssClass="loginLabel" Text="Confirm Password"></asp:Label><br />
           <asp:TextBox ID="confirmTxt" runat="server" TextMode="Password" /><br />
         <asp:CompareValidator runat="server" ID="cmpNewP" ControlToCompare="newPasswordTxt" ControlToValidate="confirmTxt"
                ErrorMessage="*Passwords do not match." EnableClientScript="true"  /><br /> 
           
           
            <asp:Button ID="btnConfirm" runat="server" ValidationGroup="register" Text="Confirm" OnClick="passWordConfirm_Click" />
            <asp:Button ID="btnCancel2" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </asp:Panel>
        
       
   
        
    
</asp:Content>