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
using System.Text;//

public partial class Main_MainNoticeListControl : System.Web.UI.UserControl
{
    #region [1]Event Handler
    //[1]Load
    protected void Page_Load(object sender, EventArgs e)
    {
        //메인 로그인 하단 공지 목록
        if (!IsPostBack)
        {
            DisplayData();
        }
    } 
    #endregion

    #region [2]Method
    //[1]
    private void DisplayData()
    {
        //[1]DataSet
        DataSet ds = null;

        //[2]stringbiulder
        StringBuilder strb = new StringBuilder();

        try
        {
            using (Is.Notice.Bsl.Notice_NTx bsl = new Is.Notice.Bsl.Notice_NTx())
            {
                //[3]Fill
                ds = bsl.MainNoticeList();

               
                using (Is.Common.Method.CommonMethod cm = new Is.Common.Method.CommonMethod())
                {
                    //[4]데이타 추출
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        strb.AppendFormat(
                            "<tr><td align='left'>{0}.<a href='Notice/NoticeView.aspx?NoticeID={1}' class='no0'>&nbsp;&nbsp;{2}</a></td><td align='right'>{3}</td><td>&nbsp;</td></tr>",
                            i + 1,                            
                            Convert.ToInt32(ds.Tables[0].Rows[i]["NoticeID"]),
                            cm.CutString(ds.Tables[0].Rows[i]["Title"].ToString()),
                            FuncNew(Convert.ToDateTime(ds.Tables[0].Rows[i]["PostDate"])));
                    }                  
                }                          
            }
           
            //[5]바인딩
            ltlNoticeList.Text = strb.ToString();
        }
        catch (Exception err)
        {
            Response.Write(err.Source + " : " + err.Message);
        }
    }        
    //[2]오늘쓴글은 뉴이미지
    public string FuncNew(object PostDate)
    {
        //[1]Convert
        DateTime dt = Convert.ToDateTime(PostDate);

        //[2]Different
        TimeSpan Diff = DateTime.Now - dt;

        //[3]Return Value
        string strResult = String.Empty;

        //[4]차이가 24 이하면 새글
        if (Diff.TotalHours < 24)
        {
            
        }
        else
        {
            strResult = "";
        }

        //[5]리턴
        return strResult;
    }
    #endregion  
}
