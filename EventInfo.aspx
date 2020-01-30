<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="EventInfo.aspx.cs" Inherits="EADPProject.EventInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form4" runat="server">
        <div style="padding: 10px;">
            <asp:Panel ID="PanelSuccessResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_msg" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PanelErrorResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-danger">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_err" runat="server"></asp:Label>
            </asp:Panel>
            <div class="container card shadow-lg bg-white">
                <% var evs = getSingleEvent();
                    { %>
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-md-12 mx-auto">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6 align-items-stretch">
                                    <img id="poster" src="<%=evs.PictureURL %>"
                                        alt="No image available" class="img-fluid"
                                        style="height: 300px; width: 100%" />
                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-6">
                                    <asp:Button ID="backEvent" runat="server" Text="Back" class="btn btn-danger col-lg-2" Style="float: right;" OnClick="backEvent_Click" />
                                    <br>
                                    <div class="col-sm-12 col-md-12 col-lg-3">
                                        <h4 class=""></h4>
                                    </div>
                                    <br>
                                    <br>
                                    <div class="col-sm-12 col-md-12 col-lg-9">
                                        <h5 style="color: #df744a"><% =evs.EventName %></h5>
                                        <input hidden="hidden" name="eventName" value="<% =evs.EventName %>">
                                    </div>
                                    <br>
                                    <br>
                                    <div class="col-sm-12 col-md-12 col-lg-8">
                                        <h5 class=""><% =evs.EventCost %></h5>
                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <div class="col-sm-12 col-md-12 col-lg-12">
                                        <h6 class="" style="float:right; color:#df744a;">Joined: <% =evs.NumberOfJoins %></h6>
                                        <input hidden="hidden" type="text" id="joinVal" name="joinVal" value="<%=evs.NumberOfJoins %>""/>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <% string name = Session["StudNo"].ToString(); %>
                                <% string userInt = name;%>
                                <% int eventId = int.Parse(Request.QueryString["id"]); %>
                                <% if (getRegisterSpecific(eventId, userInt) == null)
                                    { %>
                                <asp:Button runat="server" class="btn btn-info col-lg-5" Text="Register for Event" ID="btnJoinEvent" OnClick="btnJoinEvent_Click" />
                                <% }
                                    else
                                    { %>
                                <asp:Button runat="server" class="btn btn-danger col-lg-5" Text="Unregister from Event" ID="ButtonUnregister" OnClick="ButtonUnregister_Click" />
                                <% } %>

                                <asp:Button runat="server" class="btn btn-info col-lg-5" UseSubmitBehavior="false" Text="Hire Photographer for Event" Style="float: right;" ID="ButtonHirePhoto" OnClick="ButtonHirePhoto_Click" />
                            </div>
                            <hr>
                            <br>
                            <div class="mb-2 w-100">
                                <div class="col-sm-12 col-md-12">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-lg-1">
                                        </div>
                                        <div class="col-sm-12 col-md-12 col-lg-6">
                                            <h5 class="" style="color: #df744a">Description</h5>
                                            <p class=""><% =evs.EventDescription %></p>
                                        </div>
                                        <div class="col-sm-12 col-md-12 col-lg-1">
                                        </div>
                                        <div class="col-sm-12 col-md-12 col-lg-3">
                                            <h5 class="" style="color: #df744a">Date and Time</h5>
                                            <p class="">
                                                <% =evs.EventDate %>
                                                <br>
                                                <% =evs.EventStartTime %> - <% =evs.EventEndTime %>
                                                <br>
                                                Singapore Standard Time
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <br>
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 col-lg-1">
                                    </div>
                                    <div class="col-sm-12 col-md-12 col-lg-6">
                                        <h5 class="" style="color: #df744a;">Event Host</h5>
                                        <p class=""><% =evs.CreatorID.ToString() %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 col-lg-1">
                                    </div>
                                    <div class="col-sm-12 col-md-12 col-lg-3">
                                        <h5 style="color: #df744a;">Location</h5>
                                        <p class=""><% =evs.EventLocation %></p>
                                        <input id="locationInput" hidden="hidden" name="locationInput" value="<% =evs.EventLocation %>">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <hr>
                            <br>
                            <div>
                                <h4 class="text-center" style="color: #df744a;">Event Location</h4>
                                <br>
                                <div id="map" style="height: 400px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function initMap() {
                // Map options
                var options = {
                    zoom: 11,
                    center: { lat: 1.3521, lng: 103.8198 }
                }
                // New map
                var map = new google.maps.Map(document.getElementById('map'), options);
                // Add marker
                var marker = new google.maps.Marker({
                    position: { lat: <% =evs.Latitude %>, lng: <%=evs.Longitude%>},
                    map: map,
                });

                var infoWindow = new google.maps.InfoWindow({
                    content: '<img id="poster" src="/Images/default.jpeg" alt="No image available" class="border img-thumbnail img-fluid" style="height:100%;width:50%"> <br><br> <h5> <% =evs.EventName %> </h5> <p> <% =evs.EventDate %> ,  <% =evs.EventStartTime %> - <% =evs.EventEndTime %> </p>'
                });
                marker.addListener('click', function () {
                    window.location.href = '';
                });
                marker.addListener('mouseover', function () {
                    infoWindow.open(map, marker);
                });
                marker.addListener('mouseout', function () {
                    infoWindow.close(map, marker);
                });
        <% } %> 
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA&callback=initMap">
        </script>
    </form>
</asp:Content>
