<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Smile_Shop_AdminAdd.aspx.cs" Inherits="EADPProject.Smile_Shop_AdminAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="header" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <!--================ Banner =================-->
        <section class="banner">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-5 col-md-8">
                                <div class="banner-inner">
                                    <h1>Add Product</h1>
                                    <p>
                                        Admin
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--================ Add Product =================-->
        <section class="addProduct">
            <div class="container">
                <asp:Label ID="LblMsg" runat="server" ForeColor="Red"></asp:Label>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Product Name</span>
                    </div>
                    <asp:TextBox ID="TbName" runat="server" Width="211px"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">Description</span>
                    </div>
                    <asp:TextBox ID="TbDesc" runat="server" Width="211px"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon3">Unit Price ($)</span>
                    </div>
                    <asp:TextBox ID="TbPrice" runat="server" Width="211px"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon4">Category</span>
                    </div>
                    <div class="input-group-append">
                        <asp:DropDownList ID="DdlCat" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">
                            <asp:ListItem Value="- Select -">- Select -</asp:ListItem>
                            <asp:ListItem>T-shirt (101)</asp:ListItem>
                            <asp:ListItem>Keychain (102)</asp:ListItem>
                            <asp:ListItem>Photoframe (103)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon5">Image</span>
                    </div>
                    <asp:FileUpload ID="ImageUpload" onchange="PreviewImage(this)" runat="server" Style="color: transparent;" AllowMultiple="false" />
                </div>
                <asp:Image runat="server" ID="posterImage" alt="No image available"
                    class="border img-thumbnail img-fluid" />


                <asp:Button ID="BtnSubmit" class="btn btn_3" runat="server" OnClick="BtnSubmit_Click" Text="Submit" Width="86px" />
                <asp:Button ID="BtnBack" class="btn btn_3" runat="server" OnClick="BtnBack_Click" Text="Back" />

            </div>
        </section>
    </form>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function PreviewImage(item) {
            if (item.files && item.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=posterImage.ClientID%>').prop('src', e.target.result)
                        .width(250)
                        .height(250);
                };
                reader.readAsDataURL(item.files[0]);
            }
            var upload = document.getElementById("<% =ImageUpload.ClientID%>");
            var str = upload.value
            var strCut = str.slice(str.lastIndexOf('\\') + 1)
            label.innerText = strCut
            console.log(strCut)
        }
    </script>
</asp:Content>

