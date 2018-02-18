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
            string sqlsel = "SELECT * FROM items WHERE id = (SELECT mainItem FROM TemplateLayout) UNION ALL SELECT * FROM items WHERE id = (SELECT firstItem FROM TemplateLayout) UNION ALL SELECT* FROM Items WHERE id = (SELECT secondItem FROM TemplateLayout) UNION ALL SELECT* FROM items WHERE id = (SELECT thirdItem FROM TemplateLayout)";

            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(sqlsel, conn);
            ds = new DataSet();
            da.Fill(ds, "MyLayoutItems");
            dt = ds.Tables["MyLayoutItems"];

            mainImage.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[0][7].ToString();

            Label1.Text = ds.Tables["MyLayoutItems"].Rows[1][1].ToString() + " " + ds.Tables["MyLayoutItems"].Rows[1][2].ToString();
            Label2.Text = ds.Tables["MyLayoutItems"].Rows[2][1].ToString() + " " + ds.Tables["MyLayoutItems"].Rows[2][2].ToString();
            Label3.Text = ds.Tables["MyLayoutItems"].Rows[3][1].ToString() + " " + ds.Tables["MyLayoutItems"].Rows[3][2].ToString();



            UpdateCat(ds);



            Image1.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[1][7].ToString();
            Image2.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[2][7].ToString();
            Image3.ImageUrl = "../Images/" + ds.Tables["MyLayoutItems"].Rows[3][7].ToString();

            
        }
        public void UpdateCat(DataSet ds) {

            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = CMS");
            SqlDataAdapter da = null;
            SqlCommand cmd;
            
            DataTable dt = null;
            //               SELECT id,name FROM Categories WHERE Categories.id in (SELECT main_Cat from Items)
            string sqlsel = "SELECT id,name FROM Categories WHERE id =(SELECT main_Cat from Items WHERE id="+ ds.Tables["MyLayoutItems"].Rows[0][0].ToString() + ") UNION ALL SELECT id,name FROM Categories WHERE id =(SELECT main_Cat from Items WHERE id=" + ds.Tables["MyLayoutItems"].Rows[1][0].ToString() + ") UNION ALL SELECT id,name FROM Categories WHERE id =(SELECT main_Cat from Items WHERE id=" + ds.Tables["MyLayoutItems"].Rows[0][0].ToString() + ")";

            Labelinfo.Text = ds.Tables["MyLayoutItems"].Rows[0][0].ToString();
            
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(sqlsel, conn);
            ds = new DataSet();
            da.Fill(ds, "MyCategories");
            dt = ds.Tables["MyCategories"];
            int numofcats = ds.Tables["MyCategories"].Rows.Count;
            
            Label1Category.Text = ds.Tables["MyCategories"].Rows[0][1].ToString();
            Label2Category.Text = ds.Tables["MyCategories"].Rows[1][1].ToString();

            if (numofcats < 3)
            {
                Label3Category.Text = ds.Tables["MyCategories"].Rows[1][1].ToString();
            }
            else
            {
                Label3Category.Text = ds.Tables["MyCategories"].Rows[2][1].ToString();
            }

            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("SELECT * FROM jokes  WHERE id =(SELECT joke FROM TemplateLayout)", conn);

            ds = new DataSet();
            da.Fill(ds, "MyJoke");
            dt = ds.Tables["MyJoke"];
            TextBox1.Text = ds.Tables["MyJoke"].Rows[0][2].ToString();
        }
    }
}