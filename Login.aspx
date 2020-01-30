<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EADPProject.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="StyleSheets/navbar.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server">

    <div class="form-control col-6" style="margin-left: 25%; margin-top: 5%; opacity: 0.8; text-align: left;">
        <h1 class="text-center">L O G I N</h1>
        <asp:Label ID="LblMsg" runat="server"></asp:Label>
        <br />

        <div class="form-group">
            <label for="email">Email</label>
            <asp:TextBox ID="TBEmail" CssClass="form-control" runat="server" placeholder="Email" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <asp:TextBox ID="TBPass" CssClass="form-control" runat="server" placeholder="Password" AutoCompleteType="Disabled" TextMode ="Password"></asp:TextBox>
        </div>

        <asp:Button CssClass="btn btn-light" ID = "BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
</div>
            </form>
</asp:Content>
