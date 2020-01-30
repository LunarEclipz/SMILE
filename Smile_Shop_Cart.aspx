<%@ Page Title="" Language="C#" MasterPageFile="~/Smile_Shop.Master" AutoEventWireup="true" CodeBehind="Smile_Shop_Cart.aspx.cs" Inherits="EADPProject.Smile_Shop_Cart" %>
<asp:Content ID="styling" ContentPlaceHolderID="head" runat="server">
            <title>SM;)E - Cart</title>
    </asp:Content>
     <asp:Content ID="header" ContentPlaceHolderID="header" runat="server">
    <!--================ Banner =================-->
    <section class="banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-5 col-md-8">
                            <div class="banner-inner">
                                <h1>Cart Products</h1>
                                <p>
                                    Your selections
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--================Cart Area =================-->
         <asp:Label ID="LabelPlist" runat="server"></asp:Label>
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/product/single-product/cart-1.jpg" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <span class="input-number-decrement"><i class="ti-angle-down"></i></span>
                                        <input class="input-number" type="text" value="1" min="0" max="10">
                                        <span class="input-number-increment"><i class="ti-angle-up"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/product/single-product/cart-1.jpg" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <span class="input-number-decrement"><i class="ti-angle-down"></i></span>
                                        <input class="input-number" type="text" value="1" min="0" max="10">
                                        <span class="input-number-increment"><i class="ti-angle-up"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/product/single-product/cart-1.jpg" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <span class="input-number-decrement"><i class="ti-angle-down"></i></span>
                                        <input class="input-number" type="text" value="1" min="0" max="10">
                                        <span class="input-number-increment"><i class="ti-angle-up"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr class="bottom_button">
                                <td>
                                    <a class="btn_1" href="#">Update Cart</a>
                                </td>
                                <td></td>
                                <td></td>
                                <td>
                                    <div class="cupon_text float-right">
                                        <a class="btn_1" href="#">Close Coupon</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>$2160.00</h5>
                                </td>
                            </tr>
                            <tr class="shipping_area">
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Shipping</h5>
                                </td>
                                <td>
                                    <div class="shipping_box">
                                        <ul class="list">
                                            <li>
                                                <a href="#">Flat Rate: $5.00</a>
                                            </li>
                                            <li>
                                                <a href="#">Free Shipping</a>
                                            </li>
                                            <li>
                                                <a href="#">Flat Rate: $10.00</a>
                                            </li>
                                            <li class="active">
                                                <a href="#">Local Delivery: $2.00</a>
                                            </li>
                                        </ul>
                                        <h6>Calculate Shipping
                     
                                            <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        </h6>
                                        <select class="shipping_select">
                                            <option value="1">Bangladesh</option>
                                            <option value="2">India</option>
                                            <option value="4">Pakistan</option>
                                        </select>
                                        <select class="shipping_select section_bg">
                                            <option value="1">Select a State</option>
                                            <option value="2">Select a State</option>
                                            <option value="4">Select a State</option>
                                        </select>
                                        <input type="text" placeholder="Postcode/Zipcode" />
                                        <a class="btn_1" href="#">Update Details</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="checkout_btn_inner float-right">
                        <a class="btn_1" href="#">Continue Shopping</a>
                        <a class="btn_1 checkout_btn_1" href="Smile_Shop_Checkout.aspx">Proceed to checkout</a>
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
                                <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                    class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = ' Email Address '">
                                <button type="submit" name="submit" id="newsletter-submit"
                                    class="email_icon newsletter-submit button-contactForm">
                                    subscribe</button>
                                <div class="mt-10 info"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</asp:Content>
