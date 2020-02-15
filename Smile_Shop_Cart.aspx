<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="Smile_Shop_Cart.aspx.cs" Inherits="EADPProject.Smile_Shop_Cart" %>

<asp:Content ID="styling" ContentPlaceHolderID="head" runat="server">
    <title>SM;)E - Cart</title>
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
                            <% foreach (var i in CartList)
                                {%>
                            <tr>

                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="<%=i.ImagePath%>" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p><%=i.ProductName%> </p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5><%=i.UnitPrice%></h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <span class="input-number-decrement"><i class="ti-angle-down"></i></span>
                                        <input class="input-number" type="text" value="<%=i.Quantity%>" min="0" max="10">
                                        <span class="input-number-increment"><i class="ti-angle-up"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <h5>$<%=i.Quantity * i.UnitPrice%></h5>
                                </td>
                            </tr>
                            <%} %>

                            <tr class="bottom_button">
                                <td>
                                    <asp:Button class="btn_1" ID="Button1" runat="server" Text="Delete" OnClick="Button1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>
                                        <asp:Label ID="LabelHoneyCakes" runat="server"></asp:Label>
                                    </h5>
                                </td>
                                <
                            </tr>



                        </tbody>
                    </table>
                    <div class="checkout_btn_inner float-right">
                       
                                                    <asp:Label runat="server" class="btn_1" ID="LabelTotal"></asp:Label>

                        <a class="btn_1" href="#">Continue Shopping</a>
                        <a class="btn_1 checkout_btn_1" href="Smile_Shop_Checkout.aspx">Proceed to checkout</a>
                    </div>
                </div>
        </div>
        </div>

    </form>
</asp:Content>
