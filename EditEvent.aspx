<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="EditEvent.aspx.cs" Inherits="EADPProject.EditEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <form id="form2" runat="server">
        <div style="padding: 10px;">
            <asp:Panel ID="PanelErrorResultU" Visible="false" runat="server" CssClass="alert alert-dismissable alert-danger">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_errU" runat="server"></asp:Label>
            </asp:Panel>
            <div class="card card-body" style="color: #df744a">
                <h3>Edit Event</h3>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="form-event-group">
                            <label class="font-italic" for="eventName">Event Name</label>
                            <asp:TextBox ID="tbEventName" runat="server" class="form-control" required />
                        </div>
                        <div class="form-event-group mb-4">
                            <label class="font-italic" for="eventDescription">Event Description</label>
                            <asp:TextBox TextMode="MultiLine" ID="tbEventDescription" runat="server" class="form-control" required />
                        </div>
                        <div class="form-event-group">
                            <label class="font-italic" for="eventCost">
                                Event Cost (Leave blank if event cost is
                            free)</label>
                            <asp:TextBox ID="tbEventCost" runat="server" class="form-control" />
                        </div>
                        <div class="form-event-group">
                            <label class="font-italic" for="eventLocation">Event Location</label>
                            <asp:TextBox ID="tbEventLocation" runat="server" class="form-control" required />
                        </div>

                        <div class="form-event-group">
                            <label class="font-italic" for="eventCapacity">Event Maximum Capacity (Leave blank if event has no capacity)</label>
                            <asp:TextBox ID="tbEventCapacity" runat="server" class="form-control" />
                        </div>
                        <div class="form-event-group">
                            <label class="font-italic" for="eventCategory">Event Category</label>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCategory">
                                <asp:ListItem>-- Select --</asp:ListItem>
                                <asp:ListItem>Outdoors & Adventure</asp:ListItem>
                                <asp:ListItem>Tech</asp:ListItem>
                                <asp:ListItem>Family</asp:ListItem>
                                <asp:ListItem>Health and Wellness</asp:ListItem>
                                <asp:ListItem>Sports and Fitness</asp:ListItem>
                                <asp:ListItem>Learning</asp:ListItem>
                                <asp:ListItem>Food & Drink</asp:ListItem>
                                <asp:ListItem>Language & Culture</asp:ListItem>
                                <asp:ListItem>Music</asp:ListItem>
                                <asp:ListItem>Sci-Fi & Games</asp:ListItem>
                                <asp:ListItem>Arts</asp:ListItem>
                                <asp:ListItem>Dance</asp:ListItem>
                                <asp:ListItem>Fashion & Beauty</asp:ListItem>
                                <asp:ListItem>Career & Business</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <asp:FileUpload ID="SaveImage" runat="server" onchange="PreviewImage(this)" AllowMultiple="false" Style="color: transparent" />
                        <asp:Image runat="server" ID="posterImage" alt="No image available"
                            class="border img-thumbnail img-fluid" Style="height: 95%; width: 100%" />
                        <br>
                        <asp:Label runat="server" ID="lblposter" Visible="true" name="posterURL" />
                    </div>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-3">
                            <label class="font-italic">Date of Event</label>
                            <asp:TextBox ID="tbEventDate" runat="server" class="form-control" Width="250" placeholder="dd/mm/yyyy" required />
                        </div>
                        <div class="col-lg-1">
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-3">
                            <label class="font-italic">Event Start Time</label>
                            <asp:TextBox ID="tbStartTime" type="time" runat="server" class="form-control" required />
                        </div>
                        <div class="col-lg-1">
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-3">
                            <label class="font-italic">Event End Time</label>
                            <asp:TextBox ID="tbEndTime" type="time" runat="server" class="form-control" required />
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 text-right">
                        <asp:Button ID="ButtonCancelEdit" runat="server" UseSubmitBehavior="false" Text="Cancel" class="btn btn-danger" Width="130px" OnClick="ButtonCancelEdit_Click" />
                        <asp:Button ID="ButtonEditEvent" runat="server" Text="Edit Event" Style="background-color: #df744a; color: white;" class="btn" Width="130px" OnClick="ButtonEditEvent_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function PreviewImage(item) {
            if (item.files && item.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=posterImage.ClientID%>').prop('src', e.target.result)
                        .width(250)
                        .height(250);
                };
                reader.readAsDataURL(item.files[0]);
            }
            var upload = document.getElementById("<% =SaveImage.ClientID%>");
            var label = document.getElementById("<% =lblposter.ClientID %>");
            var str = upload.value
            var strCut = str.slice(str.lastIndexOf('\\') + 1)
            label.textContent = strCut
            console.log(strCut)
        }
    </script>
</asp:Content>
