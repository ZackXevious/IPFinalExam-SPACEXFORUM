using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SpaceXForum
{
    public partial class Content : System.Web.UI.Page
    {
        SqlDataSource SqlDataSourceMaster = new SqlDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSourceMaster = (SqlDataSource)this.Master.FindControl("MasterUserTableSource");
            lblError.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e) {

            string searchText = this.txtSearch.Text;
            SqlConnection db = new SqlConnection(this.MainViewDataSource.ConnectionString);
            SqlCommand cmd1 = new SqlCommand();
            SqlCommand refill = new SqlCommand(); //Command to populate the database

            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText = "SELECT * from [MainView] Where Title = '" + searchText + "' OR ContentText LIKE '%" + searchText + "%'";
            cmd1.Connection = db;

            refill.CommandType = CommandType.Text;
            refill.CommandText = "SELECT [Title], [ContentText], [Date], [UserName] FROM [MainView]";

            postGrid.DataSourceID = null;
            SqlDataAdapter adapt;
            DataTable dt;

            db.Open();
            try {
                if (cmd1.ExecuteScalar() != null) {//Try search, see if it pulls stuff up
                    adapt = new SqlDataAdapter(cmd1);
                    dt = new DataTable();
                    adapt.Fill(dt);
                    postGrid.DataSource = dt;
                    postGrid.DataBind();
                } else {
                    lblError.Text = "No search results found";
                    lblError.Visible = true;
                    adapt = new SqlDataAdapter(refill);
                    dt = new DataTable();
                    adapt.Fill(dt);
                    postGrid.DataSource = dt;
                    postGrid.DataBind();
                }

            } catch {
            } finally {
                db.Close();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e) {

        }
    }
}