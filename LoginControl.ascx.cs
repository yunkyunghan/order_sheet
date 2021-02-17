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
using Is.Framework;//

public partial class Member_LoginControl : System.Web.UI.UserControl
{
	

    #region [1]Event Handler
    //[1]로드
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserID.Focus();
        //개인, 기업 구분용,
        int intCheck = 0;

        if (!IsPostBack)
        {
            //로그인 체크..로그인이면 판넬 비주얼
            if (Page.User.Identity.IsAuthenticated)
            {
                pnlAfterLogin.Visible = true;
                pnlBeforeLogin.Visible = false;

                //사용자 이름
                DisplayData();

                using (Is.Main.Bsl.Main_NTx nBsl = new Is.Main.Bsl.Main_NTx())
                {
                    //intCheck = nBsl.CheckUserIDPer(Page.User.Identity.Name);
                    intCheck = 1;
                    //개인 1;
                    if (intCheck > 0)
                    {
                        lnkModifyProfile.NavigateUrl = "~/MyPage/ModifyPer.aspx";
                        //pnlOnlyPerson.Visible = true;
                    }
                    else
                    {
                        lnkModifyProfile.NavigateUrl = "~/MyPage/ModifyCom.aspx";
                        //pnlOnlyPerson.Visible = false;
                    }
                }                
            }
            else
            {
                //로그인 아니면
                pnlBeforeLogin.Visible = true;
                pnlAfterLogin.Visible = false;
            }
        }        
    }
    //[2]로그인    
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //변수
        int intResult = 0;
        int intCheckUserID = 0;
        int intDiv = 0;
        string strAlert = "";

        #region [1]로그인 로직
        try
        {
            if (lstMemberDivision.SelectedValue == "1")
            {
                #region [1]개인회원
                //아이디 유무 확인
                using (Is.Main.Bsl.Main_NTx nbsl = new Is.Main.Bsl.Main_NTx())
                {
                    intCheckUserID = nbsl.CheckUserID(txtUserID.Text);

                    //아이디가 존재하면..
                    if (intCheckUserID > 0)
                    {
                        //두테이블에 있는데..Person 테이블에 없으면 기업 회원이다..
                        intDiv = nbsl.CheckUserIDPer(txtUserID.Text);

                        //Person 에 아이디가 있다면..로그인
                        if (intDiv > 0)
                        {
                            #region 로그인
                            using (Is.Main.Bsl.Main_RTx rBsl = new Is.Main.Bsl.Main_RTx())
                            {
                                //로그인메서드 실행..
                                intResult = rBsl.DoLoginPerson(txtUserID.Text, txtPassword.Text);

                                //아이디와비번 체크
                                if (intResult > 0)
                                {
                                    //인증
                                    FormsAuthentication.SetAuthCookie(txtUserID.Text, false);

                                    //회원구분용 쿠키..
                                    Response.Cookies["Div"].Value = "Per";

                                    //판넬 비져블 속성
                                    pnlAfterLogin.Visible = true;
                                    pnlBeforeLogin.Visible = false;

                                    //개인가입자만 보여준 목록
                                    pnlOnlyPerson.Visible = true;

                                    //메인으로 이동
                                    Response.Redirect("~/Default.aspx");
                                }
                                else
                                {
                                    //비번이 다른경우
                                    txtPassword.Text = "";
                                    txtPassword.Focus();

                                    strAlert = @"<script>window.alert('암호가 다릅니다!!');</script>";
                                    Page.RegisterStartupScript("aaa", strAlert);
                                    //Response.Write(@"<script>window.alert('암호가 다릅니다!!');</script>");
                                }
                            }
                            #endregion
                        }
                        else
                        {
                            strAlert = @"<script>window.alert('기업 회원입니다!!');</script>";
                            Page.RegisterStartupScript("Com", strAlert);
                            //Response.Write(@"<script>window.alert('기업 회원입니다!!');</script>");
                        }
                    }
                    else
                    {
                        //아이디가 없을 경우
                        txtUserID.Text = "";

                        strAlert = @"<script>window.alert('존재하지 않는 아이디 입니다!!\n회원가입페이지로 이동합니다');location.href='Main/Agreement.aspx';</script>";

                        Page.RegisterStartupScript("UnLogin", strAlert);
                        //Response.Write(@"<script>window.alert('존재하지 않는 아이디 입니다!!\n회원가입페이지로 이동합니다');location.href='Main/Agreement.aspx';</script>");
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

                    if (intCheckUserID > 0)
                    {
                        //회원구분..
                        intDiv = nbsl.CheckUserIDCom(txtUserID.Text);

                        //전체에 아이디가 있고 기업태이블에 있으면..기업회원..
                        if (intDiv > 0)
                        {
                            #region 로그인
                            using (Is.Main.Bsl.Main_RTx rbsl = new Is.Main.Bsl.Main_RTx())
                            {
                                //Dologin
                                intResult = rbsl.DoLoginCompany(txtUserID.Text, txtPassword.Text);

                                if (intResult > 0)
                                {
                                    FormsAuthentication.SetAuthCookie(txtUserID.Text, false);

                                    //회원구분용쿠키..
                                    Response.Cookies["Div"].Value = "Com";

                                    pnlAfterLogin.Visible = true;
                                    pnlBeforeLogin.Visible = false;
                                    //개인가입자만 보여준 목록
                                    pnlOnlyPerson.Visible = false;

                                    Response.Redirect("~/Default.aspx");
                                }
                                else
                                {
                                    //비번이 다른경우
                                    txtPassword.Text = "";
                                    txtPassword.Focus();

                                    strAlert = @"<script>window.alert('암호가 다릅니다!!');</script>";
                                    Page.RegisterStartupScript("aa", strAlert);
                                    //Response.Write(@"<script>window.alert('암호가 다릅니다!!');</script>");
                                }
                            }
                            #endregion
                        }
                        else
                        {
                            strAlert = @"<script>window.alert('개인회원 입니다.');</script>";
                            Page.RegisterStartupScript("sds", strAlert);
                            //Response.Write(@"<script>window.alert('개인회원 입니다.');</script>");
                        }
                    }
                    else
                    {
                        //아이디가 없을 경우
                        txtUserID.Text = "";

                        strAlert = @"<script>window.alert('존재하지 않는 아이디 입니다!!');</script>";
                        Page.RegisterStartupScript("wewe", strAlert);
                        //Response.Write(@"<script>window.alert('존재하지 않는 아이디 입니다!!');</script>");
                    }
                }
                #endregion
            }
        }
        catch (Exception err)
        {
            //Response.Write(err.Source + " : " + err.Message);
        } 
        #endregion
    } 
    #endregion

    #region [2]Method
    //[3]로그인했을때..
    private void DisplayData()
    {        
        //로그인 이면 아이디 값..
        string strUserID = "";
        
        //DataSet
        DataSet ds = null;

        //
        int intCheck = 0;

        if (Page.User.Identity.IsAuthenticated)
        {
            strUserID = Page.User.Identity.Name;

            using (Is.Main.Bsl.Main_NTx nBsl = new Is.Main.Bsl.Main_NTx())
            {
                //개인 기업 체크..개인:1, 기업:0
                intCheck = nBsl.CheckUserIDPer(strUserID);

                if (intCheck > 0)
                {
                    //Fill
                    ds = nBsl.ViewPerson(strUserID);

                    //레이블
                    lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();                       
                    lblProfileCount.Text = ds.Tables[0].Rows[0]["Profile"].ToString();
                    lblMileage.Text = ds.Tables[0].Rows[0]["Mileage"].ToString();
                }
                else
                {
                    ds = nBsl.ViewCompany(strUserID);
                    lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
                }
            }            
        }
        else
        {
            //
        }        
    } 
    #endregion
	
}
