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

public partial class Admin_SCM_Notice_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            //로그인 했을때..
            lnkLogin.Visible = false;
            lnkLogout.Visible = true;
        }
        else
        {
            //로그 아웃 상태..
            lnkLogin.Visible = true;
            lnkLogout.Visible = false;
        }
    }
}
