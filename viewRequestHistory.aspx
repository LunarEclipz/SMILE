<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeFile="viewRequestHistory.aspx.cs" Inherits="EADPProject.viewRequestHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <div class="card card-body" style="color:#df744a">
        
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

                <br>

                <script>
                var string;
                function updateTransfer(elmnt) {
                    string = "window.open('updateRequest.aspx?id=" + elmnt.id + "')";

                    console.log(string);
                    eval(string);

                    //string = "updateRequest.aspx?id=" + elmnt.id ;

                    //console.log(string);
                    //Location.replace(string);
                                                    
                }

                </script>
                <%foreach (var i in rcpList)
                    { %> 

                                            
                                                
                                            
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
                            <h4><%= i.DateofHire %></h4>
                         </div>
                     </div>
                 </button>

                <br>

                <div class="modal fade" id="myModal<%= i.Id %>" tabindex="-1" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">#<%= i.Id %>, <%= i.DateofHire %></h4>

                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>

                            <div class="modal-body">
                                <h4>Route Plans :</h4>
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

                               <h4>Price : <%= i.Price %></h4>

                            </div>


                            <div class="modal-footer">
                            <button id="<%= i.Id %>" class="btn btn-danger" onclick="updateTransfer(this)" >Edit</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                            </div>
                        </div>
                    </div>
                <% } %>
                

                <br>
                <a href="/createRequest.aspx" class =" btn btn-info">Hire Another</a>
                <br>

        
    </div>
            </div>

    </form>
</asp:Content>
