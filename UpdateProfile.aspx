<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="EADPProject.UpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <form runat="server">

        <div class="container bootstrap snippet">
            <div class="row">
                <div class="col-sm-10">
                    <h1>Update Profile</h1>
                    <br />
                    <asp:Label ID="LblMsg" runat="server"></asp:Label>
                    <br />
                    <br />
                </div>

                <div class="row">
                    <div class="col-sm-4">



                        <div class="text-center">
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                            <br />
                            <h6>Upload a different photo...</h6>
                            <input type="file" class="text-center center-block file-upload">
                        </div>
                        <br>
                    </div>
                    <!--/col-3-->
                    <div class="col-sm-8">
                        <div>
                            <hr>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="username">
                                        <h4>Username</h4>
                                    </label>
                                    <asp:TextBox ID="TBUsername" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="first_name">
                                        <h4>First Name</h4>
                                    </label>
                                    <asp:TextBox ID="TBFName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="last_name">
                                        <h4>Last Name</h4>
                                    </label>
                                    <asp:TextBox ID="TBLName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="email">
                                        <h4>Email</h4>
                                    </label>
                                    <asp:TextBox ID="TBEmail" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>


                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <asp:Button CssClass="btn btn-light" ID="BtnUpdate" runat="server" Text="Update Profile" OnClick="BtnUpdateProf_Click" />
                                <asp:Button CssClass="btn btn-danger" ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>
