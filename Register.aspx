<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EADPProject.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/navbar.css" rel="stylesheet" />
    <link rel="stylesheet" href="Login_css/style.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <section class="signup mt-3">
            <div class="container">
                <div class="signup-content row">
                    <div class="signup-form col-lg-4">

                        <h2 class="form-title">Register</h2>
                        <asp:Label ID="LblMsg" runat="server"></asp:Label>

                        <div class="form-group">
                            <asp:TextBox ID="TBUsername" class="form-control" runat="server" placeholder="Username" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="TBFName" class="form-control" runat="server" placeholder="First Name" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="TBLName" class="form-control" runat="server" placeholder="Last Name" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>


                        <div class="form-group">
                            <asp:TextBox ID="TBEmail" class="form-control" runat="server" placeholder="Email" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="TBPass" class="form-control" runat="server" placeholder="Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="TBCfmPass" class="form-control" runat="server" placeholder="Confirm Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                        </div>

                        <asp:Button class="btn btn-light form-submit mb-2" ID="BtnReg" runat="server" Text="Register" OnClick="BtnReg_Click1" Width="100%" />

                        <a href="/Login.aspx">Sign in instead</a>
                    </div>
                    <div class="signup-image col-lg-4">
                        <p>Sign Up As</p>
                        <asp:RadioButtonList ID="RBList" runat="server" Width="10px">
                            <asp:ListItem Text="User"/>
                            <asp:ListItem Text="Photographer"/>
                            <asp:ListItem Text="Organisation"/>
                        </asp:RadioButtonList>
                        <figure class="mt-3">
                            <img src="Images/signup-image.jpg" alt="sign up image">
                        </figure>
                    </div>
                </div>
            </div>
        </section>

    </form>
</asp:Content>
