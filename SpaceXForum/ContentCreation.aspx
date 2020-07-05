<%@ Page Title="Content Creation" UnobtrusiveValidationMode="none" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ContentCreation.aspx.cs" Inherits="SpaceXForum.ContentCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td>
                <asp:Label ID="lblCreatePost" runat="server" CssClass="text-center" Font-Size="X-Large" Text="Create Post" Width="100%"></asp:Label>
            </td>
            <td style="width: 20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="LblTitle" runat="server" CssClass="text-right" Text="Title:" Width="100%"></asp:Label>
                        </td>
                        <td style="height: 26px">
                <asp:TextBox ID="txtTitle" runat="server" Width="100%" MaxLength="200"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="TitleReq" runat="server" ControlToValidate="txtTitle" CssClass="text-center" Display="Dynamic" ErrorMessage="Title Required!" ForeColor="Red" Width="100%"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label1" runat="server" CssClass="text-right" Text="Description:" Width="100%"></asp:Label>
                        </td>
                        <td>
                <asp:TextBox ID="txtDesc" runat="server" Height="138px" Width="100%" MaxLength="1000"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="reqDescrip" runat="server" ControlToValidate="txtDesc" CssClass="text-center" ErrorMessage="Must have something in description!" ForeColor="Red" Width="100%"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td>
                <asp:Button ID="btnPost" runat="server" Text="Create new post" OnClick="btnPost_Click" Width="100%" />
                <br />
                <asp:CustomValidator ID="PostError" runat="server" ControlToValidate="txtDesc" CssClass="text-center" Display="Dynamic" ErrorMessage="There was an error posting!" ForeColor="Red" Width="100%">There was an error posting!</asp:CustomValidator>
            </td>
            <td style="width: 20%">&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
