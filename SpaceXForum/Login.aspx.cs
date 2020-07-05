using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaceXForum
{
    public partial class Login : System.Web.UI.Page
    {
        SqlDataSource SqlDataSourceMaster = new SqlDataSource();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
            this.lblLoginFailed.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText = "SELECT UserID from [User] Where UserName = '" + user + "' AND Password = '" + pass + "'";
            cmd1.Connection = db;
            
            db.Open();
            try {//Check to see if the username exists in the database
                
                if (cmd1.ExecuteScalar() != null) {//Try login, see if it's good
                    int UserID = (int)cmd1.ExecuteScalar();
                    Session["UserID"] = UserID;
                    this.lblLoginFailed.Visible = false;
                    Response.Redirect("Content.aspx");
                } else {
                    this.lblLoginFailed.Visible = true;
                    this.lblLoginFailed.Text = "Incorrect Username or Password!";
                }

            } catch {
                lblLoginFailed.Visible = true;
                lblLoginFailed.Text = "An Error Occured!";
            } finally {
                db.Close();
            }            
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            Session["TempUsername"] = user;
            Session["TempPassword"] = pass;
            //Send to register page
            Response.Redirect("Registration.aspx");
        }
    }
}