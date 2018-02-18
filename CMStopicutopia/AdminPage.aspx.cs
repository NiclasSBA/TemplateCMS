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
    public partial class AdminPage : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = CMS");
        SqlDataAdapter da = null;
        SqlCommand cmd;
        DataSet ds = null;
        DataTable dt = null;
        string sqlsel = "SELECT * FROM items";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UpdateGridview();
                UpdateTemplate();
            }
            
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)
            {
                if (TextBoxNewName.Text != "")
                {
                    // TextBoxNewName.Text.Trim
                    if (TextBoxNewName.Text.Substring(0, 1) != " ")
                    {

                        try
                        {

                            string sqlins = "insert into Items values (@name, @normalInfo, @extraInfo, @origin, @main_Cat, @managers_choice_state, @image)";
                            string filename = FileUpload.PostedFile.FileName;
                            string path = Convert.ToString(FileUpload.PostedFile.FileName);
                            string extension = Path.GetExtension(path);
                            string sqlsel = "SELECT * FROM items";


                            FileUpload.SaveAs(Server.MapPath("~/App_Data/" + TextBoxNewName.Text + extension));
                            FileUpload.SaveAs(Server.MapPath("~/Images/" + TextBoxNewName.Text + extension));
                            TextBoxNewName.Text = "";
                            statusInfo.Text = "File uploaded, brother " + FileUpload.PostedFile.FileName + FileUpload.PostedFile.ContentLength.ToString() + FileUpload.PostedFile.ContentType + DropDownListCat.SelectedValue.ToString();

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
                                newrow["origin"] = Convert.ToInt32(DropDownListOrigin.SelectedValue.ToString());
                                newrow["main_Cat"] = Convert.ToInt32(DropDownListCat.SelectedValue.ToString());

                                newrow["image"] = Convert.ToString(filename);
                                dt.Rows.Add(newrow);
                                if (CheckBoxStatus.Checked)
                                {

                                    newrow["managers_choice_state"] = 1;

                                }

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
                                UpdateGridview();
                            }
                            catch (Exception ex)
                            {

                                statusInfo.Text = ex.Message + ex.StackTrace;
                            }




                            //   GridViewShippers.DataSource = dt;
                            //  GridViewShippers.DataBind();
                        }
                        catch (Exception ex)
                        {
                            statusInfo.Text = ex.Message + ex.StackTrace;
                        }

                    }
                    else { TextBoxNewName.Text = "Intial space not allowed"; }



                }
                else
                {
                    statusInfo.Text = "New filename missing, brother";
                }
            }
            else
            {
                statusInfo.Text = "Wrong Filename, brother";
            }
        }

        public void UpdateGridview()
        {

            try
            {


                UpdateDropdown();
                UpdateDropdownCat();
                UpdateGridviewJokes();
                ItemGridView.DataBind();
            }
            catch (Exception ex)
            {
                statusInfo.Text = ex.Message + ex.StackTrace;
            }
            finally
            {
                conn.Close();   // SqlDataAdapter closes connextion by itself; but can fail in case of errors

            }
        }

        public void UpdateDropdown()
        {
            try
            {
                sqlsel = "SELECT * from Categories";

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);
                ds = new DataSet();
                da.Fill(ds, "Mycategories");

                dt = ds.Tables["Mycategories"];


                DropDownListCat.DataSource = dt;
                DropDownListCat.DataTextField = "name";
                DropDownListCat.DataValueField = "id";
                DropDownListCat.DataBind();
                DropDownListCat.Items.Insert(0, "Select a Category");

                DropDownListJokeCat.DataSource = dt;
                DropDownListJokeCat.DataTextField = "name";
                DropDownListJokeCat.DataValueField = "id";
                DropDownListJokeCat.DataBind();
                DropDownListJokeCat.Items.Insert(0, "Select a Category");

            }
            catch (Exception ex)
            {

                statusInfo.Text = ex.Message + ex.StackTrace;
            }
        }
        public void UpdateDropdownCat()
        {
            try
            {
                sqlsel = "SELECT * from Origin";

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);
                ds = new DataSet();
                da.Fill(ds, "MyOrigin");

                dt = ds.Tables["MyOrigin"];


                DropDownListOrigin.DataSource = dt;
                DropDownListOrigin.DataTextField = "name";
                DropDownListOrigin.DataValueField = "id";
                DropDownListOrigin.DataBind();
                DropDownListOrigin.Items.Insert(0, "Select an Origin");



            }
            catch (Exception ex)
            {

                statusInfo.Text = ex.Message + ex.StackTrace;
            }
        }

        public void UpdateTemplate()
        {
            try
            {
                sqlsel = "SELECT * FROM items";
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);
                ds = new DataSet();
                da.Fill(ds, "MyTemplate");

                dt = ds.Tables["MyTemplate"];


                // UNION ALL SELECT * from jokes WHERE id = (SELECT joke FROM TemplateLayout)
                DropDownListMainItem.DataSource = ds.Tables["MyTemplate"];
                DropDownListMainItem.DataTextField = "name";
                DropDownListMainItem.DataValueField = "id";
                DropDownListMainItem.DataBind();
                DropDownListMainItem.Items.Insert(0, "Select a main item");

                DropDownListFirstItem.DataSource = ds.Tables["MyTemplate"];
                DropDownListFirstItem.DataTextField = "name";
                DropDownListFirstItem.DataValueField = "id";
                DropDownListFirstItem.DataBind();
                DropDownListFirstItem.Items.Insert(0, "Select a 1st item");

                DropDownListSecondItem.DataSource = ds.Tables["MyTemplate"];
                DropDownListSecondItem.DataTextField = "name";
                DropDownListSecondItem.DataValueField = "id";
                DropDownListSecondItem.DataBind();
                DropDownListSecondItem.Items.Insert(0, "Select a 2nd item");

                DropDownListThirdItem.DataSource = ds.Tables["MyTemplate"];
                DropDownListThirdItem.DataTextField = "name";
                DropDownListThirdItem.DataValueField = "id";
                DropDownListThirdItem.DataBind();
                DropDownListThirdItem.Items.Insert(0, "Select a 3rd item");

                //Joke is placed last because its another table that called

                sqlsel = "SELECT * FROM jokes";
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);
                ds = new DataSet();
                da.Fill(ds, "MyJokes");

                dt = ds.Tables["MyJokes"];
                DropDownListJoke.DataSource = dt;
                DropDownListJoke.DataTextField = "name";
                DropDownListJoke.DataValueField = "id";
                DropDownListJoke.DataBind();
                DropDownListJoke.Items.Insert(0, "Select a Joke");

            }
            catch (Exception ex)
            {

                statusInfo.Text = ex.Message + ex.StackTrace;
            }
        }




        protected void ButtonCreateJoke_Click(object sender, EventArgs e)
        {


            try
            {



                string sqlins = "insert into Jokes values (@name, @jokeText, @link, @relatedCat)";
                string sqlsel = "SELECT * FROM Jokes";



                try
                {

                    da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand(sqlsel, conn);
                    ds = new DataSet();
                    da.Fill(ds, "MyJokes");
                    dt = ds.Tables["MyJokes"];


                    DataRow newrow = dt.NewRow();
                    newrow["name"] = TextboxJokeName.Text;
                    newrow["jokeText"] = TextboxJokeText.Text;
                    newrow["link"] = TextboxJokeLink.Text;
                    newrow["relatedCat"] = Convert.ToInt32(DropDownListJokeCat.SelectedValue.ToString());

                    dt.Rows.Add(newrow);

                    cmd = new SqlCommand(sqlins, conn);
                    cmd.Parameters.Add("@name", SqlDbType.Text, 50, "name");
                    cmd.Parameters.Add("@jokeText", SqlDbType.Text, 200, "jokeText");
                    cmd.Parameters.Add("@link", SqlDbType.Text, 200, "link");
                    cmd.Parameters.Add("@relatedCat", SqlDbType.Int, 4, "relatedCat");



                    da.InsertCommand = cmd;
                    da.Update(ds, "MyJokes");

                    UpdateGridviewJokes();

                    statusInfo.Text = "Uploaded new joke, well done!";
                    TextboxJokeName.Text = "";
                    TextboxJokeText.Text = "";
                    TextboxJokeLink.Text = "";

                }
                catch (Exception ex)
                {

                    statusInfo.Text = ex.Message + ex.StackTrace;
                }




                //   GridViewShippers.DataSource = dt;
                //  GridViewShippers.DataBind();
            }
            catch (Exception ex)
            {
                statusInfo.Text = ex.Message + ex.StackTrace;
            }

        }





        public void UpdateGridviewJokes()
        {

            try
            {


                UpdateDropdown();
                UpdateDropdownCat();
                GridViewJokes.DataBind();

            }
            catch (Exception ex)
            {
                statusInfo.Text = ex.Message + ex.StackTrace;
            }
            finally
            {
                conn.Close();   // SqlDataAdapter closes connextion by itself; but can fail in case of errors

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sqlsel = "SELECT * FROM TemplateLayout";
            
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(sqlsel, conn);
            ds = new DataSet();
            da.Fill(ds, "MyTemplatus");
            dt = ds.Tables["MyTemplatus"];
            
            

            ds.Tables["MyTemplatus"].Rows[0]["mainItem"] = Convert.ToInt32(DropDownListMainItem.SelectedValue);
            ds.Tables["MyTemplatus"].Rows[0]["firstItem"] = Convert.ToInt32(DropDownListFirstItem.SelectedValue.ToString());
            ds.Tables["MyTemplatus"].Rows[0]["secondItem"] = Convert.ToInt32(DropDownListSecondItem.SelectedValue.ToString());
            ds.Tables["MyTemplatus"].Rows[0]["thirdItem"] = Convert.ToInt32(DropDownListSecondItem.SelectedValue.ToString());
            ds.Tables["MyTemplatus"].Rows[0]["joke"] = Convert.ToInt32(DropDownListJoke.SelectedValue.ToString());


            string sqlupd = "UPDATE TemplateLayout SET mainItem ="+ ds.Tables["MyTemplatus"].Rows[0]["mainItem"]+", firstItem ="+ ds.Tables["MyTemplatus"].Rows[0]["firstItem"]+", secondItem="+ ds.Tables["MyTemplatus"].Rows[0]["secondItem"]+", thirdItem="+ ds.Tables["MyTemplatus"].Rows[0]["thirdItem"]+", joke="+ ds.Tables["MyTemplatus"].Rows[0]["joke"]+"WHERE id = 1";



            da.UpdateCommand = new SqlCommand(sqlupd, conn);
            da.Update(ds, "MyTemplatus");







        }
    } }