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

public partial class MasterPageLogin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

		if (Page.User.Identity.IsAuthenticated)
        {
            //로그인 했을때..
            lnkLogin.Visible = false;
            lnkLogout.Visible = true;

            //로그인시 마이페이지 링크 부여
            HyperLink2.NavigateUrl = "~/MyPage/Default.aspx";

            //관리자용 하이퍼 링크.
            if (Page.User.Identity.Name.ToLower() != "admin")
            {
                //로그인했지만 관리자 아닐때..
                HyperLink3.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");
            }
            else
            {
                //로그인이면서..admin 일경우..NavigateUrl 속성부여..
                HyperLink3.NavigateUrl = "Admin/Default.aspx";
            }
        }
        else
        {
            //관리자용 하이퍼 링크.
            HyperLink3.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");

            //로그인 아닐때 마이페이지 접근시
            HyperLink2.Attributes.Add("onClick", "javascript:alert('관리자 전용입니다');");

            //로그 아웃 상태..
            lnkLogin.Visible = true;
            lnkLogout.Visible = false;
        }
		
    }
}
