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
using System.Text;//

public partial class MasterPage : System.Web.UI.MasterPage
{
    

	protected void Page_Load(object sender, EventArgs e)
    { 
       
		if (Page.User.Identity.IsAuthenticated)
        {
            //로그인 했을때..
            lnkLogin.Visible = false;
            lnkLogout.Visible = true;

            //로그인시 마이페이지 링크 부여
            lnkMyPage.NavigateUrl = "~/MyPage/Default.aspx";

            //관리자용 하이퍼 링크.
            if (Page.User.Identity.Name.ToLower() != "admin")
            {
                //로그인했지만 관리자 아닐때..
                lnkAdmin.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");                
            }
            else
            {
                //로그인이면서..admin 일경우..NavigateUrl 속성부여..
                lnkAdmin.NavigateUrl = "~/Admin/Default.aspx";
            }
        }
        else
        {
            //관리자용 하이퍼 링크.
            lnkAdmin.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");

            //로그인 아닐때 마이페이지 접근시
            lnkMyPage.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");

            //로그 아웃 상태..
            lnkLogin.Visible = true;
            lnkLogout.Visible = false;
        }        
    }

    public void DoPopUP()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<script type='text/javascript' language='javascript'>");
        sb.Append("function getCookie(name){");
        sb.Append("var Found = false;var start, end;var i = 0;");
        sb.Append("while(i <= document.cookie.length){");
        sb.Append("start = i;end = start + name.length; ");
        sb.Append("if(document.cookie.substring(start, end) == name){");
        sb.Append("Found = true;break;");
        sb.Append("}i++;} ");
        sb.Append("if(Found == true){");
        sb.Append("start = end + 1; ");
        sb.Append("end = document.cookie.indexOf(';', start); ");
        sb.Append(" if(end < start) ");
        sb.Append(" end = document.cookie.length; ");
        sb.Append(" return document.cookie.substring(start, end); ");
        sb.Append("} return '';} ");

        sb.Append("function openMsgBox()");
        sb.Append("{");
        sb.Append("var eventCookie = getCookie('memo');");
        sb.Append("if (eventCookie != 'no')");
        sb.Append("window.open('Notice/PopUp.aspx','_blank','width=400,height=630,top=10,left=10');");
        sb.Append("}");
        sb.Append("openMsgBox();");
        sb.Append("</script>");

        //lblJava.Text = sb.ToString();
       // Page.RegisterClientScriptBlock("ss", sb.ToString());
        //Page.RegisterStartupScript("Start", sb.ToString());
        Response.Write(sb.ToString());
        
    }

    public string FuncPopUp()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<script type='text/javascript' language='javascript'>");
        sb.Append("function getCookie(name){");
        sb.Append("var Found = false;var start, end;var i = 0;");
        sb.Append("while(i <= document.cookie.length){");
        sb.Append("start = i;end = start + name.length; ");
        sb.Append("if(document.cookie.substring(start, end) == name){");
        sb.Append("Found = true;break;");
        sb.Append("}i++;} ");
        sb.Append("if(Found == true){");
        sb.Append("start = end + 1; ");
        sb.Append("end = document.cookie.indexOf(';', start); ");
        sb.Append(" if(end < start) ");
        sb.Append(" end = document.cookie.length; ");
        sb.Append(" return document.cookie.substring(start, end); ");
        sb.Append("} return '';} ");

        sb.Append("function openMsgBox()");
        sb.Append("{");
        sb.Append("var eventCookie = getCookie('memo');");
        sb.Append("if (eventCookie != 'no')");
        sb.Append("window.open('Notice/PopUp.aspx','_blank','width=400,height=630,top=10,left=10');");
        sb.Append("}");
        sb.Append("openMsgBox();");
        sb.Append("</script>");

        return sb.ToString();
        //Page.RegisterClientScriptBlock("ss", sb.ToString());
        //Page.RegisterStartupScript("Start", sb.ToString());
	
    }  
 	
}
