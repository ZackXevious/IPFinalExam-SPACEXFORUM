using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaceXForum {
    public partial class EditUser : System.Web.UI.Page {
        SqlDataSource SqlDataSourceMaster = new SqlDataSource();
        int UserID;
        protected void Page_Load(object sender, EventArgs e) {

            if (Session["UserID"]==null) {//If the user hasn't logged in
                Response.Redirect("Login.aspx");
            } else {//If the user has logged in

                this.UserID = (int)Session["UserID"];//Hold on to the user ID it's important
                
                if (!IsPostBack) {
                    SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
                    this.updateText();
                }
                
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e) {
            try {
                SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
                SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = db;
                db.Open();
                cmd.CommandText = "SELECT * from [User] Where UserID = '" + this.UserID + "' AND Password = '" + this.txtOldPassword.Text + "'";
                if (cmd.ExecuteScalar()==null) {
                    this.txtEmail.Text = "IncorrectPassword!!";
                } else {
                    string newEmail = this.txtEmail.Text;
                    cmd.CommandText = "UPDATE [User] SET [Email] = @email, [Description] = @description WHERE UserID = @UserID";
                    cmd.Parameters.AddWithValue("@UserID", this.UserID);
                    cmd.Parameters.AddWithValue("@email",this.txtEmail.Text);
                    cmd.Parameters.AddWithValue("@description", this.txtAboutMe.Text);
                    cmd.ExecuteNonQuery();

                    if (this.txtChangePassword.Text.Length>7) {
                        this.ValidCouldNotUpdatePW.IsValid = true;
                        cmd.CommandText = "UPDATE [User] SET [Password] = @password WHERE UserID = @UserID";
                        cmd.Parameters.AddWithValue("@password", this.txtChangePassword.Text);
                        //cmd.Parameters.AddWithValue("@UserID", this.UserID);
                        cmd.ExecuteNonQuery();
                    } else if (this.txtChangePassword.Text.Length > 0) {
                        this.ValidCouldNotUpdatePW.IsValid = false;
                    }
                    db.Close();
                    this.updateText();
                    
                }
                
            } catch (Exception error){
                this.txtEmail.Text = error.Message;
            }
            
        }
        private void updateText() {
            
            SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            db.Open();



            //Fetch the user name
            try {
                cmd.CommandText = "SELECT UserName from [User] Where UserID= '" + this.UserID + "'";
                this.LBLUsername.Text = (string)cmd.ExecuteScalar();
            } catch {
                this.LBLUsername.Text = "There was an error retrieving the username";
            }


            //Fetch the admin type
            try {
                cmd.CommandText = "SELECT IsAdmin from [User] Where  UserID= '" + this.UserID + "'";

                if ((bool)cmd.ExecuteScalar()) {
                    this.LblUserType.Text = "Administrator";
                } else {
                    this.LblUserType.Text = "User";
                }
            } catch {
                this.LblUserType.Text = "There was an error retrieving the user type";
            }


            //Fetch the userdescription
            try {
                this.txtAboutMe.Enabled = true;
                cmd.CommandText = "SELECT Description from [User] Where UserID= '" + this.UserID + "'";
                this.txtAboutMe.Text = (string)cmd.ExecuteScalar();
            } catch {
                this.txtAboutMe.Text = "There was an error retrieving the user description";
                this.txtAboutMe.Enabled = false;
            }


            //Fetch the email
            try {
                this.txtEmail.Enabled = true;
                cmd.CommandText = "SELECT Email from [User] Where UserID= '" + this.UserID + "'";
                this.txtEmail.Text = (string)cmd.ExecuteScalar();
            } catch {
                this.txtEmail.Text = "There was an error retrieving the email";
                this.txtEmail.Enabled = false;
            }


            db.Close();
        }
    }
}