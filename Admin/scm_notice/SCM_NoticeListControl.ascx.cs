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

public partial class Admin_SCM_NoticeListControl : System.Web.UI.UserControl
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
    //[2]패이징..
    protected void ctlNoticeList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ctlNoticeList.PageIndex = e.NewPageIndex;
        DisplayData();
    }
    //[3]검색..
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //[1]Query string
        string strUrl = String.Format(
            "SCM_NoticeSearch.aspx?Field={0}&Query={1}",
            lstField.SelectedValue, txtQuery.Text);

        //[2]Redirect
        Response.Redirect(strUrl);
    }
    //[4]공지 쓰기..
    protected void btnWrite_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SCM_NoticeAdd.aspx");
    } 
    //[5]삭제
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        //[1]임시변수
        int intTemp = 0;
        string strAlert = @"<script>alert('삭제되었습니다.');location.href='SCM_NoticeList.aspx';</script>";

        try
        {
            for (int j = 0; j < ctlNoticeList.Rows.Count; j++)
            {
                CheckBox chkBox= (CheckBox)ctlNoticeList.Rows[j].FindControl("chk");

                if (chkBox.Checked)
                {
                    #region 삭제
                    //[2]Find
                    for (int i = 0; i < ctlNoticeList.Rows.Count; i++)
                    {
                        CheckBox check = (CheckBox)ctlNoticeList.Rows[i].FindControl("chk");

                        if (check.Checked)
                        {
                            //[3]SCM_noticeID
                            intTemp = Convert.ToInt32(ctlNoticeList.Rows[i].Cells[0].Text);

                            using (Is.Notice.Bsl.Notice_RTx rBsl = new Is.Notice.Bsl.Notice_RTx())
                            {
                                //[4]Delete
                                SqlConnection con = new SqlConnection(
                                 ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                                SqlCommand cmd = new SqlCommand("UP_DeleteSCM_Notice", con);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@SCM_NoticeID", intTemp);
                               
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                                
                            }
                        }

                        //[5]변수 초기화
                        intTemp = 0;
                    }

                    //[6]script
                    Page.RegisterStartupScript("EndScript", strAlert);
                    #endregion
                }
                else
                {
                    lblError.Text = "삭제할 항목을 선택하세요";
                }
            }            
        }
        catch (Exception err)
        {
            //[7]Exception
            //Response.Write(err.Source + " : " + err.Message);
               
        }
    }
    //push
     protected void btnPush_Click(object sender, ImageClickEventArgs e)
    {
        //[1]임시변수
        int intTemp = 0;
        string strAlert = @"<script>alert('전송되었습니다.');location.href='SCM_NoticeList.aspx';</script>";

        try
        {
            for (int j = 0; j < ctlNoticeList.Rows.Count; j++)
            {
                CheckBox chkBox= (CheckBox)ctlNoticeList.Rows[j].FindControl("chk");

                if (chkBox.Checked)
                {
                    #region 삭제
                    //[2]Find
                    for (int i = 0; i < ctlNoticeList.Rows.Count; i++)
                    {
                        CheckBox check = (CheckBox)ctlNoticeList.Rows[i].FindControl("chk");

                        if (check.Checked)
                        {
                            //[3]SCM_noticeID
                            intTemp = Convert.ToInt32(ctlNoticeList.Rows[i].Cells[0].Text);

                        /*    using (Is.Notice.Bsl.Notice_RTx rBsl = new Is.Notice.Bsl.Notice_RTx())
                            {
                                //[4]Delete
                                SqlConnection con = new SqlConnection(
                                 ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
                                SqlCommand cmd = new SqlCommand("UP_DeleteSCM_Notice", con);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@SCM_NoticeID", intTemp);
                               
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                                
                            }*/
                        }

                        //[5]변수 초기화
                        intTemp = 0;
                    }

                    //[6]script
                    Page.RegisterStartupScript("EndScript", strAlert);
                    #endregion
                }
                else
                {
                    lblError.Text = "삭제할 항목을 선택하세요";
                }
            }            
        }
        catch (Exception err)
        {
            //[7]Exception
            //Response.Write(err.Source + " : " + err.Message);
               
        }
    }
    //[6]모두선택
    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            //[1]해더의 체크박스 찾아오기
            CheckBox allCheck = (CheckBox)ctlNoticeList.HeaderRow.FindControl("chkAll");

            //[2]전체선택 해제//
            if (allCheck.Checked)
            {
                for (int i = 0; i < ctlNoticeList.Rows.Count; i++)
                {
                    CheckBox chks = (CheckBox)ctlNoticeList.Rows[i].FindControl("chk");

                    chks.Checked = true;
                }
            }
            else
            {
                for (int i = 0; i < ctlNoticeList.Rows.Count; i++)
                {
                    CheckBox chks = (CheckBox)ctlNoticeList.Rows[i].FindControl("chk");

                    chks.Checked = false;
                }
            }
        }
        catch (Exception err)
        {
            //
        } 
    }
    #endregion

    #region [2]Method
    //[1]그리드 바인딩
    private void DisplayData()
    {
        //[1]ds
        DataSet ds = null;

        try
        {
            using (Is.Notice.Bsl.Notice_NTx nBsl = new Is.Notice.Bsl.Notice_NTx())
            {
                //[2]Fill
                ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString, "UP_ListSCM_Notice", "");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //[3]Bind
                    ctlNoticeList.DataSource = ds;
                    ctlNoticeList.DataBind();
                }
                else
                {
                    lblError.Text = "공지사항이 없습니다";
                }
            }           
        }
        catch (Exception err)
        {
            //[4]Exception
            Response.Write(err.Source + " : " + err.Message);
        }
    }
    //[2]오늘쓴글은 뉴이미지
    public string FuncNew(object PostDate)
    {
        //[1]형번환
        DateTime dt = Convert.ToDateTime(PostDate);
        
        //[2]작성일과 오늘의 차이
        TimeSpan Diff = DateTime.Now - dt;

        //[3]반환값
        string strResult = String.Empty;

        //[4]계산
        if (Diff.TotalHours < 24)
        {
            strResult = String.Format("<img src='{0}' border='0'/>", "../../images/new.gif");
        }

        //[5]반환
        return strResult;
    }
    //[3]제목길이 자르기
    public string FuncCutStrng(object objTitle)
    {
        //[1]
        string strTitle = Convert.ToString(objTitle);

        //[2]
        if (strTitle.Length > 30)
        {
            return strTitle.Substring(0, 30) + "...";
        }
        else
        {
            return strTitle;
        }
     
 }
//첨부파일 이미지 삽입
    public string FuncImage(object UpFileName)
    {
        string cellFileName = Convert.ToString(UpFileName);
        string strImage = string.Empty;
        if (cellFileName.Length > 0)
        {
            strImage = string.Format("<img src='{0}' border='0'/>", "../../images/ico_new.gif");
        }
        return strImage;
    }

    #endregion 
}























