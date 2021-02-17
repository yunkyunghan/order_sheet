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
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_SCM_NoticeViewControl : System.Web.UI.UserControl
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
    //첨부파일다운로드
    protected void btnFile_Click(object sender, EventArgs e)
    {
        string FileName = lblFileName.Text;
        string path = "c:\\inetpub\\joblink\\fileupload\\Order\\";    

 


        
        System.Web.HttpContext objCurrent = System.Web.HttpContext.Current;

        string strFullPath = Path.Combine(path, FileName);
        string encFileName = FileName;
        //// [2009.08.20] IE 6에서 바로 열기시, Encoding으로 인한 문제 발생
        //encFileName = EncodeFileName(downFileName);

        objCurrent.Response.Clear();
        objCurrent.Response.ClearHeaders();
        objCurrent.Response.ClearContent();

        encFileName = HttpUtility.UrlEncode(encFileName,
                             System.Text.Encoding.UTF8).Replace("+", "%20");
        
        objCurrent.Response.ContentType = "Application/Unknown";
        objCurrent.Response.AddHeader("content-disposition", "attachment;filename=" + encFileName);
        objCurrent.Response.AddHeader("content-length", (new System.IO.FileInfo(strFullPath)).Length.ToString());
        objCurrent.Response.TransmitFile(strFullPath);

    }
    //자료 목록보기
    protected void btnList_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SCM_NoticeList.aspx");
    }
    //[3]MoDify
    protected void btnmodify_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SCM_NoticeModify.aspx?SCM_OrderID=" + Request["SCM_OrderID"]);
    }
    //[4]삭제
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        //[1]script
        string strAlert = @"<script>alert('삭제되었습니다.');location.href='SCM_NoticeList.aspx';</script>";

        try
        {
            using (Is.Notice.Bsl.Notice_RTx rBsl = new Is.Notice.Bsl.Notice_RTx())
            {
               
                SqlConnection con = new SqlConnection(
                                 ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand("UP_DeleteSCM_Order", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SCM_OrderID", Convert.ToInt32(Request["SCM_OrderID"]));
                
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

            //[3]
            Page.RegisterStartupScript("EndScript", strAlert);
        }
        catch (Exception err)
        {
            //[4]
            //Response.Write(err.Source + " : " + err.Message);
        }
    } 
    #endregion

    #region [2]Mehtod
    //레이블 바인딩
    private void DisplayData()
    {
        //[1]dataset
        DataSet ds = new DataSet();

        using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
        {
            //[2]Fill
          //  ds = bsl.ViewNotice(Convert.ToInt32(Request["NoticeID"]));
            ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString, "UP_ViewSCM_Order", Convert.ToInt32(Request["SCM_OrderID"]));


            if (ds.Tables[0].Rows.Count > 0)
            {
                //[3]내용이 길어서.. 출력 오류 날수 있으니..나중에 체크하자..

                lblserial_num.Text = ds.Tables[0].Rows[0]["serial_num"].ToString()
                    .Replace("\r\n", "<br />");

                lbldue_date.Text = ds.Tables[0].Rows[0]["due_date"].ToString();
                lblc_num.Text = ds.Tables[0].Rows[0]["c_num"].ToString();

                lblc_name.Text = ds.Tables[0].Rows[0]["c_name"].ToString();
                lblc_leader.Text = ds.Tables[0].Rows[0]["c_leader"].ToString();
                lblc_address.Text = ds.Tables[0].Rows[0]["c_address"].ToString()
                    .Replace("\r\n", "<br />");

                lblc_charge.Text = ds.Tables[0].Rows[0]["c_charge"].ToString(); 
                lblc_phonenum.Text = ds.Tables[0].Rows[0]["c_phonenum"].ToString(); 
                lblcode.Text = ds.Tables[0].Rows[0]["code"].ToString(); 
                lblitem.Text = ds.Tables[0].Rows[0]["item"].ToString(); 
                lblamount.Text = ds.Tables[0].Rows[0]["amount"].ToString(); 
                lbluniprice.Text = ds.Tables[0].Rows[0]["uniprice"].ToString(); 
                lblprice.Text = ds.Tables[0].Rows[0]["price"].ToString(); 
                lblvat.Text = ds.Tables[0].Rows[0]["vat"].ToString(); 
                lblt_amount.Text = ds.Tables[0].Rows[0]["t_amount"].ToString()
                    .Replace("\r\n", "<br />");
                lblt_uniprice.Text = ds.Tables[0].Rows[0]["t_uniprice"].ToString();
                lblt_vat.Text = ds.Tables[0].Rows[0]["t_vat"].ToString();
                lblt_price.Text = ds.Tables[0].Rows[0]["t_price"].ToString();
                lblprice_kor.Text = ds.Tables[0].Rows[0]["price_kor"].ToString();
                lblprice_num.Text = ds.Tables[0].Rows[0]["price_num"].ToString();
                lblPostDate.Text = ds.Tables[0].Rows[0]["PostDate"].ToString().Substring(0, 10); 
                lblReadCount.Text = ds.Tables[0].Rows[0]["ReadCount"].ToString() 
		        .Replace("\r\n", "<br />"); 
                lblFileName.Text = ds.Tables[0].Rows[0]["UpFileName"].ToString(); 
		
		 if ((lblFileName.Text != null) && (lblFileName.Text != ""))
                {
                    btnFile.Visible = true;
                }
                else
                {
                    btnFile.Visible = false;
                }
            }
            else
            {
                lblNoticeError.Text = "잘못된 요청입니다";
            }
        }        
    } 
    #endregion    
   
}
