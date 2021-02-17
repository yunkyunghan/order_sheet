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
        string UpfileName = "";	 // 이 부분은 데이터 베이스에 추가가 되는부분 ,포문 안에 있으니깐 리스트 길이 만큼 반복->이것도 예전꺼
        string dbFileName = string.Empty;
        string strserial_num = "";
        string strdue_date = ""; 

        string strc_num = "";
        string strc_name = ""; 
        string strc_leader = "";
        string strc_address = "";
        string strc_charge = "";
        string strc_phonenum = "";

        string strcode = ""; 
        string stritem = "";
        string stramount = "";
        string struniprice = "";
        string strprice = "";
         string strvat = "";

        string strt_amount = "";
        string strt_uniprice = "";
        string strt_price = "";
        string strt_vat = "";

        string strprice_kor = "";
        string strprice_num = "";                                           
       

        //[1-1]script
        string strAlert = @"<script>alert('수정했습니다.');location.href='SCM_NoticeView.aspx?SCM_OrderID=" 
            + Request["SCM_OrderID"] 
            + "';</script>"; 


        if ((FileUpload1.PostedFile.FileName != null) && (FileUpload1.PostedFile.ContentLength > 0))
        {
            UpfileName = FileUpload1.PostedFile.FileName;
    
            string SaveLocation = Server.MapPath("~\\fileUpload\\Order\\") + UpfileName;
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
		    SaveLocation =Server.MapPath("~\\fileUpload\\Order\\")+dbFileName ;
                    fInfo = new FileInfo(SaveLocation)  ;                                                    
                } while (fInfo.Exists);

                                                                                                              
             }
    
              FileUpload1.SaveAs(SaveLocation);
                                                                                                               
        }
 
       
        try
        {            
            //[2]리플레이스 변환
      strserial_num = txtserial_num.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strdue_date = txtdue_date.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;"); 

            strc_num = txtc_num.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strc_name = txtc_name.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   

            strc_leader = txtc_leader.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strc_address = txtc_address.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   

             strc_charge = txtc_charge.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strc_phonenum = txtc_phonenum.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");

            strcode = submit_codes.Text //list_codes[i] // 이 끝부분에 i= 0~리스트 길이 만큼의 리스트 항목을 반환 =>['물티슈','액자','노트북'] 처음에는 물티슈로 디비에 저장
            // 두번쨰는 액자로 저장 
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   

            stritem = submit_items.Text // list_items[i]
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            stramount = submit_amounts.Text //list_amounts[i]
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;"); 

            struniprice = submit_uniprices.Text//list_uniprices[i]
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   

            strprice = submit_prices.Text //list_prices[i]
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strvat = submit_vats.Text//list_vats[i]
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;"); 

            strt_amount = txtt_amount.Text 
         
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;"); 

            strt_uniprice = txtt_uniprice.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   

            strt_price = txtt_price.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strt_vat = txtt_vat.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");  

            strprice_kor = txtprice_kor.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");                
 
            strprice_num = txtprice_num.Text
                .Replace("&", "&amp;")
                .Replace("<", "&lt;")
                .Replace(">", "&gt;")
                .Replace("\r\n", "<br>")
                .Replace("\t", "&nbsp;&nbsp;&nbsp;");   


 

            using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
            {
                //[1]Excute
             
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand("UP_ModifySCM_Order", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@serial_num", strserial_num);
                cmd.Parameters.AddWithValue("@due_date", strdue_date);
                cmd.Parameters.AddWithValue("@c_num", strc_num);	
                cmd.Parameters.AddWithValue("@c_name", strc_name);
                cmd.Parameters.AddWithValue("@c_leader", strc_leader);
                cmd.Parameters.AddWithValue("@c_address", strc_address);
                cmd.Parameters.AddWithValue("@c_charge", strc_charge);
                cmd.Parameters.AddWithValue("@c_phonenum", strc_phonenum);
                cmd.Parameters.AddWithValue("@code", strcode);
                cmd.Parameters.AddWithValue("@item", stritem);
                cmd.Parameters.AddWithValue("@amount", stramount);
                cmd.Parameters.AddWithValue("@uniprice", struniprice); 
                cmd.Parameters.AddWithValue("@price", strprice);
                cmd.Parameters.AddWithValue("@vat", strvat);
                cmd.Parameters.AddWithValue("@t_amount", strt_amount);
                cmd.Parameters.AddWithValue("@t_uniprice", strt_uniprice);
                cmd.Parameters.AddWithValue("@t_vat", strt_vat);
                cmd.Parameters.AddWithValue("@t_price", strt_price); 
                cmd.Parameters.AddWithValue("@price_kor", strprice_kor);
                cmd.Parameters.AddWithValue("@price_num", strprice_num);
                cmd.Parameters.AddWithValue("@upFileName", dbFileName);
				
				
                cmd.Parameters.AddWithValue("@SCM_OrderID", Convert.ToInt32(Request["SCM_OrderID"]));

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
        Response.Redirect("SCM_NoticeView.aspx?SCM_OrderID=" + Request["SCM_OrderID"]);
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
                ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString, "UP_ViewSCM_Order", Convert.ToInt32(Request["SCM_OrderID"]));

                //[3]Bind
                txtserial_num.Text = ds.Tables[0].Rows[0]["serial_num"].ToString()
                    .Replace("\r\n", "<br />");

                txtdue_date.Text = ds.Tables[0].Rows[0]["due_date"].ToString();
                txtc_num.Text = ds.Tables[0].Rows[0]["c_num"].ToString();

                txtc_name.Text = ds.Tables[0].Rows[0]["c_name"].ToString();
                txtc_leader.Text = ds.Tables[0].Rows[0]["c_leader"].ToString();
                txtc_address.Text = ds.Tables[0].Rows[0]["c_address"].ToString()
                    .Replace("\r\n", "<br />");

                txtc_charge.Text = ds.Tables[0].Rows[0]["c_charge"].ToString(); 
                txtc_phonenum.Text = ds.Tables[0].Rows[0]["c_phonenum"].ToString(); 
                lblcode.Text = ds.Tables[0].Rows[0]["code"].ToString(); 
                lblitem.Text = ds.Tables[0].Rows[0]["item"].ToString(); 
                lblamount.Text = ds.Tables[0].Rows[0]["amount"].ToString(); 
                lbluniprice.Text = ds.Tables[0].Rows[0]["uniprice"].ToString(); 
                lblprice.Text = ds.Tables[0].Rows[0]["price"].ToString(); 
                lblvat.Text = ds.Tables[0].Rows[0]["vat"].ToString(); 
                txtt_amount.Text = ds.Tables[0].Rows[0]["t_amount"].ToString()
                    .Replace("\r\n", "<br />");
                txtt_uniprice.Text = ds.Tables[0].Rows[0]["t_uniprice"].ToString();
               txtt_vat.Text = ds.Tables[0].Rows[0]["t_vat"].ToString();
                txtt_price.Text = ds.Tables[0].Rows[0]["t_price"].ToString();
                txtprice_kor.Text = ds.Tables[0].Rows[0]["price_kor"].ToString();
               txtprice_num.Text = ds.Tables[0].Rows[0]["price_num"].ToString();
                
               
		
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
