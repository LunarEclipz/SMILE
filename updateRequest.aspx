﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SmileMaster.Master" AutoEventWireup="true" CodeBehind="updateRequest.aspx.cs" Inherits="EADPProject.updateRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align:left;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form id="form1" runat="server">
    <div class="card card-body" style="color:#df744a">
        <h1>Edit Request</h1>
        
            <div class="container card text-center shadow-lg bg-white">


                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>Locations</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" rowspan="13"><div style="width: 100%"><iframe width="100%" height="600" src="https://maps.google.com/maps?width=100%&height=600&hl=en&q=singapore+(Your%20Business%20Name)&ie=UTF8&t=&z=11&iwloc=B&output=embed" frameborder="1" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/journey-planner.htm">Route Finder</a></iframe></div><br /></td>
                        <td>1.
                            <asp:TextBox ID="TextBoxLocation1" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>2.
                            <asp:TextBox ID="TextBoxLocation2" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>3.
                            <asp:TextBox ID="TextBoxLocation3" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>4.
                            <asp:TextBox ID="TextBoxLocation4" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>5.
                            <asp:TextBox ID="TextBoxLocation5" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>6.
                            <asp:TextBox ID="TextBoxLocation6" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>7.
                            <asp:TextBox ID="TextBoxLocation7" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        
                        <td class="auto-style2">Date : <asp:TextBox ID="TextBoxDate" runat="server" Width="30%" placeholder="dd/mm/yyyy"></asp:TextBox>
                        </td>
                        <td>Camera Model :&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxCameraModel" runat="server" Width="376px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:CheckBox ID="CheckBoxSoftCopy" runat="server" Text="Photos in Soft Copy (Unlimited)" />
                        </td>
                        <td>
                            <asp:CheckBox AutoPostBack="true" ID="CheckBoxPreferred" runat="server" Text="Preferred Photography :" OnCheckedChanged="CheckBoxPreferred_CheckedChanged" />
&nbsp;<asp:TextBox ID="TextBoxPreferred" runat="server" Width="312px" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:CheckBox AutoPostBack="true" ID="CheckBoxHardCopy" runat="server" Text="Photos in Hard Copy :" OnCheckedChanged="CheckBoxHardCopy_CheckedChanged" />
&nbsp;<asp:DropDownList ID="DropDownListHC" runat="server">
                                <asp:ListItem>Framed</asp:ListItem>
                                <asp:ListItem>Mugs</asp:ListItem>
                                <asp:ListItem>Fun Sized</asp:ListItem>
                                <asp:ListItem>Passport Sized</asp:ListItem>
                            </asp:DropDownList>
                        &nbsp;<asp:TextBox ID="TextBoxQuantity" runat="server" Enabled="False" Width="92px" placeholder = "Quantity"></asp:TextBox>
                            <br />
                            * Additonal Fees will be imposed
                        </td>
                        <td>
                            <div class ="row">
                                <div class =" col-sm-3 ">
                                    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" class="btn btn-info" Width="200px" OnClick="ButtonEdit_Click"/>
                                </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                                 <div class =" col-sm-9 ">
                            <asp:Label ID="LblMsg" runat="server"></asp:Label>
                                     </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Additional Remarks :<br />
                            <asp:TextBox ID="TextBoxRemarks" runat="server" Rows="5" TextMode="MultiLine" Width="1043px"></asp:TextBox>
                        </td>
                    </tr>
                </table>


            </div>
    </div>
    </form>
    <br>
</asp:Content>
