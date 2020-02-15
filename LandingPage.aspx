<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="EADPProject.LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Login_css/jquery.fancybox.css">
    <link href="Login_css/bootstrap.css" rel="stylesheet" />
    <link href="Login_css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="Login_css/slippry.css">
    <link href="Login_css/landing_style.css" rel="stylesheet" />
    <link rel="stylesheet" href="Login_css/default.css">
    <script src="Login_css/modernizr.custom.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="intro">
        <ul id="slippry-slider">
            <li>
                <a href="#slide1">
                    <img src="Images/1.jpg" alt="Welcome to SMILE!"></a>
            </li>
            <li>
                <a href="#slide2">
                    <img src="Images/2.jpg" alt="Connect with people through photography ♥"></a>
            </li>
            <li>
                <a href="#slide3">
                    <img src="Images/3.jpg" alt="Explore our website now :)">
                </a>
            </li>
        </ul>
    </section>
    <!-- end intro -->
    <!-- Section about -->
    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="heading">
                        <h3><span>About us</span></h3>
                    </div>
                    <div class="sub-heading">
                        <p>
                            Creating a visual language around the beliefs of the people we work with.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="team-box">
                        <img src="assets/img/dummies/team1.jpg" alt="" class="img-responsive" />
                        <div class="roles">
                            <h5><strong>Zyon Wee</strong></h5>
                            <p>
                                CEO - Founder
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-box">
                        <img src="assets/img/dummies/team2.jpg" alt="" class="img-responsive" />
                        <div class="roles">
                            <h5><strong>Tan Zi En</strong></h5>
                            <p>
                                Lead designer
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-box">
                        <img src="assets/img/dummies/team3.jpg" alt="" class="img-responsive" />
                        <div class="roles">
                            <h5><strong>Arman Khan</strong></h5>
                            <p>
                                Customer support
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-box">
                        <img src="assets/img/dummies/team4.jpg" alt="" class="img-responsive" />
                        <div class="roles">
                            <h5><strong>Aadira Nair</strong></h5>
                            <p>
                                Coffee maker
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end section about -->
    <!-- section works -->

    <!-- section works -->
    <!-- section contact -->
    <section id="contact" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="heading">
                        <h3><span>Get in touch</span></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4><i class="icon-envelope"></i><strong>Contact form</strong></h4>
                    <p>
                        Want to work with us or just want to say hello? Don't hesitate to get in touch!
                    </p>
                    <!-- start contact form -->
                    <div class="cform" id="contact-form">


                        <div id="sendmessage">Your message has been sent. Thank you!</div>
                        <div id="errormessage"></div>
                        <form action="" method="post" role="form" class="contactForm">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4"
                                    data-msg="Please enter at least 4 chars" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email"
                                    data-msg="Please enter a valid email" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4"
                                    data-msg="Please enter at least 8 chars of subject" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us"
                                    placeholder="Message"></textarea>
                                <div class="validation"></div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-lg btn-theme">Send Message</button>
                            </div>
                        </form>
                    </div>
                    <!-- END contact form -->
                </div>
                <div class="col-md-6">
                    <h4>Find our location</h4>
                    <p>View from google map</p>
                    <!-- map -->
                    <div id="section-map" class="clearfix">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22864.11283411948!2d-73.96468908098944!3d40.630720240038435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbg!4v1540447494452" width="100%" height="400" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end section contact -->
    <footer>
        <div class="verybottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aligncenter">
                            <p>
                                &copy; Groovin Theme - All right reserved
                            </p>
                            <div class="credits">
                                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <a href="#" class="scrollup"><i class="fa fa-angle-up fa-2x"></i></a>
    <!-- javascript -->
    <script src="Login_css/jquery-1.9.1.min.js"></script>
    <script src="Login_css/jquery.easing.js"></script>
    <script src="Login_css/classie.js"></script>
    <script src="Login_css/bootstrap.js"></script>
    <script src="Login_css/slippry.min.js"></script>
    <script src="Login_css/nagging-menu.js"></script>
    <script src="Login_css/jquery.nav.js"></script>
    <script src="Login_css/jquery.scrollTo.js"></script>
    <script src="Login_css/jquery.fancybox.pack.js"></script>
    <script src="Login_css/jquery.fancybox-media.js"></script>
    <script src="Login_css/masonry.pkgd.min.js"></script>
    <script src="Login_css/imagesloaded.js"></script>
    <script src="Login_css/jquery.nicescroll.min.js"></script>
    <script src="Login_css/AnimOnScroll.js"></script>
    <script>
        new AnimOnScroll(document.getElementById('grid'), {
            minDuration: 0.4,
            maxDuration: 0.7,
            viewportFactor: 0.2
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#slippry-slider').slippry(
                defaults = {
                    transition: 'vertical',
                    useCSS: true,
                    speed: 3000,
                    pause: 3000,
                    initSingle: false,
                    auto: true,
                    preload: 'visible',
                    pager: false,
                }
            )
        });
    </script>

    <script src="assets/js/custom.js"></script>
    <script src="contactform/contactform.js"></script>

</asp:Content>
