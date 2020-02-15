<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeFile="Smile_Shop_Catalog.aspx.cs" Inherits="EADPProject.Smile_Shop_Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="header" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--================ Banner =================-->
    <section class="banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-5 col-md-8">
                            <div class="banner-inner">
                                <h1>SMILE's Catalog</h1>
                                <p>
                                    Our Specialties
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

            <div class="row align-items-center latest_product_inner">
                <% foreach (var i in prodlist)
                    {%>
                <%if (i.DeleteStatus == 0)
                    {%>
                <div class="mt-2 single_product_itemU col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="<%=i.ImagePath %>" alt="" />
                        <div class="single_product_text">
                            <h3 class="userShopName" data-shopnamesu="<% = i.ProductName %>"><% = i.ProductName %></h3>
                            <h3 class="userShopPrice" data-shopnamesu="<% = i.UnitPrice.ToString() %>">$ <% = i.UnitPrice %></h3>
                            <button type="button" id="<%= i.ProductID%>" class="btn btn_2" onclick="addtocart(this)">+ add to cart </button>
                            <asp:Label runat="server" Visible="false" ID="Lbl_added">product added</asp:Label>
                        </div>
                    </div>
                </div>
                <%}
                    }%>
            </div>
        </div>
    </section>
    <script src="Scripts/ShopSearch.js" type="text/javascript"></script>
</asp:Content>

