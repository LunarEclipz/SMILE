<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="EADPProject.CreateEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <div class="container">
            <asp:Panel ID="PanelErrorResult" Visible="false" runat="server" CssClass="alert alert-dismissable alert-danger">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Lbl_err" runat="server"></asp:Label>
            </asp:Panel>
            <div class="card card-body" style="color: #df744a">
                <h3>Add Event
                </h3>
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
                    </div>
                    <div class="col-lg-3">
                        <asp:FileUpload ID="SaveImage" onchange="PreviewImage(this)" runat="server" style="color:transparent;"  AllowMultiple="false" />
                        <asp:Image runat="server" ID="posterImage" alt="No image available" 
                            class="border img-thumbnail img-fluid" style="height: 95%; width: 100%"/>
                        <asp:Label runat="server" ID="lblposter" />
                    </div>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <div class="row">
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
                        <div class="col-lg-1">
                        </div>
                        <div class="col-12 col-sm-12 col-md-12 col-lg-3">
                            <label class="font-italic">Date of Event</label>
                            <asp:TextBox ID="tbEventDate" runat="server" class="form-control" Width="250" placeholder="dd/mm/yyyy" required />
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <asp:Button ID="ButtonCancelAdd" runat="server" UseSubmitBehavior="false" Text="Cancel" class="btn btn-danger" Width="130px" OnClick="ButtonCancelAdd_Click" />
                    <asp:Button ID="ButtonCreateEvent" runat="server" Text="Add Event" class="btn btn-info" Width="130px" OnClick="ButtonCreateEvent_Click" />
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
            label.innerText = strCut
            console.log(strCut)
        }
    </script>
</asp:Content>
