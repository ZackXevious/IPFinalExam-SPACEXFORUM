using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaceXForum
{
	public partial class Registration : System.Web.UI.Page
	{
		SqlDataSource SqlDataSourceMaster = new SqlDataSource();
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
			if (Session["TempUsername"] !=null && Session["TempPassword"] !=null) {
				this.txtUsername.Text = (string)Session["TempUsername"];
				this.txtPassword.Text = (string)Session["TempPassword"];
			}
		}

		protected void btnSubmit_Click(object sender, EventArgs e){
			SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = System.Data.CommandType.Text;
			cmd.Connection = db;
			db.Open();
			
			
			//Check to see if the username is already in use
			try {
				cmd.CommandText = "Select COUNT(*) From [User] Where UserName = '" + txtUsername.Text + "'";
				int numofResults = (int)cmd.ExecuteScalar();
				if (numofResults > 0) {
					//Flag that username is already in use, and tell the user to come up with a new one.
					this.usernameValidator.IsValid = false;
				} else {
					this.usernameValidator.IsValid = true;
					cmd.CommandText = "INSERT INTO [User] (UserName, Password, Description, Email, IsAdmin)" +
					"VALUES(" +
					"'" + this.txtUsername.Text + "'," +
					" '" + this.txtPassword.Text + "'," +
					" '" + this.txtBio.Text + "'," +
					" '" + this.txtEmail.Text + "'," +
					" 'False')";
					cmd.ExecuteNonQuery();
					//Get the UserID for the session
					cmd.CommandText = "SELECT UserID from [User] Where UserName = '" + txtUsername.Text + "' AND Password = '" + this.txtPassword.Text + "'";
					Session["UserID"] = (int)cmd.ExecuteScalar();
					db.Close();
					Response.Redirect("Content.aspx");//Redirect back to home
				}
				
			} catch {//Something broke along the way
				this.lblTitle.Text = "There was an error!!!!";
			}
			db.Close();
		}

	}
}