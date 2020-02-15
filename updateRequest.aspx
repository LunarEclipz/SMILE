<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="updateRequest.aspx.cs" Inherits="EADPProject.updateRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align: left;
        }
    </style>
            <link rel="stylesheet" href="StyleSheets/wizard.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1>Edit Request</h1>

        <div>
            <ul class="nav nav-tabs nav-fill wizard" id="myTab" role="tablist">
                <li class="nav-item active">
                    <a href="#date" class="nav-link active" id="date-tab" data-toggle="tab" role="tab" aria-controls="date" aria-selected="true"><span class="step">1</span>Date</a>
                </li>
                <li class="nav-item">
                    <a href="#location" class="nav-link" id="location-tab" data-toggle="tab" role="tab" aria-controls="location" aria-selected="false"><span class="step">2</span>Locations</a>
                </li>
                <li class="nav-item">
                    <a href="#specific" class="nav-link" id="specific-tab" data-toggle="tab" role="tab" aria-controls="specific" aria-selected="false"><span class="step">3</span>Specifications</a>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">

                <div class="tab-pane fade show active" id="date" role="tabpanel" aria-labelledby="date-tab">
                    <h3>Date of choice</h3>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend ">
                            <span class="input-group-text" id="basic-addon1">Date</span>
                        </div>
                        <asp:TextBox ID="TextBoxDate" runat="server" Width="30%" placeholder="dd/mm/yyyy" class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="tab-pane fade" id="location" role="tabpanel" aria-labelledby="location-tab">
                    <h3>Locations</h3>
                    <div style="width: 100%">
                        <iframe width="100%" height="600" src="https://maps.google.com/maps?width=100%&height=600&hl=en&q=singapore+(Your%20Business%20Name)&ie=UTF8&t=&z=11&iwloc=B&output=embed" frameborder="1" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/journey-planner.htm">Route Finder</a></iframe>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">1.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation1" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">2.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation2" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">3.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation3" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">4.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation4" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon6">5.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation5" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon7">6.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation6" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">7.</span>
                        </div>
                        <asp:TextBox ID="TextBoxLocation7" runat="server" Width="30%" class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="tab-pane fade" id="specific" role="tabpanel" aria-labelledby="specific-tab">
                    <h3>Specifications</h3>

                    <div class="input-group">



                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <asp:CheckBox ID="CheckBoxSoftCopy" runat="server" />
                            </div>
                        </div>
                        <span class="input-group-text" id="basic-addon10">Photos in Soft Copy (Unlimited)</span>
                    </div>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <asp:CheckBox ID="CheckBoxPreferred" runat="server" OnCheckedChanged="CheckBoxPreferred_CheckedChanged" />
                            </div>
                        </div>
                        <span class="input-group-text" id="basic-addon11">Preferred Photographer</span>
                        <asp:TextBox ID="TextBoxPreferred" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                    </div>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <asp:CheckBox ID="CheckBoxHardCopy" runat="server" OnCheckedChanged="CheckBoxHardCopy_CheckedChanged" />
                            </div>
                        </div>
                        <span class="input-group-text" id="basic-addon12">Photos in Hard Copy</span>
                        <div class="input-group-append">
                            <asp:DropDownList ID="DropDownListHC" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">
                                <asp:ListItem>Framed</asp:ListItem>
                                <asp:ListItem>Mugs</asp:ListItem>
                                <asp:ListItem>Fun Sized</asp:ListItem>
                                <asp:ListItem>Passport Sized</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:TextBox ID="TextBoxQuantity" class="form-control" runat="server" placeholder="Quantity"></asp:TextBox>
                    </div>


                    <br />
                    <p>* Additonal Fees will be imposed</p>

                    <div class="input-group mb-2">
                        <div class="input-group-prepend ">
                            <span class="input-group-text" id="basic-addon15">Additional Remarks</span>
                        </div>
                        <asp:TextBox ID="TextBoxRemarks" runat="server" Rows="5" TextMode="MultiLine" Width="1043px" class="form-control"></asp:TextBox>
                    </div>

                    <div class="row">
                        <div class=" col-sm-3" style="float: right">
                            <asp:Button ID="ButtonEdit" runat="server" Text="Edit" class="btn btn-info" Width="200px" OnClick="ButtonEdit_Click" />
                        </div>
                        <div class=" col-sm-9 ">
                            <asp:Label ID="LblMsg" runat="server"></asp:Label>
                        </div>
                    </div>


                </div>
            </div>
    </form>
    <br>

    <script>
        $('.wizard li').click(function () {
            $(this).prevAll().removeClass('active').addClass('completed');
            $(this).removeClass('completed').addClass('active');
            $(this).nextAll().removeClass('completed active');
        });
    </script>
</asp:Content>
