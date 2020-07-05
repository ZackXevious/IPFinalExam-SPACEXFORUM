<%@ Page Title="Edit User" Language="C#" MasterPageFile="~/SiteMaster.Master" UnobtrusiveValidationMode='None' AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="SpaceXForum.EditUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <table style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td style="width: 20%; height: 50px;">
                <asp:Label ID="LBLUsername" runat="server" Text="USERNAME" Width="100%" CssClass="text-center"></asp:Label>
                <br />
                <asp:Label ID="LblUserType" runat="server" CssClass="text-center" Font-Bold="True" Font-Size="Small" Text="USERTYPE" Width="100%"></asp:Label>
            </td>
            <td style="height: 50px"></td>
            <td style="width: 10%; height: 50px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">
                Email Address:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="100%" TextMode="Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*There must be something in the Email Field!!" ForeColor="Red" CssClass="text-center" Width="100%"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 10%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblAboutMe" runat="server" Text="About Me:" CssClass="text-right" Width="100%"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAboutMe" runat="server" Width="100%" Height="200px" MaxLength="500" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td style="width: 10%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%; height: 26px;"></td>
            <td style="height: 26px"></td>
            <td style="width: 10%; height: 26px;"></td>
        </tr>
        <tr>
            <td style="width: 20%">Change Password:</td>
            <td>
                <asp:TextBox ID="txtChangePassword" runat="server" MaxLength="50" Width="100%" TextMode="Password"></asp:TextBox>
                <br />
                <asp:CustomValidator ID="ValidCouldNotUpdatePW" runat="server" ControlToValidate="txtChangePassword" Display="Dynamic" ErrorMessage="Could not update password! New password must be at minimum 8 characters!" ForeColor="Red" CssClass="text-center" Width="100%"></asp:CustomValidator>
            </td>
            <td style="width: 10%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%; height: 29px;">Confirm new Password:</td>
            <td style="height: 29px">
                <asp:TextBox ID="txtConfirmChangePassword" runat="server" MaxLength="50" Width="100%" TextMode="Password"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompNewPassword" runat="server" ControlToCompare="txtConfirmChangePassword" ControlToValidate="txtChangePassword" Display="Dynamic" ErrorMessage="Must match the change password field!" ForeColor="Red" Width="100%" CssClass="text-center"></asp:CompareValidator>
                <br />
            </td>
            <td style="width: 10%; height: 29px;"></td>
        </tr>
        <tr>
            <td style="width: 20%">Current Password</td>
            <td>
                <asp:TextBox ID="txtOldPassword" runat="server" MaxLength="50" Width="100%" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="reqOldPassword" runat="server" ControlToValidate="txtOldPassword" Display="Dynamic" ErrorMessage="Current Password required to make changes!!!!" ForeColor="Red" Width="100%" CssClass="text-center"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 10%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td>
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Changes" OnClick="btnConfirm_Click" Width="100%" />
            </td>
            <td style="width: 10%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
