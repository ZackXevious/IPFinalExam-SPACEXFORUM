<%@ Page Title="Login" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SpaceXForum.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <table style="width: 100%">
                    <tr>
                      <th style="width: 15%">&nbsp;</th>
                      <th colspan="2">
                          <asp:Label ID="lblLoginTitle" runat="server" CssClass="text-center" Font-Size="X-Large" Text="Login" Width="100%"></asp:Label>
                        </th>
                      <th style="width: 15%">
                          &nbsp;</th>
                    </tr>
                    <tr>
                      <th style="width: 15%">&nbsp;</th>
                      <th style="width: 37.5%">
                          <asp:Label ID="lblUsername" runat="server" CssClass="text-right" Text="Username:" Width="100%"></asp:Label>
                        </th>
                      <th>
                          <asp:TextBox ID="txtUser" runat="server" Width="100%" ValidationGroup="login"></asp:TextBox>
                          <br />
                          <asp:RequiredFieldValidator ID="validUsername" runat="server" ControlToValidate="txtUser" CssClass="text-center" Display="Dynamic" ErrorMessage="*Please enter your username!*" Font-Size="Small" ForeColor="Red" Width="100%"></asp:RequiredFieldValidator>
                        </th>
                      <th style="width: 15%">
                          &nbsp;</th>
                    </tr>
                    <tr>
                      <th style="width: 15%">&nbsp;</th>
                      <th style="width: 37.5%">
                          <asp:Label ID="lblPassword" runat="server" CssClass="text-right" Text="Password:" Width="100%"></asp:Label>
                        </th>
                      <td>
                          <asp:TextBox ID="txtPass" runat="server" Width="100%" ValidationGroup="login"></asp:TextBox>
                          <br />
                          <asp:RequiredFieldValidator ID="ValidatePassword" runat="server" ControlToValidate="txtPass" CssClass="text-center" Display="Dynamic" ErrorMessage="*Please enter your password!*" Font-Size="Small" ForeColor="Red" Width="100%"></asp:RequiredFieldValidator>
                      </td>
                      <td style="width: 15%">
                          &nbsp;</td>
                    </tr>
                    <tr>
                      <th style="width: 15%">&nbsp;</th>
                      <th colspan="2">
                          <asp:Label ID="lblLoginFailed" runat="server" CssClass="text-center" Font-Size="Small" ForeColor="Red" Text="Invalid Username or Password!!" Width="100%"></asp:Label>
                        </th>
                      <td style="width: 15%">
                          &nbsp;</td>
                    </tr>
                   <tr style="text-align: center">
                       <td style="width: 15%">
                           &nbsp;</td>
                       <td style="width: 37.5%">
                           <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" Width="100%" CausesValidation="False" />
                       </td>
                       <td>
                           <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="100%" ValidationGroup="login" />
                       </td>
                       <td style="width: 15%">
                           &nbsp;</td>
                   </tr>
        </table>
</asp:Content>