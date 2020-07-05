using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace SpaceXForum
{
    public partial class ContentCreation : System.Web.UI.Page{
        int UserID;
        SqlDataSource SqlDataSourceMaster = new SqlDataSource();
        protected void Page_Load(object sender, EventArgs e){
            if (Session["UserID"]!=null) {
                SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
                this.UserID = (int)Session["UserID"];
            } else {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void btnPost_Click(object sender, EventArgs e){
            
            SqlConnection db = new SqlConnection(SqlDataSourceMaster.ConnectionString);
            try{
                this.PostError.IsValid = true;
                SqlCommand cmd1 = new SqlCommand();
                
                cmd1.CommandType = System.Data.CommandType.Text;
                cmd1.CommandText = "INSERT INTO [Content] (UserID, Date, Title, ContentText)" +
                    "VALUES(@uID, @date, @title, @content)";

                cmd1.Parameters.AddWithValue("@uID", UserID);
                cmd1.Parameters.AddWithValue("@date", DateTime.Now);
                cmd1.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd1.Parameters.AddWithValue("@content", txtDesc.Text);
                cmd1.Connection = db;
                db.Open();

                cmd1.ExecuteNonQuery();
            }
            catch{
                this.PostError.IsValid = false;
            }
            finally
            {
                db.Close();
            }
        }
    }
}