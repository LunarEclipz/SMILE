<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="UserViewEvent.aspx.cs" Inherits="EADPProject.UserViewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <form id="form3" runat="server">
        <div style="padding: 10px;">
            <asp:Panel ID="PanelErrorResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-danger">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_err" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PanelSuccessResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_Msg" runat="server"></asp:Label>
            </asp:Panel>
            <div class="card card-body shadow-lg bg-white">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="mx-auto my-3">
                            <div class="row">
                                <div class="col-lg-3" style="padding-left: 20px; color: #df744a">
                                    <h3>Current Events</h3>
                                </div>
                                <div class="col-lg-9" style="float: right;">
                                    <button class="btn" type="button" style="background-color: #df744a; color: white; float: right;" data-toggle="modal"
                                        data-target="#joinedModal">
                                        View Joined Events</button>
                                </div>
                            </div>
                            <br>
                            <div class="input-group">
                                <input type="text" id="UevtbSearch" class="form-control" placeholder="Search...">
                                <div class="input-group-append">
                                    <button type="button" class="btn" style="background-color: #df744a; color: white;" id="Usearchbut"><i class="fas fa-search mr-1"></i>Search</button>
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
                            <% if (evs.HiddenStatus == 0)
                                { %>
                            <div class="card-body col-sm-12 col-md-12 col-lg-4 align-items-stretch UevmainDiv">
                                <div class="card card-cascade" style="height: 625px">
                                    <div class="view view-cascade overlay">
                                        <img id="poster" src="<%=evs.PictureURL%>"
                                            alt="No image available" class="card-img-top" height="250px" width="200px">
                                    </div>
                                    <div class="card-body card-body-cascade">
                                        <h4 class="font-weight-bold card-title Uevname" data-namers="<%=evs.EventName %>"><% =evs.EventName %></h4>
                                        <h5 class="card-text Uevcost" style="color: #df744a" data-namers="<%=evs.EventCost %>"><% =evs.EventCost %></h5>
                                        <p class="Uevlocation" style="font-weight:bold;" data-namers="<% =evs.EventLocation %>"><% =evs.EventLocation %></p>
                                        <p class="Uevdate" style="color: #df744a" data-namers="<% =evs.EventDate %>"><i class="fas fa-calendar mr-1"></i><% =evs.EventDate %></p>
                                        <p class="Uevcategory" style="font-weight:bold;" data-namers="<% =evs.EventCategory %>"><% =evs.EventCategory %></p>
                                        <h6 class="text-info Uevjoin" data-namers="<% =evs.NumberOfJoins.ToString() %>">Going: <% =evs.NumberOfJoins %></h6>
                                    </div>
                                    <div class="card-footer text-muted text-center">
                                        <button id="viewEventButton" name="<%= evs.EventId %>" type="button" class="btn" style="background-color: #df744a; color: white; width: 100%;" onclick="ViewEvent(this)">View Event</button>
                                    </div>
                                </div>
                            </div>
                            <%}
                                        }
                                    }
                                }%> <%else
                                        { %>
                            <h2 style="color: #df744a;">No Events </h2>
                            <%} %>
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

        <div class="modal fade" id="joinedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">JOINED EVENTS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <th class="text-left align-middle" style="color: #df744a;">Name</th>
                                    <th class="text-left align-middle" style="color: #df744a;">Date</th>
                                    <th class="text-left align-middle" style="color: #df744a;">Start Time</th>
                                    <th class="text-left align-middle" style="color: #df744a;">Location</th>
                                </thead>
                                <tbody>
                                    <%foreach (var evs in getRegisterByUID())
                                        {%>
                                    <% var evrs = getSingleEvent(evs.EventId);%>
                                    <tr>
                                        <td class="text-left align-middle">
                                            <a href="EventInfo.aspx?id=<%=evs.EventId %>"><h6><% =evrs.EventName %></h6></a>
                                        </td>
                                        <td class="text-left align-middle">
                                            <h6><%=evrs.EventDate %></h6>
                                        </td>
                                        <td class="text-left align-middle">
                                            <h6><%=evrs.EventStartTime %></h6>
                                        </td>
                                        <td class="text-left align-middle">
                                            <h6><%=evrs.EventLocation %></h6>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                            <hr>
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
       <% if (getEvents().Count > 0)
            { %>
        <% foreach (var evs in getEvents())
            { %>
                <%if (evs.ActiveStatus == 1)
            {%>
                var marker = new google.maps.Marker({
                    position: { lat: <% =evs.Latitude %>, lng: <%=evs.Longitude%>},
                    map: map,
                });

                var infoWindow = new google.maps.InfoWindow({
                    content: '<img id="poster" src="<%=evs.PictureURL%>" alt="No image selected" class="border img-thumbnail img-fluid" style="height:100%;width:50%"> <br><br> <h5> <% =evs.EventName %> </h5> <p> <% =evs.EventDate %> ,  <% =evs.EventStartTime %> - <% =evs.EventEndTime %> </p>'
                });
                marker.addListener('click', function () {
                    window.location.href = 'EventInfo.aspx?id=<%=evs.EventId%>';
                });
                marker.addListener('mouseover', function () {
                    infoWindow.open(map, marker);
                });
                marker.addListener('mouseout', function () {
                    infoWindow.close(map, marker);
                });
        <% }
                }
            }%> 
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA&callback=initMap">
        </script>
    </form>
    <script src="Scripts/Search.js" type="text/javascript"></script>
    <script src="Scripts/Eventlocationhref.js" type="text/javascript"></script>
</asp:Content>
