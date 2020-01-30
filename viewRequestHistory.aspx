<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeFile="viewRequestHistory.aspx.cs" Inherits="EADPProject.viewRequestHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
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
            <asp:Label ID="Lbl_msg" runat="server"></asp:Label>
        </asp:Panel>
        <div class="card card-body" style="color: #df744a">

            <h1>Hire History</h1>

            <div class="container card text-center shadow-lg bg-white">
                <br>

                <div class="row">
                    <div class=" col-sm-3">
                        <h4>Receipt No. | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Photographer | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Location |</h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Date |</h4>
                    </div>

                </div>


                <hr>

                <script type="text/javascript">
                    var string;
                    function updateTransfer(elmnt) {
                        //window.location.replace("updateRequest.aspx?id=" + elmnt.id);



                        string = "window.open(\"updateRequest.aspx?id= " + elmnt.name + "\")";

                        console.log(string);
                        eval(string);

                    }

                    function deleteTransfer(elmnt) {
                        //window.location.href("updateRequest.aspx?id=" + elmnt.id);                  

                        string = "window.open(\"viewRequestHistory.aspx?id= " + elmnt.name + "\")";

                        console.log(string);
                        eval(string);

                    }

                </script>
<%--                        <script src="Scripts/HistoryReplaceU.js" type="text/javascript"></script>
    <script src="Scripts/HistoryReplaceD.js" type="text/javascript"></script>--%>






                <% var count = 0;
                    foreach (var i in rcpList)
                    {

                        if (i.Hiree != "Deleted                                           " && i.Name.Trim() == name)

                        {
                            count += 1;%>



                <button type="button" id="button<%= i.Id %>" class="btn btn-lg btn-block" data-toggle="modal" data-target="#myModal<%= i.Id %>">
                    <div class="row">

                        <div class=" col-sm-3">
                            <h4><%= i.Id %></h4>
                        </div>
                        <div class=" col-sm-3">
                            <h4><%= i.Hiree %></h4>
                        </div>
                        <div class=" col-sm-3">
                            <h4><%= i.Location1 %></h4>
                        </div>
                        <div class=" col-sm-3">
                            <h4><%= i.DateofHire.ToString("dd/MM/yyyy") %></h4>
                        </div>
                    </div>
                </button>


                <div class="modal fade" id="myModal<%= i.Id %>" tabindex="-1" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <strong>#<%= i.Id %></strong>


                                <span style="float: right"><strong><%= i.Hiree %></strong> </span>



                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>

                            <div class="modal-body">

                                <strong>Date of hire : <%= i.DateofHire.ToString("dd/MM/yyyy") %></strong>

                                <div class="table-responsive-sm">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="center">#</th>
                                                <th>Location</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td class="center">1</td>
                                                <td class="left strong"><%= i.Location1 %></td>

                                            </tr>


                                            <tr>
                                                <td class="center">2</td>
                                                <td class="left"><%= i.Location2 %></td>
                                            </tr>


                                            <tr>
                                                <td class="center">3</td>
                                                <td class="left"><%= i.Location3 %></td>
                                            </tr>


                                            <tr>
                                                <td class="center">4</td>
                                                <td class="left"><%= i.Location4 %></td>
                                            </tr>

                                            <tr>
                                                <td class="center">5</td>
                                                <td class="left"><%= i.Location5 %></td>
                                            </tr>

                                            <tr>
                                                <td class="center">6</td>
                                                <td class="left"><%= i.Location6 %></td>
                                            </tr>

                                            <tr>
                                                <td class="center">7</td>
                                                <td class="left"><%= i.Location7 %></td>
                                            </tr>


                                        </tbody>
                                    </table>
                                </div>


                                <div class="table-responsive-sm">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="center">Type</th>
                                                <th>Quantity</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td class="center">Soft Copy</td>
                                                <td class="left strong"><%= i.SC %></td>

                                            </tr>


                                            <tr>
                                                <td class="center"><%= i.HCType %></td>
                                                <td class="left"><%= i.Quantity %></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <h6><%= i.Remarks %> **</h6>

                                </div>




                                <div class="row">
                                    <div class="col-lg-4 col-sm-5">
                                    </div>

                                    <div class="col-lg-4 col-sm-5 ml-auto">
                                        <table class="table table-clear">
                                            <tbody>
                                                <tr>
                                                    <td class="left">
                                                        <strong>Subtotal</strong>
                                                    </td>
                                                    <td class="right">$<%= Convert.ToInt32(i.Quantity) * 3 %>.00</td>
                                                </tr>

                                                <tr>
                                                    <td class="left">
                                                        <strong>Total</strong>
                                                    </td>
                                                    <td class="right">
                                                        <strong>$<%= Convert.ToInt32(i.Quantity) * 3 %>.00</strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>


                                <%--<h4>Route Plans :</h4>
                                <h5>1. <%= i.Location1 %></h5>
                                <h5>2. <%= i.Location2 %></h5>
                                <h5>3. <%= i.Location3 %></h5>
                                <h5>4. <%= i.Location4 %></h5>
                                <h5>5. <%= i.Location5 %></h5>
                                <h5>6. <%= i.Location6 %></h5>
                                <h5>7. <%= i.Location7 %></h5>
                                <br>
                                <h6><%= i.Remarks %></h6>
                                   <br>
                                 <h6><%= i.HCType %> <%= i.Quantity %>, <%= i.SC %></h6>

                               <h4>Price : <%= i.Price %></h4>--%>
                            </div>


                            <div class="modal-footer">
                                <button id="DeleteButton" name="<%= i.Id %>" class="btn btn-dark" onclick="deleteTransfer(this)">Delete</button>

                                <button id="EditButton" name="<%= i.Id %>" class="btn btn-danger" onclick="updateTransfer(this)">Edit</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

                <hr>
                <% }
                    }
                    if (count == 0)
                    {%>

                <h3>You have no request! Start Hiring Now!</h3>
                <br>
                <%
                    }%>


                <br>
                <a href="/createRequest.aspx" class=" btn btn-info">Hire Another</a>
                <br>
            </div>
        </div>

    </form>
</asp:Content>
