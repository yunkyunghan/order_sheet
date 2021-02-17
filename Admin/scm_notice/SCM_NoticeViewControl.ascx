<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeViewControl.ascx.cs" Inherits="Admin_SCM_NoticeViewControl" %>

 
<table style="border: 1px solid #d7d7d7">
<asp:Label ID="lblNoticeError" runat="server" ForeColor="Red"></asp:Label>
</td></tr></table>   

   
 <table width=98% style="border: 1px solid #d7d7d7">
<tr height=30  bgcolor="#5D7B9D"><td  colspan=4 align=center><font color="#ffffff"><b>JobLink Project</b></td></tr> 
<tr height=30>
<td bgcolor="#efefef" width="10%" align=center><b> Title </b></td>
<td     align=left><b><asp:Label ID="lblTitle" runat="server"></asp:Label></b></td>  

<td bgcolor="#efefef" width="10%" align=center><b> 일자 </b></td>
<td  align=left><b><asp:Label ID="lblps" runat="server"></asp:Label></b>
</td></tr></table>
<br> 			
			


			
<% if (lblts1.Text != "")  { %>
 <table width=98% border="1" bordercolor="#d7d7d7">
<tr height=30>
<td bgcolor="#efefef" width="10%" align=center><b> 고객사 </b></td>
<td  width="30%" align=left><b><asp:Label ID="lblts1" runat="server"></asp:Label></b>&nbsp;&nbsp; Code <b><asp:Label ID="lblcode1" runat="server"></asp:Label></b></td>
<td bgcolor="#efefef" width="10%" align=center rowspan=8><b> 내용 </b></td>
<td width="50%" align=left valign=top rowspan=8><asp:Label ID="lblcs1" runat="server"></asp:Label></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 이미지 </b></td><td  align=left>
<% if (lblFileName.Text != "")  { %>
<img src ="../../fileUpload/notice/<%= lblFileName.Text %>" width=50%>
<%} else { %> 
<%} %>
<!--<asp:Label ID="lblFileName" runat="server"></asp:Label><asp:Button  ID="btnFile"  runat="server" onclick="btnFile_Click" Text="download" />--></td></tr>

<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 프로젝트 명 </b></td><td  align=left><b><asp:Label ID="lbllink1" runat="server"></asp:Label></b></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 언어 </b></td><td  align=left><b><asp:Label ID="lbllang1" runat="server"></asp:Label></b></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 기술 </b></td><td  align=left><b><asp:Label ID="lbltech1" runat="server"></asp:Label></b></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 업무 </b></td><td  align=left><b><asp:Label ID="lblsec1" runat="server"></asp:Label></b></td></tr>


<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 진행 </b></td><td   align=left><b><asp:Label ID="lblProgress1" runat="server"></asp:Label></b></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 마감 </b></td><td  align=left><b><asp:Label ID="lblDead1" runat="server"></asp:Label></b></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 업체 </b></td><td  align=left><b><asp:Label ID="lblcorp1" runat="server"></asp:Label></b></td></tr>
</table>
<%} else { %> 
<%} %>
<br>  

 <table width=98% border="1" bordercolor="#d7d7d7">
<tr height=30><td bgcolor="#efefef" width="10%" align=center><b> 내용 </b></td>
    <td   align=left><b><asp:Label ID="lblContent" runat="server"></asp:Label></b></td></tr>
<tr><td colspan=2>
SCM_Notice/scm_project2/scm_project3/scm_project4/scm_project5 | 공공 프로젝트 2건 외  민간 프로젝트 2건 외 금융 프로젝트 2건 외 통신 프로젝트 2건 외<br>
공공 프로젝트 지원자는 반드시 COSA 자격증이 필요합니다.
</td></tr>
 </table> 
 
  
 
 
 
 
 
 
 
 
 
 
 
 




<table width=98% border="0" cellpadding="0" cellspacing="0" bgcolor="#5D7B9D" height=30>
                                        <tr><td width="80px" align=center><font color="#ffffff"><b>작성자</b></td>
                                            <td width="5px"></td>
                                            <td width="160px" align=left><font color="#ffffff">관리자</td>
                                            <td width="80px"><font color="#ffffff"><b>작성일</b></td>
                                            <td width="5px"></td>
                                            <td width="150px" align=left><font color="#ffffff"> 
					   <asp:Label ID="lblPostDate" runat="server"></asp:Label></td>
                                            <td width="80px"><font color="#ffffff"><b>조회수</b></td>
                                            <td width="5px"> </td>
                                            <td width="100px" align=left><font color="#ffffff">
                                                <asp:Label ID="lblReadCount" runat="server"></asp:Label>
                                            </td>  </tr>
                                    </table>     

<table width=98% border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnList" runat="server" ImageUrl="~/Images/list_bt.gif" OnClick="btnList_Click" />
                        <asp:ImageButton ID="btnmodify" runat="server" ImageUrl="~/Images/re_bt.gif" OnClick="btnmodify_Click" />
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete_bt.gif" 
                                        OnClick="btnDelete_Click" style="height: 24px" />
                </td></tr>
            </table>
   

<!--
<asp:Label ID="lblFileName2" runat="server"></asp:Label><asp:Button  ID="btnFile2"  runat="server" onclick="btnFile_Click" Text="download" />
<asp:Label ID="lblFileName3" runat="server"></asp:Label><asp:Button  ID="btnFile3"  runat="server" onclick="btnFile_Click" Text="download" />
<asp:Label ID="lblFileName4" runat="server"></asp:Label><asp:Button  ID="btnFile4"  runat="server" onclick="btnFile_Click" Text="download" />
<asp:Label ID="lblFileName5" runat="server"></asp:Label><asp:Button  ID="btnFile5"  runat="server" onclick="btnFile_Click" Text="download" />-->

