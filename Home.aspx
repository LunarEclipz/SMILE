<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EADPProject.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
   
    
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LblUser" runat="server"></asp:Label>
            <br />
        </div>
        <asp:Button ID="BtnUser" runat="server" OnClick="BtnUser_Click" Text="Button" />
    </form>
</asp:Content>
