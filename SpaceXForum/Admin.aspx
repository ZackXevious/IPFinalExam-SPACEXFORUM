<%@ Page Title="Admin Page" Language="C#" UnobtrusiveValidationMode="none" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SpaceXForum.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div id="Title">
		<asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" Text="All Users:"></asp:Label>
	</div>
	<div id="Table">

		<asp:GridView ID="UserTable" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="UserTableSource" ShowFooter="True" AllowPaging="True" AllowSorting="True" Width="100%">
			<AlternatingRowStyle BackColor="#DCDCDC" />
			<Columns>
				<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
				<asp:TemplateField HeaderText="UserID" InsertVisible="False" SortExpression="UserID">
					<EditItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<asp:LinkButton ValidationGroup="INSERT" OnClick="LbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="UserName" SortExpression="UserName">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvEditUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Password" SortExpression="Password">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Description" SortExpression="Description">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvEditDescription" runat="server" ErrorMessage="Description is required" ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertDescription" runat="server" ErrorMessage="Description is required" ControlToValidate="txtDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Email" SortExpression="Email">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="TextBox4" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
						<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="IsAdmin" SortExpression="IsAdmin">
					<EditItemTemplate>
						<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' />
					</EditItemTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' Enabled="false" />
					</ItemTemplate>
					<FooterTemplate>
						<asp:CheckBox ID="ckbIsAdmin" runat="server" />
					</FooterTemplate>
				</asp:TemplateField>
			</Columns>
			<FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
			<HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<RowStyle BackColor="#EEEEEE" ForeColor="Black" />
			<SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
			<SortedAscendingCellStyle BackColor="#F1F1F1" />
			<SortedAscendingHeaderStyle BackColor="#0000A9" />
			<SortedDescendingCellStyle BackColor="#CAC9C9" />
			<SortedDescendingHeaderStyle BackColor="#000065" />
		</asp:GridView>
		<br />
		<asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" runat="server" ForeColor="#993333" />
		<asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="#993333" />
		<asp:GridView ID="ContentTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ContentID" DataSourceID="ContentTableSource" Width="100%">
            <Columns>
                <asp:CommandField ShowDeleteButton="True">
                <HeaderStyle Width="10%" />
                </asp:CommandField>
                <asp:BoundField DataField="ContentID" HeaderText="ContentID" InsertVisible="False" ReadOnly="True" SortExpression="ContentID">
                <HeaderStyle Width="5%" />
                </asp:BoundField>
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID">
                <HeaderStyle Width="5%" />
                </asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                <HeaderStyle Width="20%" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="ContentText" HeaderText="ContentText" SortExpression="ContentText" />
            </Columns>
        </asp:GridView>
        <br />
		<br />
		<asp:SqlDataSource ID="UserTableSource" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceXDatabaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" OnSelecting="SqlDataSource1_Selecting">
		</asp:SqlDataSource>

	    <asp:SqlDataSource ID="ContentTableSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:SpaceXDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Content] WHERE [ContentID] = @original_ContentID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND [Date] = @original_Date AND [Title] = @original_Title AND [ContentText] = @original_ContentText" InsertCommand="INSERT INTO [Content] ([UserID], [Date], [Title], [ContentText]) VALUES (@UserID, @Date, @Title, @ContentText)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Content]" UpdateCommand="UPDATE [Content] SET [UserID] = @UserID, [Date] = @Date, [Title] = @Title, [ContentText] = @ContentText WHERE [ContentID] = @original_ContentID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND [Date] = @original_Date AND [Title] = @original_Title AND [ContentText] = @original_ContentText">
            <DeleteParameters>
                <asp:Parameter Name="original_ContentID" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Date" Type="DateTime" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_ContentText" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="ContentText" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="ContentText" Type="String" />
                <asp:Parameter Name="original_ContentID" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Date" Type="DateTime" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_ContentText" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

	</div>
</asp:Content>