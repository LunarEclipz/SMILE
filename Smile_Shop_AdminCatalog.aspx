<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeFile="Smile_Shop_AdminCatalog.aspx.cs" Inherits="EADPProject.Smile_Shop_AdminCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="header" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        var prodItem = [];
        function addtolist(product) {
            prodItem += product.id + "_";
            updateAdmin();
        };

        function updateAdmin() {
            string = "window.open('Smile_Shop_AdminUpdate.aspx?prod=" + prodItem + "')";
            eval(string);
        };
    </script>
    <form id="form1" runat="server">
        <!--================ Banner =================-->
        <section class="banner">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-5 col-md-8">
                                <div class="banner-inner">
                                    <h1>Product Catalog</h1>
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

        <!--================ Catalog =================-->
        <section class="catalog">
            <div class="container">
                <div class="row m-4">
                    <div class="col-lg-12">
                        <div class="input-group">
                            <input type="text" id="adminSearch" class="form-control" placeholder="Search Here">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default" id="adminSearchBtn">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            

            <asp:Label ID="Lbl_Msg" runat="server"></asp:Label>
            <input type="text" id="Lbl_ID" name="Lbl_ID" hidden="hidden" value="textId" />
            <div class="row align-items-center latest_product_inner">
                <!-- List of Products -->
                <% if (prodlist.Count > 0)
                    { %>
                <% foreach (var i in prodlist)
                    {%>
                <%if (i.DeleteStatus == 0)
                    {%>
                <div class="col-lg-4 col-sm-6 single_product_itemA">
                    <div class="single_product_item">
                        <img src="<%=i.ImagePath%>" />
                        <div class="single_product_text">
                            <h3 class="adminName" data-shopnames="<% = i.ProductName %>"><% = i.ProductName %></h3>
                            <h3 class="adminPrice" data-shopnames="<% = i.UnitPrice.ToString() %>">$ <% = i.UnitPrice %></h3>
                            <button type="button" id="<%= i.ProductID%>" class="btn btn_3" onclick="addtolist(this)">Edit Product</button>
                            <button id="deleteBtn<%=i.ProductID %>" type="button" name="<%=i.ProductID %>" class="btn btn_3" data-toggle="modal" data-target="#deleteModal<%=i.ProductID %>">Delete Product</button>
                        </div>
                    </div>
                </div>

                <div class="modal" id="deleteModal<%=i.ProductID %>" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Delete Product</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to delete <%=i.ProductName %>?
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="deleteButton" runat="server" Text="Yes" class="btn btn-danger" OnClick="deleteButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    var Lbl_ID = document.getElementById("Lbl_ID")
                    var deleteBtn = document.getElementById("deleteBtn")
                    $("#deleteModal" + <%=i.ProductID%>).on('show.bs.modal', function () {
                        Lbl_ID.value = deleteBtn<%=i.ProductID%>.name
                    });
                </script>

                <%}
                        }
                    }%>
                <%else
                    {%>
                <h2>Add products! </h2>

                <% } %>
            </div>
                </div>
        </section>
    </form>

    <script src="Scripts/ShopSearch.js" type="text/javascript"></script>


</asp:Content>
