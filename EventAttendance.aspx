<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="EventAttendance.aspx.cs" Inherits="EADPProject.EventAttendance" %>

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
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <%var evItem = getSingleEvent(); {%>
                        <h3 class="" style="color: #df744a">Event Attendance (<%=evItem.EventName%>)</h3>
                        <%} %>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <asp:Button ID="backAttendance" runat="server" Text="Back" class="btn btn-danger col-lg-2" Style="float: right;" OnClick="backAttendance_Click"/>
                    </div>
                </div>
                <br />
                <div class="input-group">
                    <input type="text" id="Aregsearchs" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn" style="background-color: #df744a; color: white;" id="Asearchbutton"><i class="fas fa-search mr-1"></i>Search</button>
                    </div>
                </div>
                <br>
                <br>
                <%int eventid = int.Parse(Request.QueryString["eid"].ToString()); %>
                <% %>
                <%if (getRegisterByEID(eventid).Count > 0)
                    {%>
                <h4>Absent Attendees</h4>
                <br>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <th class="text-left align-middle" style="color: #df744a;">Name</th>
                            <th class="text-left align-middle" style="color: #df744a;">Email</th>
                            <th class="text-left align-middle" style="color: #df744a;">Actions</th>
                        </thead>
                        <tbody>
                            <%foreach (var evs in getRegisterByEID(eventid))
                                {%>
                            <% var uitem = getUserInfo(evs.UserId);
                                {%>
                            <%if (evs.PresentStatus == 0) {%>
                            <tr class="aRegMainDiv">
                                <td class="text-left align-middle">
                                    <h6 class="usernameE" data-namings="<%=uitem.FName %> <%=uitem.LName %>"><%=uitem.FName %> <% =uitem.LName %></h6>
                                </td>
                                <td class="text-left align-middle">
                                    <h6 class="useremailE" data-namings="<%=evs.UserId %>"><%=evs.UserId %></h6>
                                </td>
                                <td class="text-left align-middle">
                                    <button type="button" id="<%=evs.EventId %>" class="btn" name="<%=evs.UserId %>" style="background-color: #df744a; color: white;" onclick="PresentEvent(this)">User is Present</button>
                                </td>
                            </tr>
                            <%} %>
                            <%} %>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <hr>
                <br>
                <h4>Present Attendees</h4>
                <br>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <th class="text-left align-middle" style="color: #df744a;">Name</th>
                            <th class="text-left align-middle" style="color: #df744a;">Email</th>
                            <th class="text-left align-middle" style="color: #df744a;">Actions</th>
                        </thead>
                        <tbody>
                            <%foreach (var evs in getRegisterByEID(eventid))
                                {%>
                            <% var uitem = getUserInfo(evs.UserId);
                                {%>
                            <%if (evs.PresentStatus == 1) {%>
                            <tr class="aRegMainDiv">
                                <td class="text-left align-middle">
                                    <h6 class="usernameE" data-namings="<%=uitem.FName %> <%=uitem.LName %>"><%=uitem.FName %> <% =uitem.LName %></h6>
                                </td>
                                <td class="text-left align-middle">
                                    <h6 class="useremailE" data-namings="<%=evs.UserId %>"><%=evs.UserId %></h6>
                                </td>
                                <td class="text-left align-middle">
                                    <h6 class="presentE font-italic" data-namings="present">Attendee Present</h6>
                                </td>
                            </tr>
                            <%} %>
                            <%} %>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <%}
                    else
                    {%>
                <div>
                    <h5>This event does not have any participants yet</h5>
                </div>
                <%} %>
            </div>
        </div>
    </form>
    <script>
        <%if (Request.QueryString["uid"] != null)
        {%>
        window.onload = function(){
            document.getElementById("Aregsearchs").value = <%=Request.QueryString["uid"].ToString()%>;
            $(document).ready(function () {
                document.getElementById("Asearchbutton").click();
            });
        }
        <%} %>
    </script>
    <script src="Scripts/Search.js" type="text/javascript"></script>
    <script src="Scripts/Presenthref.js" type="text/javascript"></script>
</asp:Content>
