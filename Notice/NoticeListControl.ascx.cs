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

public partial class Notice_NoticeListControl : System.Web.UI.UserControl
{
    #region [1]Event Handler
    //Load : Check Admin
    protected void Page_Load(object sender, EventArgs e)
    {  
        if (!IsPostBack)
        {
            DisplayData();
        }          
    }   
    //검색
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        //[1]Query String
        string strUrl = String.Format(
            "NoticeSearch.aspx?Field={0}&Query={1}",
            lstField.SelectedValue, txtQuery.Text);

        //[2]Redirect
        Response.Redirect(strUrl);
    }     
    //Paging
    protected void ctlNoticeList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ctlNoticeList.PageIndex = e.NewPageIndex;
        DisplayData();
    }
    //마우수 오바시 효과
    protected void ctlNoticeList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add(
                "onMouseOver", "this.style.backgroundColor='#FD0202';return true");

            e.Row.Attributes.Add(
                "onMouseOut", "this.style.backgroundColor='#ffffff';");
        }
    }
    #endregion

    #region [2]Method
    //[1]그리드 바인딩
    private void DisplayData()
    {
        //[1]
        DataSet ds = null;

        try
        {
            using (Is.Notice.Bsl.Notice_NTx bsl = new Is.Notice.Bsl.Notice_NTx())
            {
                //[2]Fill
                ds = bsl.ListNotice();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //[3]Bind
                    ctlNoticeList.DataSource = ds;
                    ctlNoticeList.DataBind();
                }
                else
                {
                    lblNoticeError.Text = "공지사항이 없습니다";
                }                
            }  
        }
        catch (Exception err)
        {
            //
        }                   
    } 
    //[2]제목길이 자르기
    public string FuncCutStrng(object objTitle)
    { 
        //[1]
        string strTitle = Convert.ToString(objTitle);

        //[2]
        if (strTitle.Length > 26)
        {
            return strTitle.Substring(0, 24) + "...";
        }
        else
        {
            return strTitle;
        }
    }
    //[3]오늘쓴글은 뉴이미지
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

        //[5]리턴
        return strResult;
    }
    #endregion            
}
