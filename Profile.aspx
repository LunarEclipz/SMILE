<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EADPProject.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container bootstrap snippet">
            <div class="row">
                <div class="col-sm-10">
                    <h1>Your Profile</h1>
                    <asp:Label ID="LblMsg" runat="server"></asp:Label>
                    <br />
                </div>

                <div class="row">
                    <div class="col-sm-4">



                        <div class="text-center">
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                            <br />
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
                                        <h4>Username: </h4>
                                    </label>
                                    <asp:Label ID="LblUsername" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="first_name">
                                        <h4>First Name: </h4>
                                    </label>
                                    <asp:Label ID="LblFName" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="last_name">
                                        <h4>Last Name: </h4>
                                    </label>
                                    <asp:Label ID="LblLName" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="email">
                                        <h4>Email: </h4>
                                    </label>
                                    <asp:Label ID="LblEmail" runat="server"></asp:Label>
                                </div>
                            </div>


                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>

                                <asp:Button CssClass="btn btn-light" ID="BtnUpdate" runat="server" Text="Update Profile" OnClick="BtnUpdate_Click" />
                                <asp:Button CssClass="btn btn-light" ID="BtnChangePass" runat="server" Text="Change Password" OnClick="BtnChangePass_Click" />
                                <asp:Button CssClass="btn btn-danger" ID="BtnDeleteAcc" runat="server" Text="Delete Account" OnClick="BtnDelete_Click" />
 
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        $(document).ready(function () {


            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.avatar').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }


            $(".file-upload").on('change', function () {
                readURL(this);
            });
        });
    </script>


</asp:Content>
