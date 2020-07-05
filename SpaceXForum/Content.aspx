<%@ Page Title="Home" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="SpaceXForum.Content" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="Content">
    <table style="width:100%;">
        <tr>
            <td style="width: 15%">&nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td style="width: 80%">
                            <asp:TextBox ID="txtSearch" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" Width="100%" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 15%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 15%"></td>
            <td style="height: 26px">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="White" Text="lblError" CssClass="text-center" Width="100%"></asp:Label>
                <asp:GridView ID="postGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="MainViewDataSource" ForeColor="Black" GridLines="Horizontal" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" >
                            <HeaderStyle Width="10%" />
                            <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                            <HeaderStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="ContentText" HeaderText="ContentText" SortExpression="ContentText" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="MainViewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceXDatabaseConnectionString %>" SelectCommand="SELECT [Date], [Title], [ContentText], [UserName] FROM [mainview]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%"></td>
        </tr>
        <tr>
            <td style="width: 15%">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>


