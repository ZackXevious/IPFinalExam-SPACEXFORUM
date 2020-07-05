<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="none" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SpaceXForum.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
	<body>
    <div id="Registration_Box" class="Reg-center">
	    <table style="width:100%;">
            <tr>
                <td style="width: 15%">&nbsp;</td>
                <td colspan="3">
	    <asp:Label ID="lblTitle" runat="server" Text="New User Registration" Font-Bold="True" Font-Names="Times New Roman" Font-Size="X-Large" Font-Underline="True" CssClass="text-center" Width="100%"></asp:Label>
                </td>
                <td style="width: 20%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 15%">&nbsp;</td>
                <td colspan="3">
        <table style="width: 100%">
            <tr>
                <td style="width: 30%">User Name:</td>
                <td>
					<asp:TextBox ID="txtUsername" runat="server" Width="100%"></asp:TextBox>
                    <br />
                    <asp:CustomValidator ID="usernameValidator" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="CustomValidator" ForeColor="Red" Width="100%" ValidateRequestMode="Enabled">*This username is already in use, pick a new one!</asp:CustomValidator>
                    <br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter username" ForeColor="Red" Display="Dynamic" Width="100%">*Please enter username</asp:RequiredFieldValidator>
				</td>
            </tr>
            <tr>
                <td style="width: 30%; height: 53px;">Email: <td style="height: 53px">

                	<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="100%"></asp:TextBox>
					<br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter valid email" ForeColor="Red" Width="100%">*Please enter valid email</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="width: 30%">Password:</td>
                <td>
					<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                    <br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" ForeColor="Red">*Please enter password</asp:RequiredFieldValidator>
				</td>
            </tr>
            <tr>
                <td style="width: 30%">Confirm Password:</td>
                <td>
					<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                    <br />
					<asp:CompareValidator ID="ValidPWMatch" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords don't match" ForeColor="Red" Display="Dynamic" Width="100%">*The Passwords don&#39;t match</asp:CompareValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="validConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Please enter password again" ForeColor="Red" Width="100%">*Enter password again</asp:RequiredFieldValidator>
				</td>
            </tr>
            <tr>
                <td style="width: 30%">Bio(Optional):</td>
                <td>
					<asp:TextBox ID="txtBio" runat="server" Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>
                </td>
                <td style="width: 20%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 15%">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
                <td>
			<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Width="100%" />
                </td>
                <td style="width: 20%">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="auto-style1">
        </div>
    </div>
    </body>
</asp:Content>