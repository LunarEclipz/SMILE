<%@ Page Title="" Language="C#" MasterPageFile="~/Smile_Shop.Master" AutoEventWireup="true" CodeBehind="Smile_Shop.aspx.cs" Inherits="EADPProject.Smile_Shop1" %>

    <asp:Content ID="styling" ContentPlaceHolderID="head" runat="server">
            <title>SM;)E - Online Shop</title>
    </asp:Content>
     <asp:Content ID="header" ContentPlaceHolderID="header" 	runat="server">
          <!--================ Banner =================-->
    <section class="banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div id="carousel-banner" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-banner" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-banner" data-slide-to="1"></li>
                            <li data-target="#carousel-banner" data-slide-to="2"></li>
                        </ol>
                        <div class="row">
                            <div class="col-lg-5 col-md-8">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <h1>National Day 2019</h1>
                                        <p>
                                            Incididunt ut labore et dolore magna aliqua quis ipsum
                                        suspendisse ultrices gravida. Risus commodo viverra
                                        </p>
                                        <a href="#" class="btn_2">See More</a>
                                    </div>
                                    <div class="carousel-item">
                                        <h1>Racial Harmony Day 2019</h1>
                                        <p>
                                            Incididunt ut labore et dolore magna aliqua quis ipsum
                                        suspendisse ultrices gravida. Risus commodo viverra
                                        </p>
                                        <a href="#" class="btn_2">See More</a>
                                    </div>
                                    <div class="carousel-item">
                                        <h1>Deepavali 2019</h1>
                                        <p>
                                            Incididunt ut labore et dolore magna aliqua quis ipsum
                                        suspendisse ultrices gravida. Risus commodo viverra
                                        </p>
                                        <a href="#" class="btn_2">See More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carousel-banner" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-banner" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
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
                    <div class="text-center">
                        <h2>Popular Buys</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-7 col-sm-6">
                    <div class="single-post">
                        <p>T-shirt</p>
                        <h3>"Back to skool" Tee</h3>
                        <a href="#" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="" alt="">
                    </div>
                </div>
                <div class="col-lg-5 col-sm-6">
                    <div class="single-post">
                        <p>Photoframe</p>
                        <h3>Back to the future</h3>
                        <a href="#" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="" alt="">
                    </div>
                </div>
                <div class="col-lg-5 col-sm-6">
                    <div class="single-post">
                        <p>Keychain</p>
                        <h3>Mini Merlion</h3>
                        <a href="#" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="" alt="">
                    </div>
                </div>
                <div class="col-lg-7 col-sm-6">
                    <div class="single-post">
                        <p>Keychain</p>
                        <h3>Durians</h3>
                        <a href="#" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="" alt="">
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

   

