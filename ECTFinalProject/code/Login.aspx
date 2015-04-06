<%@ Page Title="" Language="C#" MasterPageFile="~/code/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECTFinalProject.code.Login" %>
<%@MasterType VirtualPath="~/code/Site.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="../styles/style.css" />
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        <h3>The Gr8 Sandwich Shop</h3>
      <p>
        <asp:Label runat="server" ID="header" Text="Login" CssClass="headerFont"></asp:Label><br /><br />
        <asp:Label ID="userNameLbl" runat="server" Text =" User Name:" CssClass="userNameLbl"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="userNameTxt"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Username Required" ControlToValidate="txtUserName" ID="RequiredFieldValidator1" CssClass="validate"></asp:RequiredFieldValidator><br /><br />
        <asp:Label ID="passwordLbl" runat="server" Text="Password:" CssClass="passWordLbl"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="passWordTxt"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" ID="RequiredFieldValidator2" CssClass="passwordError"></asp:RequiredFieldValidator><br /><br />
        <asp:Button runat="server" ID="btnLogin" OnClick="login" CssClass="loginBtn" Text="Login" ></asp:Button><br /><br />
        <asp:Label runat="server" ID="errorMessage" CssClass="validate" Text ="Username or Password incorrect" Visible="false"></asp:Label>
          </p>
        
       
       
    <div class="p2" id="registerControl" runat="server">
    <asp:Label runat="server" ID="registerHeader" CssClass="headerFont" Text="Register"></asp:Label><br /><br />
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
    <asp:Label runat="server" ID="passwordLbl2" CssClass="loginLabel" Text="Password"></asp:Label><br />
    <asp:Textbox runat="server" ID="passwordTxt2" TextMode="Password"></asp:Textbox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Required" ControlToValidate="passwordTxt2" ValidationGroup="register" CssClass="validate"></asp:RequiredFieldValidator><br /><br />
    <asp:Button runat="server" ID="registerBtn" OnClick="registerBtn_Click" ValidationGroup="register" Text="Register" CssClass="registerBtn" />
    <asp:Label runat="server" ID="registerSuccessLbl" Text="You have successfully registered!" Visible="false" CssClass="registerSuccess"></asp:Label>
        </div>
 

    





    
           
				
       
       
</asp:Content>
