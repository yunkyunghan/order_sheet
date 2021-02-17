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

public partial class MyPage_DoLogout : System.Web.UI.Page
{
    #region [1]Event Handler
    //Load
    protected void Page_Load(object sender, EventArgs e)
    {
        //[1]로그아웃
        FormsAuthentication.SignOut();
        Response.Cookies["Div"].Value = "";

        //[2]리디렉트
        Response.Redirect("~/DMN4l0MwVVKJ7QyHfsSnBSpfDu7U-f4N2xSr9q17QOOIew6j7Su-W5ZW4HnDT0U6_exo.aspx");
    } 
    #endregion
}
