<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginSubControl.ascx.cs" Inherits="LoginSubControl" %>




<table width="600" height=50  border="0" cellspacing="0" cellpadding="0" bgcolor="#d7d7d7"> 
<tr><td align=center valign=middle>                        
                                                       
                                    <table width=600 border="0" cellspacing="0" cellpadding="0">
<tr><td  align=left valign=top><asp:RadioButtonList ID="lstDiv" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"><asp:ListItem Selected="True" Value="1"></asp:ListItem>
</asp:RadioButtonList></td>
                                     

<td width="50"  align="center" valign="top"><b>ID</b></td>
<td width="130" align="left" valign="top"><asp:TextBox ID="txtUserID" runat="server" CssClass="txt" MaxLength="18" Width="180px" TabIndex="50"></asp:TextBox></td>
<td  width="50"  align="center" valign="top"><b>PW</b></td>
<td align="left" valign="top"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="18" CssClass="txt"  Width="180px" TabIndex="51"></asp:TextBox></td>
<td width="80"  valign="top"><asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/images/user_f_bt2.gif" TabIndex="52"  OnClick="btnLogin_Click" /></td></tr>
                                        
		
                                    </table></td></tr>

<tr><td  valign=top><b><asp:Label ID="lblError" runat="server"  ForeColor="Red"></b></asp:Label></td></tr></table>
<table width="649"  border="0" cellspacing="0" cellpadding="0" border=0 align=center> 
<tr><td width=20>&nbsp;</td><td valign="middle"  align="left" width=130>
<p><asp:HyperLink ID="lnkPasswordRemonder" runat="server" NavigateUrl="~/MyPage/PasswordReminder.aspx" CssClass="no4">
<!img src="images/btn_idsearch.gif" border=0></asp:HyperLink>
</td><td align=left><font face="돋움" size=3>&nbsp;&nbsp;&nbsp;&nbsp; </td></tr></table>
