using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_SCM_NoticeAddControl : System.Web.UI.UserControl
{
    #region [1]Event Handler
    //Load
    protected void Page_Load(object sender, EventArgs e)
    {
        //[1]스크립트
        string strAlert = @"<script>alert('관리자만 접근가능합니다.');location.href='../Default.aspx';</script>";

        //[2]로그인 체크
        if (!Page.User.Identity.IsAuthenticated)
        {
            Response.Write(strAlert);
        }
        else
        {
            //[3]관리자만 접근가능
            if (Page.User.Identity.Name.ToLower() == "admin")
            {
                //
            }
            else
            {
                Response.Write(strAlert);
            }
        }
    }
    //Submit
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {        

        //[1]임시변수
        string strTitle = "";
        string strContent = "";
string strps = ""; 

string strts1 = "";
string strts2 = "";
string strts3 = "";
string strts4 = "";
string strts5 = "";
string strts6 = "";
string strts7 = "";
string strts8 = "";



string strcode1 = ""; 
string strcs1 = "";
string strlink1 = "";
string strDead1 = "";
string strProgress1 = "";
string strcorp1 = ""; 
string strlang1 = "";
string strsec1 = "";
string strtech1 = "";
    string UpfileName = "";	

    string dbFileName = string.Empty;
     

         
	
       
                                                                        
        string path="d:\\_Mobile_System\\joblink\\fileUpload\\Notice\\";        


        string strAlert = @"<script>alert('입력했습니다.');location.href='SCM_NoticeList.aspx';</script>";


if ((FileUpload1.PostedFile.FileName != null) && (FileUpload1.PostedFile.ContentLength > 0))
        {
            UpfileName = FileUpload1.PostedFile.FileName;
    
            string SaveLocation = Server.MapPath("~\\fileUpload\\Notice\\") + UpfileName;
            dbFileName = UpfileName;
            FileInfo fInfo = new FileInfo(SaveLocation);
            string newUpFile = string.Empty;
            if (!fInfo.Exists)
            {
                int fIndex = 0;
                string fExtension = fInfo.Extension;
                string fRealName = UpfileName.Replace(fExtension, "");

                do
                {
                    fIndex++;
                    dbFileName = fRealName + "" + fIndex.ToString() + fExtension;
		    SaveLocation =Server.MapPath("~\\fileUpload\\Notice\\")+dbFileName ;
                    fInfo = new FileInfo(SaveLocation)  ;                                              
                } while (fInfo.Exists);                                                                                                        
             }
                  FileUpload1.SaveAs(SaveLocation);                                                                                                          
        }


      

	 
        
        try
        {
            //[2]변환
            strTitle = txtTitle.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
 		strContent = txtContent.Text
		 .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   
		
		
strps = txtps.Text; 	
strcode1 = txtcode1.Text; 		
strts1 = txtts1.Text;
             

strcs1 = txtcs1.Text;
strlink1 = txtlink1.Text;
strDead1 = txtDead1.Text;
strProgress1 = txtProgress1.Text;
strcorp1 = txtcorp1.Text; 
strlang1 = txtlang1.Text;
strsec1 = txtsec1.Text;
strtech1 = txttech1.Text;
 











if (strts1 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}
if (strts2 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}
if (strts3 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}
if (strts4 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}
if (strts5 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}

if (strts6 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}


if (strts7 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}


if (strts8 !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
					cmd.Parameters.AddWithValue("@upFileName", dbFileName);
					cmd.Parameters.AddWithValue("@ps", strps);
					cmd.Parameters.AddWithValue("@lang1", strlang1);
					cmd.Parameters.AddWithValue("@ts1", strts1);
					cmd.Parameters.AddWithValue("@cs1", strcs1);
					cmd.Parameters.AddWithValue("@link1", strlink1);
					cmd.Parameters.AddWithValue("@Dead1", strDead1);
					cmd.Parameters.AddWithValue("@Progress1", strProgress1);
					cmd.Parameters.AddWithValue("@corp1", strcorp1); 
					cmd.Parameters.AddWithValue("@sec1", strsec1);
					cmd.Parameters.AddWithValue("@tech1", strtech1);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}




























   /*      
                using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Notice", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", strTitle);
                    cmd.Parameters.AddWithValue("@Content", strContent);
                    cmd.Parameters.AddWithValue("@code1", strcode1);	
                    cmd.Parameters.AddWithValue("@code2", strcode2);	
                    cmd.Parameters.AddWithValue("@code3", strcode3);	
                    cmd.Parameters.AddWithValue("@code4", strcode4);	
                    cmd.Parameters.AddWithValue("@code5", strcode5);						
					
					
cmd.Parameters.AddWithValue("@upFileName", dbFileName);
cmd.Parameters.AddWithValue("@upFileName2", dbFileName2);
cmd.Parameters.AddWithValue("@upFileName3", dbFileName3);
cmd.Parameters.AddWithValue("@upFileName4", dbFileName4);
cmd.Parameters.AddWithValue("@upFileName5", dbFileName5);
                     
		     

cmd.Parameters.AddWithValue("@ps", strps);
cmd.Parameters.AddWithValue("@ts1", strts1);
cmd.Parameters.AddWithValue("@ts2", strts2);
cmd.Parameters.AddWithValue("@ts3", strts3);
cmd.Parameters.AddWithValue("@ts4", strts4);
cmd.Parameters.AddWithValue("@ts5", strts5);

cmd.Parameters.AddWithValue("@cs1", strcs1);
cmd.Parameters.AddWithValue("@cs2", strcs2);
cmd.Parameters.AddWithValue("@cs3", strcs3);
cmd.Parameters.AddWithValue("@cs4", strcs4);
cmd.Parameters.AddWithValue("@cs5", strcs5);


cmd.Parameters.AddWithValue("@link1", strlink1);
cmd.Parameters.AddWithValue("@link2", strlink2);
cmd.Parameters.AddWithValue("@link3", strlink3);
cmd.Parameters.AddWithValue("@link4", strlink4);
cmd.Parameters.AddWithValue("@link5", strlink5);

cmd.Parameters.AddWithValue("@Dead1", strDead1);
cmd.Parameters.AddWithValue("@Dead2", strDead2);
cmd.Parameters.AddWithValue("@Dead3", strDead3);
cmd.Parameters.AddWithValue("@Dead4", strDead4);
cmd.Parameters.AddWithValue("@Dead5", strDead5);

cmd.Parameters.AddWithValue("@Progress1", strProgress1);
cmd.Parameters.AddWithValue("@Progress2", strProgress2);
cmd.Parameters.AddWithValue("@Progress3", strProgress3);
cmd.Parameters.AddWithValue("@Progress4", strProgress4);
cmd.Parameters.AddWithValue("@Progress5", strProgress5);

cmd.Parameters.AddWithValue("@corp1", strcorp1); 
cmd.Parameters.AddWithValue("@corp2", strcorp2);
cmd.Parameters.AddWithValue("@corp3", strcorp3);
cmd.Parameters.AddWithValue("@corp4", strcorp4);
cmd.Parameters.AddWithValue("@corp5", strcorp5); 

con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
         */ 

            //[4]
            Response.Write(strAlert);
        }
        catch (Exception err)
        {
            //[5]Exception
            Response.Write(err.Source + " : " + err.Message);
        }
    }
    //Cancel
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SCM_NoticeList.aspx");
    } 
    #endregion
}
