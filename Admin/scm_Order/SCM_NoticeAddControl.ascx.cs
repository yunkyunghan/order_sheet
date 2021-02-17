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
    {   //이 부분은 db에는 한줄씩 리스트에는 여러줄로 출력되는형태에 필요한 부분! 혹시 몰라 안지우고 주석처리합니당  
        // string sub_codes ="";
        // string sub_items ="";
        // string sub_amounts ="";
        // string sub_prices ="";
        // string sub_uniprices ="";
        // string sub_vats ="";
           
        // sub_codes = submit_codes.Text;
        // string [] list_codes = sub_codes.Split(','); // ["액자,물티슈,노트북..."] => ["액자","물티슈","노트북"]  리스트길이는 3
                                                        // 위에 있는건 리스트 길이가 1, 오른쪽은 리스트 길이가 3 (,을 기준으로 리스트를 생성해줌)
                                                        
        
        // sub_items = submit_items.Text;
        // string [] list_items = sub_items.Split(',');

        // sub_uniprices = submit_uniprices.Text;
        // string [] list_uniprices = sub_uniprices.Split(',');

        // sub_prices = submit_prices.Text;
        // string [] list_prices = sub_prices.Split(',');

        // sub_amounts = submit_amounts.Text;
        // string [] list_amounts = sub_amounts.Split(',');

        // sub_vats = submit_vats.Text;
        // string [] list_vats = sub_vats.Split(',');
        
        
        // for (int i = 0; i < list_vats.Length ; i++){ // 리스트 길이만큼 반복해 이 부분을 
        
        
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
 
                                                                        
        string path="c:\\inetpub\\joblink\\fileUpload\\Order\\";        


        string strAlert = @"<script>alert('입력했습니다.');location.href='SCM_NoticeList.aspx';</script>";


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
            //[2]변환
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
                
 
if (strserial_num !="")
{
               using (Is.Notice.Bsl.Notice_RTx bsl = new Is.Notice.Bsl.Notice_RTx())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UP_AddSCM_Order", con);

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
                    // cmd.Parameters.AddWithValue("@submit_codes", sub_codes);
					// cmd.Parameters.AddWithValue("@submit_items", sub_items);
					// cmd.Parameters.AddWithValue("@submit_amounts", sub_amounts);
					// cmd.Parameters.AddWithValue("@submit_uniprices", sub_uniprices); 
					// cmd.Parameters.AddWithValue("@submit_prices", sub_prices);
				    // cmd.Parameters.AddWithValue("@submit_vats", sub_vats);
					con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
}
        


            //[4]
            Response.Write(strAlert);
        }
        catch (Exception err)
        {
            //[5]Exception
            Response.Write(err.Source + " : " + err.Message);
        }
        //}//for문 대괄호 액자,물티슈,컴퓨터 => 데이터 베이스 액자한번 물티슈 한번 컴퓨터 한번 이렇게 저장하는게 이 포문
}
    
    //Cancel
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SCM_NoticeList.aspx");
    } 
    #endregion
}
