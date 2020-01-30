<%@ Page Title="" Language="C#" MasterPageFile="~/Smile_Shop.Master" AutoEventWireup="true" CodeFile="Smile_Shop_Catalog.aspx.cs" Inherits="EADPProject.Smile_Shop_Catalog" %>
 <asp:Content ID="styling" ContentPlaceHolderID="head" runat="server">
            <title>SM;)E - Catalog</title>
         <script>
        var plist = [];
        function addtocart(product) {
            plist += product.id + "_";
        };

        function updateTransfer() {
            string = "window.open('Smile_Shop_Cart.aspx?list=" + plist + "')";  
            eval(string);
        };
    </script>
    </asp:Content>
     <asp:Content ID="header" ContentPlaceHolderID="header" 	runat="server">   

    <!--================ Banner =================-->
    <section class="banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-5 col-md-8">
                            <div class="banner-inner">
                                <h1>SM;)E's Catalog</h1>
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
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="text-center">
                        <h2>All Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">

                        <aside class="left_widgets">
                            <div class="l_w_title">
                                <h3>Browse Categories</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="#">Photoframes</a>
                                        <span>(25)</span>
                                    </li>
                                    <li>
                                        <a href="#">T-shirts</a>
                                        <span>(50)</span>
                                    </li>
                                    <li>
                                        <a href="#">Keychains</a>
                                        <span>(20)</span>
                                    </li>
                                </ul>
                            </div>
                        </aside>

                        <%--<aside class="left_widgets price_rangs_aside">
                        <div class="l_w_title">
                            <h3>Price Filter</h3>
                        </div>
                        <div class="widgets_inner">
                            <div class="range_item">
                                <input type="text" class="js-range-slider" value="" />
                                <div class="d-flex">
                                    <div class="price_text">
                                        <p>Price :</p>
                                    </div>
                                    <div class="price_value d-flex justify-content-center">
                                        <input type="text" class="js-input-from" id="amount" readonly />
                                        <span>to</span>
                                        <input type="text" class="js-input-to" id="amount" readonly />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>--%>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu">
                                    <p><span>95 </span>Product Found</p>
                                </div>
                                <div class="single_product_menu d-flex">
                                    <h5>Sort by : </h5>
                                    <select>
                                        <option data-display="Select">name</option>
                                        <option value="1">price</option>
                                        <option value="2">product</option>
                                    </select>
                                </div>
                                <div class="single_product_menu d-flex">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="search"
                                            aria-describedby="inputGroupPrepend">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroupPrepend"><i
                                                class="ti-search"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row align-items-center latest_product_inner">
                            <% foreach (var i in prodlist)
                                {%>
                                    <div class="col-lg-4 col-sm-6">
                                        <div class="single_product_item">
                                            <img src="img/product/product_1.png" alt=""/>
                                            <div class="single_product_text">
                                                <h3> <% = i.ProductName %></h3>
                                                <h3>$ <% = i.UnitPrice %></h3>
                                                <button type="button" id="button<%= i.CategoryName %>" class="btn btn-lg btn-block" onclick="addtocart(this)">+ add to cart </button>
                                            </div>
                                        </div>
                                    </div>
                                <%} %>
                        <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <i class="ti-angle-double-left"></i>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <i class="ti-angle-double-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--================ Footer =================-->
    <footer class="footer">
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-sm-6 col-lg-2">
                    <div class="single_footer_part">
                        <h4>Payment Methods</h4>
                        <ul class="list-unstyled">
                            <li><a href="">Paypal</a></li>
                            <li><a href="">Mastercard</a></li>
                            <li><a href="">Visa</a></li>
                            <li><a href="">Nets</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="single_footer_part">
                        <h4>Quick Links</h4>
                        <ul class="list-unstyled">
                            <li><a href="">Instagram</a></li>
                            <li><a href="">Facebook</a></li>
                            <li><a href="">Terms of Service</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="single_footer_part">
                        <h4>Newsletter</h4>
                        <p>
                            Heaven fruitful doesn't over lesser in days. Appear creeping
                        </p>
                        <div id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="subscribe_form relative mail_part">
                                <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                    class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = ' Email Address '">
                                <button type="submit" name="submit" id="newsletter-submit"
                                    class="email_icon newsletter-submit button-contactForm">
                                    subscribe</button>
                                <div class="mt-10 info"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</asp:Content>

