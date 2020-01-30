<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="UserViewEvent.aspx.cs" Inherits="EADPProject.UserViewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form3" runat="server">
        <div style="padding: 10px;">
            <asp:Panel ID="PanelSuccessResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_msg" runat="server"></asp:Label>
            </asp:Panel>
            <div class="container card shadow-lg bg-white">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="mx-auto my-3">
                            <div class="row">
                                <div class="col-lg-3" style="padding-left: 20px; color: #df744a">
                                    <h3>Current Events</h3>
                                </div>
                                <div class="col-lg-9" style="float:right;">
                                    <asp:Button runat="server" class="btn btn-info text-white" Style="float: right;" data-toggle="modal"
                                        data-target="#basicExampleModal" Text="View Joined Events" />
                                </div>
                            </div>
                            <br>
                            <div class="input-group">
                                <input type="text" id="UevtbSearch" class="form-control" placeholder="Search...">
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-info" id="Usearchbut"><i class="fas fa-search mr-1"></i>Search</button>
                                </div>
                            </div>
                        </div>
                        <br>
                        <hr>

                        <div class="card-deck">
                            <% if (getEvents().Count > 0)
                                { %>
                            <% foreach (var evs in getEvents())
                                { %>
                            <% if (evs.ActiveStatus == 1)
                                { %>
                            <div class="card-body col-sm-12 col-md-12 col-lg-4 align-items-stretch UevmainDiv">
                                <div class="card card-cascade">
                                    <div class="view view-cascade overlay">
                                        <img id="poster" src="<%=evs.PictureURL%>"
                                            alt="No image available" class="card-img-top" height="250px" width="200px">
                                    </div>
                                    <div class="card-body card-body-cascade">
                                        <h4 class="font-weight-bold card-title Uevname" data-namers="<%=evs.EventName %>"><% =evs.EventName %></h4>
                                        <h5 class="card-text Uevcost" style="color: #df744a" data-namers="<%=evs.EventCost %>"><% =evs.EventCost %></h5>
                                        <p class="Uevlocation" data-namers="<% =evs.EventLocation %>"><% =evs.EventLocation %></p>
                                        <p class="Uevdate" style="color: #df744a" data-namers="<% =evs.EventDate %>"><i class="fas fa-calendar mr-1"></i><% =evs.EventDate %></p>
                                        <h6 class="text-info Uevjoin" data-namers="<% =evs.NumberOfJoins.ToString() %>">Going: <% =evs.NumberOfJoins %></h6>
                                    </div>
                                    <div class="card-footer text-muted text-center">
                                        <button id="viewEventButton" name="<%= evs.EventId %>" type="button" class="btn btn-info" onclick="ViewEvent(this)">View Event</button>
                                    </div>
                                </div>
                            </div>
                            <%}
                                    }
                                }%>
                        </div>
                        <br>
                        <hr>
                        <br>
                        <div>
                            <h4 class="text-center" style="color: #df744a;">Event Locations</h4>
                            <br>
                            <div id="map" style="height: 400px; width: 100%;"></div>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <br>
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
       <% if (getEvents().Count > 0)
            { %>
        <% foreach (var evs in getEvents())
            { %>
                var marker = new google.maps.Marker({
                    position: { lat: <% =evs.Latitude %>, lng: <%=evs.Longitude%>},
                    map: map,
                });

                var infoWindow = new google.maps.InfoWindow({
                    content: '<img id="poster" src="<%=evs.PictureURL%>" alt="No image available" class="border img-thumbnail img-fluid" style="height:100%;width:50%"> <br><br> <h5> <% =evs.EventName %> </h5> <p> <% =evs.EventDate %> ,  <% =evs.EventStartTime %> - <% =evs.EventEndTime %> </p>'
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
        <% }
            } %> 
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA&callback=initMap">
        </script>
    </form>
    <script src="Scripts/Search.js" type="text/javascript"></script>
    <script src="Scripts/Eventlocationhref.js" type="text/javascript"></script>
</asp:Content>
