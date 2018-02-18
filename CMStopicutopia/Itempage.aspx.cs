using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
namespace CMStopicutopia
{
    public partial class Itempage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = CMS");
            SqlDataAdapter da = null;
            SqlCommand cmd;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM items WHERE id = (SELECT mainItem FROM TemplateLayout)";

            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(sqlsel, conn);
            ds = new DataSet();
            da.Fill(ds, "MyLayout");
            dt = ds.Tables["MyLayout"];

            TextBox1.Text = ds.Tables["MyLayout"].Rows[0][0].ToString();
            LabelMain.Text = ds.Tables["MyLayout"].Rows[0][1].ToString();

            UpdateItems();
            
        }

        public void UpdateItems()
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = CMS");
            SqlDataAdapter da = null;
            SqlCommand cmd;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM items WHERE id = (SELECT firstItem FROM TemplateLayout) UNION ALL SELECT* FROM Items WHERE id = (SELECT secondItem FROM TemplateLayout) UNION ALL SELECT* FROM items WHERE id = (SELECT thirdItem FROM TemplateLayout)";

            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(sqlsel, conn);
            ds = new DataSet();
            da.Fill(ds, "MyLayoutItems");
            dt = ds.Tables["MyLayoutItems"];

            Label1.Text = ds.Tables["MyLayoutItems"].Rows[0][1].ToString();
            Label2.Text = ds.Tables["MyLayoutItems"].Rows[1][1].ToString();
            Label3.Text = ds.Tables["MyLayoutItems"].Rows[2][1].ToString();
            Image1.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[0][7].ToString();
            Image2.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[1][7].ToString();
            Image3.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[2][7].ToString();
        }
    }
}