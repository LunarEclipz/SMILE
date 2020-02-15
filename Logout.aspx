<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="EADPProject.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server">
    You have been Logged out!<br />
    <br />
    <asp:Button ID="BtnLogout" runat="server" CssClass="auto-style1" OnClick="BtnLogout_Click" Text="Return to Home Page" />
</form>
</asp:Content>
