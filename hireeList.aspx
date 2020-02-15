<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeFile="hireeList.aspx.cs" Inherits="EADPProject.hireeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


    <script>
                var string;
                    function updateTransfer(elmnt) {
                        //window.location.href("updateRequest.aspx?id=" + elmnt.id);
                        //window.open(string, "_self");
                        //if (elmnt) {
                        //    window.location = ("hireeList.aspx?status=a&id=" + elmnt.name);
                        //    console.log(string)
                        //}
                    
                    string = "window.open(\"hireeList.aspx?status=a&id= " + elmnt.name + "\")" ;

                    console.log(string);
                    eval(string);
                                                    
                    }

                    function deleteTransfer(elmnt) {
                        //window.location.href("updateRequest.aspx?id=" + elmnt.id);                  
                    
                    string = "window.open(\"hireeList.aspx?status=d&id= " + elmnt.name + "\")" ;

                    console.log(string);
                    eval(string);
                                                    
                }

                </script>
<%--        <script src="Scripts/HireeReplaceU.js" type="text/javascript"></script>
    <script src="Scripts/HireeReplaceD.js" type="text/javascript"></script>--%>

    <form id="form1" runat="server">

    <div class="card card-body" style="color:#df744a">
        
       <h1>Hire History</h1>
<%--       <div class="input-group">
                <input type="text" id="HireeSearch" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                    <button type="button" class="btn" style="background-color: #df744a; color: white;" id="HireeSearchButton"><i class="fas fa-search mr-1"></i>Search</button>
                </div>
            </div>--%>



        <h2>Accepted </h2>
        <div class="card-body card text-center shadow-lg bg-white">
                <br>


                <div class="row">
                    <div class=" col-sm-3">
                        <h4>Receipt No. | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Client | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Location |</h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Date |</h4>
                    </div>

                </div>

                
                <hr>
                
                
                <% var count = 0;
                    foreach (var i in rcpList)
                    {

                        if (i.Hiree.Trim() == name)

                        {
                            count += 1;%> 

                                            
                                                
                                            
                 <button type="button" id="button<%= i.Id %>" class="HireeMainDiv btn btn-lg btn-block" data-toggle="modal" data-target="#myModal<%= i.Id %>">
                     <div class="row">

                         <div class=" col-sm-3">
                            <h4><%= i.Id %></h4>
                         </div>
                         <div class=" col-sm-3">
                            <h4><%= i.Name %></h4>
                         </div>
                         <div class=" col-sm-3">
                            <h4 class="HireeLocation" data-HireeNames="<%= i.Location1 %>"><%= i.Location1 %></h4>
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
                                
                             
                            <span style="float:right"> <strong><%= i.Name %></strong> </span> 
                            

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


                                <% if (i.Location2 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">2</td>
                                                <td class="left"><%= i.Location2 %></td>
                                            </tr>
                                            <% if (i.Location3 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">3</td>
                                                <td class="left"><%= i.Location3 %></td>
                                            </tr>
                                            <% if (i.Location4 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">4</td>
                                                <td class="left"><%= i.Location4 %></td>
                                            </tr>
                                            <% if (i.Location5 != "                                                  ")
                                                     { %>
                                            <tr>
                                                <td class="center">5</td>
                                                <td class="left"><%= i.Location5 %></td>
                                            </tr>
                                            <% if (i.Location6 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">6</td>
                                                <td class="left"><%= i.Location6 %></td>
                                            </tr>
                                            <% if (i.Location7 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">7</td>
                                                <td class="left"><%= i.Location7 %></td>
                                            </tr>
                                            <% }
                                                                     }
                                                                 }
                                                             }
                                                         }
                                                     } %>
                                    </table>
                                                                        <h6><%= i.Remarks %> **</h6>

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

                                <asp:FileUpload ID="SaveImage" runat="server"  AllowMultiple="true" />
                                
                                <asp:Label runat="server" ID="lblposter" />
                            <div class="modal-footer">

                                
                                

                                <br>
                            <button id="DeclineButton" name="<%= i.Id %>  " class="btn btn-danger" onclick="deleteTransfer(this)" >Decline</button>


                            <button id="AddImgButton" name="<%= i.Id %>  " class="btn btn-danger" onclick="updateTransfer(this)" >Add Images</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                            </div>
                        </div>
                    
</div>
                <hr>
                <% }
                   }%>
            </div>

        <br>
                <h2>Preffered </h2>
        <div class="card-body card text-center shadow-lg bg-white">
                <br>


                <div class="row">
                    <div class=" col-sm-3">
                        <h4>Receipt No. | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Client | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Location |</h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Date |</h4>
                    </div>

                </div>

                
                <hr>
                
                
                <% var pacount = 0;
                    foreach (var i in rcpList)
                    {

                        if (i.Hiree.Trim() == "Not Accepted" && i.PreferredPhotographer.Trim() == name )

                        {
                            pacount += 1;%> 

                                            
                                                
                                            
                 <button type="button" id="button<%= i.Id %>" class="btn btn-lg btn-block" data-toggle="modal" data-target="#myModal<%= i.Id %>">
                     <div class="row">

                         <div class=" col-sm-3">
                            <h4><%= i.Id %></h4>
                         </div>
                         <div class=" col-sm-3">
                            <h4><%= i.Name %></h4>
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
                                
                             
                            <span style="float:right"> <strong><%= i.Name %></strong> </span> 
                            

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


                                <% if (i.Location2 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">2</td>
                                                <td class="left"><%= i.Location2 %></td>
                                            </tr>
                                            <% if (i.Location3 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">3</td>
                                                <td class="left"><%= i.Location3 %></td>
                                            </tr>
                                            <% if (i.Location4 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">4</td>
                                                <td class="left"><%= i.Location4 %></td>
                                            </tr>
                                            <% if (i.Location5 != "                                                  ")
                                                     { %>
                                            <tr>
                                                <td class="center">5</td>
                                                <td class="left"><%= i.Location5 %></td>
                                            </tr>
                                            <% if (i.Location6 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">6</td>
                                                <td class="left"><%= i.Location6 %></td>
                                            </tr>
                                            <% if (i.Location7 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">7</td>
                                                <td class="left"><%= i.Location7 %></td>
                                            </tr>
                                            <% }
                                                                     }
                                                                 }
                                                             }
                                                         }
                                                     } %>
                                    </table>

                                    <h6><%= i.Remarks %> **</h6>
                                

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



                            <div class="modal-footer">

                            <button id="AcceptButt" name="<%= i.Id %>" class="btn btn-danger" onclick="updateTransfer(this)" >Accept</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                                                                                 
                            </div>
                        </div>
                                    
                </div>

                <hr>
                <% }
                    }
                    if (pacount == 0)
                    {%>

                <h3>No Requests at the moment.</h3> 
                <br>
                    <%
                        }%>
                

        
    </div>

            <br>
        
        <h2>Requests </h2>
        <div class="card-body card text-center shadow-lg bg-white">
                <br>


                <div class="row">
                    <div class=" col-sm-3">
                        <h4>Receipt No. | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Client | </h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Location |</h4>
                    </div>
                    <div class=" col-sm-3">
                        <h4>Date |</h4>
                    </div>

                </div>

                
                <hr>
                
                
                <% var nacount = 0;
                    foreach (var i in rcpList)
                    {

                        if (i.Hiree.Trim() == "Not Accepted")

                        {
                            nacount += 1;%> 

                                            
                                                
                                            
                 <button type="button" id="button<%= i.Id %>" class="btn btn-lg btn-block" data-toggle="modal" data-target="#myModal<%= i.Id %>">
                     <div class="row">

                         <div class=" col-sm-3">
                            <h4><%= i.Id %></h4>
                         </div>
                         <div class=" col-sm-3">
                            <h4><%= i.Name %></h4>
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
                                
                             
                            <span style="float:right"> <strong><%= i.Name %></strong> </span> 
                            

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


                                 <% if (i.Location2 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">2</td>
                                                <td class="left"><%= i.Location2 %></td>
                                            </tr>
                                            <% if (i.Location3 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">3</td>
                                                <td class="left"><%= i.Location3 %></td>
                                            </tr>
                                            <% if (i.Location4 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">4</td>
                                                <td class="left"><%= i.Location4 %></td>
                                            </tr>
                                            <% if (i.Location5 != "                                                  ")
                                                     { %>
                                            <tr>
                                                <td class="center">5</td>
                                                <td class="left"><%= i.Location5 %></td>
                                            </tr>
                                            <% if (i.Location6 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">6</td>
                                                <td class="left"><%= i.Location6 %></td>
                                            </tr>
                                            <% if (i.Location7 != "                                                  ")
                                                     { %>

                                            <tr>
                                                <td class="center">7</td>
                                                <td class="left"><%= i.Location7 %></td>
                                            </tr>
                                            <% }
                                                                     }
                                                                 }
                                                             }
                                                         }
                                                     } %>

                                    </table>
                                                                        <h6><%= i.Remarks %> **</h6>

                                

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



                            <div class="modal-footer">

                            <button id="AcceptButt" name="<%= i.Id %>" class="btn btn-danger" onclick="updateTransfer(this)" >Accept</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                            </div>
                        </div>
                    
                      </div>
                <hr>
                <% }
                    }
                    if (nacount == 0)
                    {%>

                <h3>No Requests at the moment.</h3> 
                <br>
                    <%
                        }%>
                

        
    </div>

    </div>

    </form>
    <script src="Scripts/SearchHiree.js" type="text/javascript"></script>

</asp:Content>
