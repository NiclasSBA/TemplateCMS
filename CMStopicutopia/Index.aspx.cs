using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;


namespace CMStopicutopia
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = CMS");
        SqlDataAdapter da = null;
        SqlCommand cmd;
        DataSet ds = null;
        DataTable dt = null;
        string sqlsel = "SELECT * FROM items";
       


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonChangeImage_Click(object sender, EventArgs e)
        {
            if (Image1.ImageUrl == "~/Images/download.jpg")
            {
                Image1.ImageUrl = "~/Images/catsuperior.jpg";
            }
            else if (Image1.ImageUrl == "~/Images/catsuperior.jpg")
            {
                Image1.ImageUrl = "~/Images/download.jpg";
            }
            else {

                Image1.ImageUrl = "~/Images/download.jpg";
            }
        }



        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxDate.Text = Calendar.SelectedDate.ToShortDateString();
            TextBoxDay.Text = Calendar.SelectedDate.DayOfWeek.ToString();
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)
            {
                if (TextBoxNewName.Text != "")
                {
                   // TextBoxNewName.Text.Trim
                        if(TextBoxNewName.Text.Substring(0,1) != " ")
                    {

                        try
                        {

                            string sqlins = "insert into Items values ('',@name, @normalInfo, @extraInfo, @origin, @main_Cat, @managers_choice_state, @image)";
                            string filename = FileUpload.PostedFile.FileName;
                            string path = Convert.ToString(FileUpload.PostedFile.FileName);
                            string extension = Path.GetExtension(path);



                            FileUpload.SaveAs(Server.MapPath("~/App_Data/" + TextBoxNewName.Text + extension));
                            TextBoxNewName.Text = "";
                            TextBoxInfo.Text = "File uploaded, brother " + FileUpload.PostedFile.FileName + FileUpload.PostedFile.ContentLength.ToString() + FileUpload.PostedFile.ContentType;

                            try
                            {

                                da = new SqlDataAdapter();
                                da.SelectCommand = new SqlCommand(sqlsel, conn);
                                ds = new DataSet();
                                da.Fill(ds, "MyItems");
                                dt = ds.Tables["MyItems"];



                                DataRow newrow = dt.NewRow();
                                newrow["name"] = TextboxName.Text;
                                newrow["normalInfo"] = TextboxNormalInfo.Text;
                                newrow["extraInfo"] = TextboxExtraInfo.Text;
                                newrow["origin"] = Convert.ToInt32(TextboxOrigin.Text);
                                newrow["main_Cat"] = Convert.ToInt32(TextboxMainCat.Text);
                                newrow["managers_choice_state"] = Convert.ToInt32(TextboxManagerChoice.Text);
                                newrow["image"] = Convert.ToString(filename);
                                dt.Rows.Add(newrow);


                                cmd = new SqlCommand(sqlins, conn);
                                cmd.Parameters.Add("@name", SqlDbType.Text, 50, "name");
                                cmd.Parameters.Add("@normalInfo", SqlDbType.Text, 200, "normalInfo");
                                cmd.Parameters.Add("@extraInfo", SqlDbType.Text, 200, "extraInfo");
                                cmd.Parameters.Add("@origin", SqlDbType.Int, 4, "origin");
                                cmd.Parameters.Add("@main_Cat", SqlDbType.Int, 4, "main_Cat");
                                cmd.Parameters.Add("@managers_choice_state", SqlDbType.Int, 4, "managers_choice_state");
                                cmd.Parameters.Add("@image", SqlDbType.Text, 200, "image");

                                da.InsertCommand = cmd;
                                da.Update(ds, "MyItems");
                            }
                            catch (Exception ex) {

                                statusInfo.Text = ex.Message + ex.StackTrace;
                            }




                            //   GridViewShippers.DataSource = dt;
                            //  GridViewShippers.DataBind();
                        }
                        catch(Exception ex) {
                            statusInfo.Text = ex.Message + ex.StackTrace;
                        }
                        
                    }
                    else { TextBoxNewName.Text = "Intial space not allowed"; }


                    
                }
                else
                {
                    TextBoxInfo.Text = "New filename missing, brother";
                }
            }
            else {
                TextBoxInfo.Text = "Wrong Filename, brother";
            }
            }
    }
}