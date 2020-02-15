<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Smile_Shop.aspx.cs" Inherits="EADPProject.Smile_Shop1" %>

<asp:Content ID="styling" ContentPlaceHolderID="head" runat="server">
    <title>SM;)E - Online Shop</title>
</asp:Content>
<asp:Content ID="header" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--================ Banner =================-->
    <section class="banner">

        <div id="banner" class="carousel slide container" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#banner" data-slide-to="0" class="active"></li>
                <li data-target="#banner" data-slide-to="1"></li>
                <li data-target="#banner" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row">
                        <div class="col-lg-8">
                            <h1>National Day Collection</h1>
                            <p>
                                Celebrate Singapore's birthday with our goodies!
                            </p>
                            <a href="#" class="btn_2">See More</a>
                        </div>
                        <div class="col-lg-4">
                            <img src="ShopImages/flag.png" style="height: 250px;" />
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row">
                        <div class="col-lg-6">
                            <h1>Racial Harmony Day Collection</h1>
                            <p>
                                Check out our collection for Racial Harmony Day!
                            </p>
                            <a href="#" class="btn_2">See More</a>
                        </div>
                        <div class="col-lg-6">
                            <img src="ShopImages/RHD.png" style="height: 250px;" />
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row">
                        <div class="col-lg-6">
                            <h1>Food Collection</h1>
                            <p>
                                Nothing speaks about Singapore like food.
                            </p>
                            <a href="#" class="btn_2">See More</a>
                        </div>
                        <div class="col-lg-6">
                            <img src="ShopImages/food.png" style="height: 250px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--================ Popular Buys =================-->
    <section class="popular-buys">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="text-center mt-3">
                        <h2>Popular Buys</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">

                <div class="single_product_itemU col-lg-7 col-sm-6">
                    <div class="single_product_item" >
                        <img src="ShopImages/prata.png" alt=""/>
                        <div class="single_product_text">
                            <h3 class="text-center">Prata T-shirt</h3>
                            <a class=" text-center" href="Smile_Shop_Catalog.aspx">See more</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-sm-6">
                    <div class="single_product_item" >
                        <img src="ShopImages/banmian.png" alt=""/>
                        <div class="single_product_text">
                            <h3 class="text-center">Banmian T-shirt</h3>
                            <a class=" text-center" href="Smile_Shop_Catalog.aspx">See more</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-sm-6">
                    <div class="single_product_item" >
                        <img src="ShopImages/bag.png" alt=""/>
                        <div class="single_product_text">
                            <h3 class="text-center">+65 Farm Bag</h3>
                            <a class=" text-center" href="Smile_Shop_Catalog.aspx">See more</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7 col-sm-6">
                    <div class="single_product_item" >
                        <img src="ShopImages/mug.png" alt=""/>
                        <div class="single_product_text">
                            <h3 class="text-center">SQ Enamel Mug</h3>
                            <a class=" text-center" href="Smile_Shop_Catalog.aspx">See more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>



