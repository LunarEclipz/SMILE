<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewUserList.aspx.cs" Inherits="EADPProject.ViewUserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">
            <asp:TextBox ID="TBSearch" runat="server"
                CssClass="text-search"
                Text=""
                Width="370" />
            <asp:Button ID="ButtonSearch" runat="server"
                CssClass="button-search"
                Text="Search"
                OnClick="ButtonSearch_Click" />
        </asp:Panel>

        <br />

        <asp:GridView ID="GvSmile" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GvSmile_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                <asp:BoundField DataField="FName" HeaderText="FName" ReadOnly="True" />
                <asp:BoundField DataField="LName" HeaderText="LName" ReadOnly="True" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
                <asp:BoundField DataField="Usertype" HeaderText="Usertype" ReadOnly="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

</asp:Content>
