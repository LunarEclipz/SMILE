<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="EADPProject.AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div>
            <div>
                <h1 class="auto-style4">ADD ADMIN</h1>

                <asp:Label ID="LblMsg" runat="server"></asp:Label>

                <div class="form-group">
                    <asp:TextBox ID="TBUsername" CssClass="form-control" runat="server" placeholder="Username" AutoCompleteType="Disabled"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="TBFName" CssClass="form-control" runat="server" placeholder="First Name" AutoCompleteType="Disabled"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="TBLName" CssClass="form-control" runat="server" placeholder="Last Name" AutoCompleteType="Disabled"></asp:TextBox>
                </div>


                <div class="form-group">
                    <asp:TextBox ID="TBEmail" CssClass="form-control" runat="server" placeholder="Email" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="TBPass" CssClass="form-control" runat="server" placeholder="Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="TBCfmPass" CssClass="form-control" runat="server" placeholder="Confirm Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                </div>
            </div>

            <asp:Button CssClass="btn btn-light" ID="BtnAdmReg" runat="server" Text="Register" OnClick="BtnAdmReg_Click" Width="100%" />
            <br />
        </div>
    </form>


</asp:Content>
