<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EADPProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="StyleSheets/navbar.css" rel="stylesheet" />
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous" />
    <link href="StyleSheets/register.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .auto-style1 {
            width: 118px;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 49%;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 437px;
        }
    </style>
--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <form id="form1" runat="server">

    <div class="form-control col-6" style="margin-left: 25%; margin-top: 5%; opacity: 0.8; text-align: left;">
        <h1 class="auto-style4">R E G I S T E R</h1>
        <br />

        <div class="form-group">
            <h3>Signup As</h3>
            <table class="auto-style3">
                <tr>
                    <td class="auto-style1">
                        <asp:CheckBox ID="CBUser" runat="server" Text=" User" />
                    </td>
                    <td class="auto-style2">
                        <asp:CheckBox ID="CBPhotographer" runat="server" Text=" Photographer" />
                    </td>
                    <td class="auto-style5">
                        <asp:CheckBox ID="TBOrganisation" runat="server" Text=" Organisation" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
            <br />

        </div>


        <div class="form-group">
            <label for="email">Username</label>
            <asp:TextBox ID="TBUsername" CssClass="form-control" runat="server" placeholder="Username" AutoCompleteType="Disabled"></asp:TextBox>
        </div>

        <div class="form-group row">
            <div class="col">
                <label for="fname">First Name</label>
                <asp:TextBox ID="TBFName" CssClass="form-control" runat="server" placeholder="First Name" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
            <div class="col">
                <label for="lname">Last Name</label>
                <asp:TextBox ID="TBLName" CssClass="form-control" runat="server" placeholder="Last Name" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <asp:TextBox ID="TBEmail" CssClass="form-control" runat="server" placeholder="Email" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group row">
            <div class="col">
                <label for="password">Password</label>
                <asp:TextBox ID="TBPass" CssClass="form-control" runat="server" placeholder="Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col">
                <label for="cfmpassword">Confirm Password</label>
                <asp:TextBox ID="TBCfmPass" CssClass="form-control" runat="server" placeholder="Confirm Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            </div>
        </div>

        <asp:Button CssClass="btn btn-light" ID = "BtnReg" runat="server" Text="Register" OnClick="BtnReg_Click1" />


    </div>
                </form>
</asp:Content>
