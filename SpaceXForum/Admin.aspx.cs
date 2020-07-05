using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaceXForum
{
	public partial class Admin : System.Web.UI.Page
	{
		SqlDataSource SqlDataSourceMaster = new SqlDataSource();
		int UserID;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["UserID"]==null) {
				Response.Redirect("Login.aspx");
			} else {
				//Store the userID
				UserID = (int)Session["UserID"];
				SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("SqlDataSource1");
				SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
				SqlCommand cmd = new SqlCommand();
				cmd.CommandType = System.Data.CommandType.Text;
				cmd.Connection = db;
				db.Open();
				try {
					cmd.CommandText = "SELECT IsAdmin from [User] Where  UserID= '" + this.UserID + "'";

					if (!(bool)cmd.ExecuteScalar()) {
						Response.Redirect("Login.aspx");
					} else {
					}
				} catch {
					Response.Redirect("Login.aspx");
				}
				db.Close();
			}
			
		}

		protected void LbInsert_Click(object sender, EventArgs e)
		{
			UserTableSource.InsertParameters["UserName"].DefaultValue = ((TextBox)UserTable.FooterRow.FindControl("txtUsername")).Text;
			UserTableSource.InsertParameters["Password"].DefaultValue = ((TextBox)UserTable.FooterRow.FindControl("txtPassword")).Text;
			UserTableSource.InsertParameters["Email"].DefaultValue = ((TextBox)UserTable.FooterRow.FindControl("txtEmail")).Text;
			UserTableSource.InsertParameters["Description"].DefaultValue = ((TextBox)UserTable.FooterRow.FindControl("txtDescription")).Text;
			if (((CheckBox)UserTable.FooterRow.FindControl("ckbIsAdmin")).Checked) {
				UserTableSource.InsertParameters["IsAdmin"].DefaultValue = "True";
			} else {
				UserTableSource.InsertParameters["IsAdmin"].DefaultValue = "False";
			}

			UserTableSource.Insert();
		}

		protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e) {

		}
	}
}