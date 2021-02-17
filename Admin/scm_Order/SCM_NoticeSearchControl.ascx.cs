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

public partial class Admin_SCM_NoticeSearchControl : System.Web.UI.UserControl
{    
    #region [1]Event Handler
    //Load : 로그인 체크밑 그리드 바인딩
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        string strAlert = @"<script>alert('관리자만 접근가능합니다.');location.href='../Default.aspx';</script>";

        //로그인 체크
        if (!Page.User.Identity.IsAuthenticated)
        {
            Response.Write(strAlert);
        }
        else
        {
            //관리자만 접근가능
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
    //검색
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        //[1]Query String
        string strUrl = String.Format(
            "SCM_NoticeSearch.aspx?Field={0}&Query={1}",
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
    //마우수 오바시 효까
    protected void ctlNoticeList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add(
                "onMouseOver", "this.style.backgroundColor='#FFFFFF';return true");

            e.Row.Attributes.Add(
                "onMouseOut", "this.style.backgroundColor='#DEDFDE';");
        }

    }
    #endregion

    #region [2]Method
    //[1]그리드 바인딩
    private void DisplayData()
    {
        //[1]dataset
        DataSet ds = null;

        try
        {
            using (Is.Notice.Bsl.Notice_NTx bsl = new Is.Notice.Bsl.Notice_NTx())
            {
                //[2]Fill
                //ds = bsl.SearchNotice(Request["Field"], Request["Query"]);
                ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString, "UP_SearchSCM_Notice", Request["Field"], Request["Query"]);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //[3]Bind
                    ctlNoticeList.DataSource = ds;
                    ctlNoticeList.DataBind();
                }
                else
                {
                    lblError.Text = "검색결과가 없습니다";
                }                
            }            
        }
        catch (Exception err)
        {
            //[4]예외
            Response.Write(err.Source + " : " + err.Message);
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
            strResult = String.Format("<img src='{0}' border='0'/>", "../../images/new.gif");
        }

        //[5]리턴
        return strResult;
    }
    #endregion           
}
