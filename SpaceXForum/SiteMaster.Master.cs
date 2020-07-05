using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaceXForum {
    public partial class SiteMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            this.AdminButton.Visible = false;
            this.AdminButton.Enabled = false;
            if (Session["UserID"] != null) {
                SqlConnection db = new SqlConnection(this.MasterUserTableSource.ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = db;
                db.Open();

                int UserID = (int)Session["UserID"];
                //Fetch the user name
                try {
                    cmd.CommandText = "SELECT UserName from [User] Where UserID= '" + UserID + "'";
                    this.isLoggedIn.Text = "Welcome, " + (string)cmd.ExecuteScalar();
                    this.isLoggedIn.Visible = true;
                    UserID = (int)Session["UserID"];
                    cmd.CommandText = "SELECT IsAdmin from [User] Where  UserID= '" + UserID + "'";

                    if ((bool)cmd.ExecuteScalar()) {
                        this.AdminButton.Visible = true;
                        this.AdminButton.Enabled = true;
                    } else {
                        
                    }
                    db.Close();

                } catch {
                    this.isLoggedIn.Text = "There was an error retrieving the username";
                }
                this.LoginUserButton.Text = "User Page";
                db.Close();
            } else {
                this.isLoggedIn.Text = "";
                this.isLoggedIn.Visible = false;
                this.LoginUserButton.Text = "Login/Register";
            }
        }

        protected void LoginUserButton_Click(object sender, EventArgs e) {
            if(Session["UserID"] != null) {
                Response.Redirect("EditUser.aspx");
            } else {
                Response.Redirect("Login.aspx");
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e) {
            Response.Redirect("Content.aspx");
        }

        protected void PostButton_Click(object sender, EventArgs e) {
            Response.Redirect("ContentCreation.aspx");
        }

        protected void AdminButton_Click(object sender, EventArgs e) {
            SqlConnection db = new SqlConnection(this.MasterUserTableSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            db.Open();

            int UserID = (int)Session["UserID"];
            //Fetch the user name
            try {
                cmd.CommandText = "SELECT IsAdmin from [User] Where  UserID= '" + UserID + "'";

                if ((bool)cmd.ExecuteScalar()) {
                    Response.Redirect("Admin.aspx");
                } else {
                    this.AdminButton.Visible = false;
                    this.AdminButton.Enabled = false;
                }
            } catch {
                this.AdminButton.Visible = false;
                this.AdminButton.Enabled = false;
            }
            db.Close();
        }

        protected void ForumTopicButton_Click(object sender, EventArgs e) {

        }
    }
}