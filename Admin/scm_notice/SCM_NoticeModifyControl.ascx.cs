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
using Microsoft.ApplicationBlocks.Data;
using System.IO;

public partial class Admin_SCM_NoticeModifyControl : System.Web.UI.UserControl
{
   #region [1]Event Handler
    //[1]그리드..
    protected void Page_Load(object sender, EventArgs e)
    {
        //[1]스크립트
        string strAlert = @"<script>location.href='../Default.aspx';</script>";
        
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
                if (!IsPostBack)
                {
                    DisplayData();
                }
            }
            else
            {
                Response.Write(strAlert);                
            }
        }        
    }
    
    //수정
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        //[1]제목과 내용 변수
        string strTitle = "";
	string strps = "";
	 
string strts1 = "";
string strcs1 = "";
string strlink1 = "";
string strDead1 = "";
string strlang1 = "";
string strProgress1 = "";
string strcorp1 = "";
string strcode1 = ""; 
string strsec1 = "";
string strtech1 = "";
string strContent = "";
string UpfileName = "";   
string dbFileName = lblFileName.Text ; 
	                                                  
        

        //[1-1]script
        string strAlert = @"<script>alert('수정했습니다.');location.href='SCM_NoticeView.aspx?SCM_NoticeID=" 
            + Request["SCM_NoticeID"] 
            + "';</script>"; 


        if ((FileUpload1.PostedFile.FileName != null) && (FileUpload1.PostedFile.ContentLength > 0))
        {
            UpfileName = FileUpload1.PostedFile.FileName;
    
            string SaveLocation = Server.MapPath("~\\fileUpload\\notice\\") + UpfileName;
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
		    SaveLocation =Server.MapPath("~\\fileUpload\\notice\\")+dbFileName ;
                    fInfo = new FileInfo(SaveLocation)  ;                                                    
                } while (fInfo.Exists);

                                                                                                              
             }
    
              FileUpload1.SaveAs(SaveLocation);
                                                                                                               
        }
 
       
        try
        {            
            //[2]리플레이스 변환
            strTitle = txtTitle.Text;                    				
					
	    strps = txtps.Text;  
            strts1 = txtts1.Text;  
            strcs1 = txtcs1.Text;  
            strlink1 = txtlink1.Text; 			
strDead1 = txtDead1.Text; 
strProgress1 = txtProgress1.Text; 
strcorp1 = txtcorp1.Text; 
strcode1 = txtcode1.Text; 
strlang1 = txtlang1.Text; 
strsec1 = txtsec1.Text; 
strtech1 = txttech1.Text; 
strContent = txtContent.Text 
			.Replace("\r\n", "<br />");
 

            using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
            {
                //[1]Excute
             
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand("UP_ModifySCM_Notice", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Title", strTitle);
		cmd.Parameters.AddWithValue("@ps", strps);
		cmd.Parameters.AddWithValue("@ts1", strts1); 
		cmd.Parameters.AddWithValue("@cs1", strcs1); 
		cmd.Parameters.AddWithValue("@link1", strlink1); 		
		cmd.Parameters.AddWithValue("@Dead1", strDead1); 
		cmd.Parameters.AddWithValue("@Progress1", strProgress1); 
		cmd.Parameters.AddWithValue("@corp1", strcorp1);  
		cmd.Parameters.AddWithValue("@code1", strcode1);  
		cmd.Parameters.AddWithValue("@lang1", strlang1); 
		cmd.Parameters.AddWithValue("@sec1", strsec1);   
		cmd.Parameters.AddWithValue("@tech1", strtech1);
        cmd.Parameters.AddWithValue("@Content", strContent);  
        cmd.Parameters.AddWithValue("@upFileName", dbFileName);  
				
				
                cmd.Parameters.AddWithValue("@SCM_NoticeID", Convert.ToInt32(Request["SCM_NoticeID"]));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            //[2]리디렉트..수차후수정
            Response.Write(strAlert);            
        }
        catch (Exception err)
        {
            //[3]Exception
            Response.Write(err.Source + " : " + err.Message);
        }
        
    }
    //취소
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {        
        Response.Redirect("SCM_NoticeView.aspx?SCM_NoticeID=" + Request["SCM_NoticeID"]);
    }
    #endregion

    #region [2]Method
    //텍스트 박스 바인딩
    private void DisplayData()
    {
        //[1]dataset
        DataSet ds = null;
        
        try
        {
            using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
            {
                //[2]Fill
              //  ds = bsl.ViewNotice(Convert.ToInt32(Request["NoticeID"]));
                ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString, "UP_ViewSCM_Notice", Convert.ToInt32(Request["SCM_NoticeID"]));

                //[3]Bind
                txtTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
		txtps.Text = ds.Tables[0].Rows[0]["ps"].ToString(); 
		txtts1.Text = ds.Tables[0].Rows[0]["ts1"].ToString();  
		txtcs1.Text = ds.Tables[0].Rows[0]["cs1"].ToString(); 
		txtlink1.Text = ds.Tables[0].Rows[0]["link1"].ToString();  
		txtlang1.Text = ds.Tables[0].Rows[0]["lang1"].ToString();
		txtsec1.Text = ds.Tables[0].Rows[0]["sec1"].ToString();		
		txtDead1.Text = ds.Tables[0].Rows[0]["Dead1"].ToString();  
		txtProgress1.Text = ds.Tables[0].Rows[0]["Progress1"].ToString();  
		txtcorp1.Text = ds.Tables[0].Rows[0]["corp1"].ToString();  
		txtcode1.Text = ds.Tables[0].Rows[0]["code1"].ToString();  		
        txtContent.Text = ds.Tables[0].Rows[0]["Content"].ToString()  
		.Replace("\r\n", "<br />");
		txttech1.Text = ds.Tables[0].Rows[0]["tech1"].ToString(); 
		
lblFileName.Text = ds.Tables[0].Rows[0]["UpFileName"].ToString(); 
 
                
            }            
        }
        catch (Exception err)
        {
            //[4]예외
            Response.Write(err.Source + " : " + err.Message);
        }               
    } 
    #endregion
   
}
