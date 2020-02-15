<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="EADPProject.ViewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <form id="form1" runat="server">
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
                    <div class="col-sm-12 col-md-12 col-lg-8">
                        <h3 class="" style="color: #df744a">Events</h3>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-4 text-right">
                        <asp:Button ID="ButtonAddNewEvent" runat="server" Text="Add New Event" class="btn" Style="background-color: #df744a; color: white;" OnClick="ButtonAddNewEvent_Click" />
                    </div>
                </div>
                <br />
                <div class="input-group">
                    <input type="text" id="evtbSearch" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn" style="background-color: #df744a; color: white;" id="searchbut"><i class="fas fa-search mr-1"></i>Search</button>
                    </div>
                </div>
                <input type="text" id="idLabelp" name="idLabelp" hidden="hidden" value="textp" />
                <asp:Label ID="idLabel" runat="server" Text="" />
                <br>
                <s></s>
                <hr>

                <% if (getEvents().Count > 0)
                    { %>
                <% foreach (var evs in getEvents())
                    { %>
                <% if (evs.ActiveStatus == 1)
                    { %>
                <% if (Session["StudNo"] != null)
                    {%>
                <% if (evs.AdminEmail.ToUpper().ToString() == Session["StudNo"].ToString().ToUpper())
                    {%>
                <div class="card mb-2 w-100 mx-auto evmainDiv" style="border-color: #df744a">
                    <div class=" mt-3 ml-3" style="border-color: #df744a;">
                        <h5 class="evname font-weight-bold" data-names="<%=evs.EventName %>"><% =evs.EventName %></h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-2">
                                <a href="<% =evs.PictureURL %>" data-toggle="lightbox">
                                    <img src="<% =evs.PictureURL %>" class="border img-thumbnail img-fluid" style="height: 70%; width: 100%">
                                </a>
                                <br>
                                <br>
                                <button id="attendanceButton" type="button" name="<%=evs.EventId %>" class="btn" style="width: 100%; background-color: #df744a; color: white" onclick="AttEvent(this)">Attendance</button>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-7">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 col-lg-4">
                                        <p class="font-italic font-weight-bold" style="color: #df744a;">Date of Event</p>
                                        <p class="evdate" data-names="<% =evs.EventDate %>"><% =evs.EventDate %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 col-lg-4">
                                        <p class="font-italic font-weight-bold" style="color: #df744a;">Start Time of Event</p>
                                        <p class=""><% =evs.EventStartTime %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 col-lg-4">
                                        <p class="font-italic font-weight-bold" style="color: #df744a;">End Time of Event</p>
                                        <p class=""><% =evs.EventEndTime %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 col-lg-4">
                                        <p class="font-italic font-weight-bold" style="color: #df744a;">Cost of Event</p>
                                        <p class=" evcost" data-names="<%=evs.EventCost %>"><% =evs.EventCost %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-6 col-lg-4">
                                        <p class="font-italic" style="color: #df744a; font-weight: bold;">Event Category</p>
                                        <p class="evcategory" data-names="<% =evs.EventCategory %>"><% =evs.EventCategory %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-6 col-lg-4">
                                        <p class="font-italic" style="color: #df744a; font-weight: bold;">Maximum Capacity</p>
                                        <p class="evcapacity" data-names="<% =evs.Capacity.ToString() %>"><% =evs.Capacity %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6 col-lg-4">
                                        <p class="font-italic" style="color: #df744a; font-weight: bold;">Number of Joins</p>
                                        <p class="evjoin" data-names="<% =evs.NumberOfJoins.ToString() %>"><% =evs.NumberOfJoins %></p>
                                    </div>
                                    <div class="col-sm-12 col-md-6 col-lg-8">
                                        <p class="font-italic" style="color: #df744a; font-weight: bold;">Location of Event</p>
                                        <p class="evlocation" data-names="<% =evs.EventLocation %>"><% =evs.EventLocation %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-3">
                                <button id="editButton" type="button" name="<%=evs.EventId %>" class="btn btn-info" onclick="EditEvent(this)">Edit</button>
                                <button id="deleteButton<%=evs.EventId %>" type="button" name="<%=evs.EventId %>" class="btn btn-danger" data-toggle="modal" data-target="#basicModal<%=evs.EventId %>">Delete</button>
                                <%if (evs.HiddenStatus == 0)
                                    {%>
                                <button id="hideButton" type="button" name="<%=evs.EventId %>" class="btn btn-secondary" onclick="HideEvent(this)">Hide</button>
                                <%}
                                    else
                                    { %>
                                <button id="unhideButton" type="button" name="<%=evs.EventId %>" class="btn btn-dark" onclick="UnhideEvent(this)">Publish</button>
                                <%} %>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer" style="border-color: #df744a">
                        <h6 class="font-italic font-weight-bold" style="color: #df744a;">About Event:</h6>
                        <p class=""><% =evs.EventDescription %></p>
                    </div>
                </div>

                <div class="modal fade" id="basicModal<%=evs.EventId %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">DELETE EVENT</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you sure you wish to delete this event? Emails will be sent out to affected users and refunds may be necessary.
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="deleteModalButton" runat="server" UseSubmitBehavior="false" Text="YES" class="btn btn-danger" OnClick="deleteModalButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    var idLabelp = document.getElementById("idLabelp")
                    var deleteButton = document.getElementById("deleteButton")
                    $("#basicModal" + <%=evs.EventId%>).on('show.bs.modal', function () {
                        idLabelp.value = deleteButton<%=evs.EventId%>.name
                    });
                </script>
                <%}
                                }
                            }
                        }
                    }%>
                <%else
                    { %>
                <h2 style="color: #df744a;">No Events </h2>
                <%} %>
            </div>
        </div>
    </form>
    <script src="Scripts/Search.js" type="text/javascript"></script>
    <script src="Scripts/Locationhref.js" type="text/javascript"></script>
    <script src="Scripts/Attendancehref.js" type="text/javascript"></script>
    <script src="Scripts/HideEvent.js" type="text/javascript"></script>
    <script src="Scripts/UnhideEvent.js" type="text/javascript"></script>
</asp:Content>
