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

public partial class LoginSubControl : System.Web.UI.UserControl
{
    #region [1]Event Handler
    //[1]아이디 포인터
    protected void Page_Load(object sender, EventArgs e)
    {
        
		
		
		this.txtUserID.Focus();
    }
    //[2]로그인
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //Variable
        int intResult = 0;
        int intCheckUserID = 0;
        int intDiv = 0;

        #region 로그인 로직
        try
        {
            //개인
            if (lstDiv.SelectedValue == "1")
            {
                #region [1]개인
                //아이디 유무 확인
                using (Is.Main.Bsl.Main_NTx nbsl = new Is.Main.Bsl.Main_NTx())
                {
                    //아이디 체크..
                    //intCheckUserID = nbsl.CheckUserID(txtUserID.Text);
                    intCheckUserID = 1;
                    //아이디가 존재한다면..
                    if (intCheckUserID > 0)
                    {
                        //회원구분..
                        //intDiv = nbsl.CheckUserIDPer(txtUserID.Text);
                        intDiv = 1;
                        if (intDiv > 0)
                        {
                            #region 로그인
                            using (Is.Main.Bsl.Main_RTx rBsl = new Is.Main.Bsl.Main_RTx())
                            {
                                //DoLogin
                                //intResult = rBsl.DoLoginPerson(txtUserID.Text, txtPassword.Text);
                                intResult = 1;
                                //True
                                if (intResult > 0)
                                {
                                    FormsAuthentication.SetAuthCookie(txtUserID.Text, false);

                                    //회원구분용 쿠키..
                                    Response.Cookies["Div"].Value = "Per";

                                    Response.Redirect("~/Default.aspx");
                                }
                                else
                                {
                                    lblError.Text = "암호가 다릅니다. 암호를 확인하세요.";
                                    //Response.Write(@"<script>window.alert('암호가 다릅니다');</script>");
                                }
                            }
                            #endregion
                        }
                        else
                        {
                            lblError.Text = "기업회원입니다. 기업회원을 선택하고 로그인을 하세요.";
                            //Response.Write(@"<script>window.alert('기업 회원입니다..');</script>");
                        }
                    }
                    else
                    {
                        lblError.Text = "존재하지 않는 아이디 입니다. 다시 확인해 주십시요";
		//Response.Write(@"<script>window.alert('존재하지 않는 아이디 입니다!!\n회원가입 페이지로 이동합니다.');location.href='Main/Agreement.aspx';</script>");
                    }
                }
                #endregion
            }
            else
            {
                #region [2]기업회원
                //아이디 유무 확인
                using (Is.Main.Bsl.Main_NTx nbsl = new Is.Main.Bsl.Main_NTx())
                {
                    intCheckUserID = nbsl.CheckUserID(txtUserID.Text);

                    //아이디가 존재 한다면..
                    if (intCheckUserID > 0)
                    {
                        intDiv = nbsl.CheckUserIDCom(txtUserID.Text);

                        //회원구분
                        if (intDiv > 0)
                        {
                            using (Is.Main.Bsl.Main_RTx rbsl = new Is.Main.Bsl.Main_RTx())
                            {
                                //로그인
                                intResult = rbsl.DoLoginCompany(txtUserID.Text, txtPassword.Text);

                                #region 로그인
                                //로그인
                                if (intResult > 0)
                                {
                                    FormsAuthentication.SetAuthCookie(txtUserID.Text, false);

                                    //회원구분용쿠키..
                                    Response.Cookies["Div"].Value = "Com";

                                    Response.Redirect("~/Default.aspx");
                                }
                                else
                                {
                                    lblError.Text = "암호가 다릅니다. 암호를 확인하세요.";
                                    //Response.Write(@"<script>window.alert('암호가 다릅니다');</script>");
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            lblError.Text = "개인회원입니다. 개인회원을 선택하고 로그인을 하세요.";
                            //Response.Write(@"<script>window.alert('개인 회원입니다.');</script>");
                        }
                    }
                    else
                    {
                        lblError.Text = "존재하지 않는 아이디 입니다. 다시 확인해 주십시요";
                        //Response.Write(@"<script>window.alert('존재하지 않는 아이디 입니다.');</script>");
                    }
                }
                #endregion
            }
        }
        catch (Exception err)
        {
            //[!]
            //Response.Write(err.Source + " : " + err.Message);
            lblError.Text = err.Source + " : " + err.Message;
        }
        #endregion
    } 
    #endregion
	
}
