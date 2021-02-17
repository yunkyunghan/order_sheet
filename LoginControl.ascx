<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginControl.ascx.cs"
    Inherits="Member_LoginControl" %>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <!--로그인전-->
            <asp:Panel ID="pnlBeforeLogin" runat="server" Height="100%" Width="100%" DefaultButton="btnLogin">
                <table width="213" height="100" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="11" colspan="3">
                            <img src="images/main_login_top.gif"></td>
                    </tr>
                    <tr>
                        <td width="6" rowspan="2" background="images/main_login_leftbg.gif">
                            <img src="images/main_login_leftbg.gif"></td>
                        <td width="201" height="65" valign="top">
                            <table width="201" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="21" colspan="2" align="center" valign="middle">
                                        <asp:RadioButtonList ID="lstMemberDivision" runat="server" RepeatDirection="Horizontal"
                                            RepeatLayout="Flow">
                                            <asp:ListItem Value="1" Selected="True">관리자(Admin)</asp:ListItem>
                                            <asp:ListItem Value="2">기업회원</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="133" height="44" align="right" valign="bottom">
                                        <b>ID</b>&nbsp;
                                        <asp:TextBox ID="txtUserID" runat="server" MaxLength="12" TabIndex="99" CssClass="txt"
                                            Width="80px"></asp:TextBox>
                                        <br />
                                        <b>PW</b>&nbsp;
                                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" TabIndex="100" MaxLength="14"
                                            Width="80px" CssClass="txt"></asp:TextBox>
                                    </td>
                                    <td width="68" align="center" valign="bottom">
                                        <asp:ImageButton ID="btnLogin" runat="server" TabIndex="101" ImageUrl="~/Images/login_bt.gif"
                                            OnClick="btnLogin_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="6" rowspan="2" background="images/main_login_rightbg.gif">
                            <img src="images/main_login_rightbg.gif"></td>
                    </tr>
                    <tr>
                        <td height="30" align="center" valign="middle">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/arr5.gif" />
                            <asp:HyperLink ID="lnkRegister" runat="server" CssClass="no0" NavigateUrl="~/Main/Agreement.aspx">회원가입</asp:HyperLink>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/arr5.gif" />
                            <asp:HyperLink ID="lnkPassReminder" runat="server" CssClass="no0" NavigateUrl="~/MyPage/PasswordReminder.aspx">암호찾기</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td height="9" colspan="3">
                            <img src="images/main_login_bottom.gif" width="213" height="9">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!--로그인후-->
            <asp:Panel ID="pnlAfterLogin" runat="server" Height="100%" Width="100%">
                <table width="213" height="100" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="11" colspan="3">
                            <img src="images/main_loginon_top.gif"></td>
                    </tr>
                    <tr>
                        <td width="6" rowspan="2" background="images/main_loginon_leftbg.gif">
                            <img src="images/main_loginon_leftbg.gif"></td>
                        <td width="201" valign="top">
                            <table width="201" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="30" valign="middle">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="40px">
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="lblUserName" runat="server" Font-Size="13px" ForeColor="Blue"></asp:Label>
                                                    님 반갑습니다.</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" height="5" valign="middle">
                                        <asp:Panel ID="pnlOnlyPerson" runat="server" Width="100%">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40px">
                                                    </td>
                                                    <td width="80px" align="left">
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/arr.gif" />&nbsp;이력서</td>
                                                    <td>
                                                        <asp:Label ID="lblProfileCount" runat="server" ForeColor="Red"></asp:Label></td>
                                                    <td>
                                                        건</td>
                                                </tr>
                                                <tr>
                                                    <td width="40px">
                                                    </td>
                                                    <td align="left" width="80px">
                                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/arr.gif" />&nbsp;마일리지</td>
                                                    <td>
                                                        <asp:Label ID="lblMileage" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td>
                                                        점</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="6" rowspan="2" background="images/main_loginon_rightbg.gif">
                            <img src="images/main_login_rightbg.gif" /></td>
                    </tr>
                    <tr>
                        <td height="30px" align="center" valign="middle">
                            <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/arr5.gif" />
                            <asp:HyperLink ID="lnkLogout" runat="server" CssClass="no0" NavigateUrl="~/MyPage/DoLogout.aspx">로그아웃</asp:HyperLink>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/arr5.gif" />
                            <asp:HyperLink ID="lnkModifyProfile" runat="server" CssClass="no0">정보수정</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td height="9" colspan="3">
                            <img src="images/main_loginon_bottom.gif" width="213" height="9">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table> 
