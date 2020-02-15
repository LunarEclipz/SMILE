<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EADPProject.Login" %>

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

                            <h2 class="form-title">Sign in</h2>
                            <asp:Label ID="LblMsg" runat="server"></asp:Label>
                            <div class="form-group">
                                <asp:TextBox ID="TBEmail" class="form-control" runat="server" placeholder="Your Email" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TBPass" class="form-control" runat="server" placeholder="Your Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                            </div>


                            <div class="form-group form-button">
                                <asp:Button class="btn btn-light form-submit" ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" Width="100%" />
                            </div>
                            </div>
                            <div class="signup-image col-lg-4">
                                <figure>
                                    <img src="Images/signin-image.jpg" alt="sign in image">
                                </figure>
                            </div>
                        </div>
                        </div>
            </section>
    </form>
</asp:Content>
