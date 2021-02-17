<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeAddControl.ascx.cs" Inherits="Admin_SCM_NoticeAddControl" %>

 <link rel="stylesheet" href="build/kalendae.css" type="text/css" charset="utf-8">
	<script src="build/kalendae.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css" media="screen">
		.kalendae .k-days span.closed {
			background:red;
		}
	</style>
	
 <!--1-->

<table width=98% style="border: 1px solid #d7d7d7">

<tr height=30  bgcolor="#5D7B9D"><td  colspan=4 align=center><font color="#ffffff"><b>JobLink Project</b></td></tr> 
<tr height=30>
<td bgcolor="#efefef" width="10%" align=center><b> 프로젝트명 </b></td>
<td align=left><b><asp:TextBox ID="txtTitle" runat="server" Width="80%"></asp:TextBox> </b></td> 
<td bgcolor="#efefef" width="10%" align=center><b> 일자 </b></td>
<td  align=left><b><asp:TextBox ID="txtps"  class="auto-kal"  runat="server" Width="20%"></asp:TextBox></b>
</td></tr></table>
<br> 

<table width=98% border="1" bordercolor="#d7d7d7">

<tr height=30>
<td bgcolor="#efefef" width="10%" align=center><b> 고객사 </b></td>
<td  width="40%" align=left><b><asp:TextBox ID="txtts1" runat="server" Width="50%"></asp:TextBox>&nbsp;&nbsp;Code </b>
<asp:DropDownList ID="txtcode1" runat="server">
<asp:ListItem Value="일반">일반</asp:ListItem>
    <asp:ListItem Value="공공">공공</asp:ListItem>
        <asp:ListItem Value="금융">금융</asp:ListItem>
	<asp:ListItem Value="통신">통신</asp:ListItem>
	<asp:ListItem Value="보험">보험</asp:ListItem>
	<asp:ListItem Value="의료">의료</asp:ListItem>
	 	
	</asp:DropDownList> 	</td>	
<td bgcolor="#efefef" width="10%" align=center><b> 이미지 </b></td><td  align=left width="40%"><asp:FileUpload ID="FileUpload1" runat="server" /></asp:FileUpload></td></tr>
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 기간</b></td><td  width="40%" align=left><nobr><b><asp:TextBox ID="txtlink1" runat="server"   width="30%"></asp:TextBox>개월  년 연간계약</td>
<td bgcolor="#efefef" width="10%" align=center><b> 언어 </b></td><td width="40%" align=left><nobr>
<asp:DropDownList ID="txtlang1" runat="server">
																<asp:ListItem Value="JAVA">JAVA</asp:ListItem>
																<asp:ListItem Value="C#.NET">C#.NET</asp:ListItem>
																<asp:ListItem Value="ASP">ASP</asp:ListItem>
																<asp:ListItem Value="C">C</asp:ListItem>	
																<asp:ListItem value="PRO-C"> PRO-C</asp:ListItem>
						                                        <asp:ListItem value="C++"> C++</asp:ListItem>
						                                        <asp:ListItem value="COBOL"> COBOL</asp:ListItem>
																<asp:ListItem value="VB"> VB</asp:ListItem>
																<asp:ListItem value="PHP"> PHP</asp:ListItem>
																<asp:ListItem value="Python"> Python</asp:ListItem>
																<asp:ListItem value="VB"> VB</asp:ListItem>
						                                        <asp:ListItem value="VC++"> VC++</asp:ListItem>																
																
																<asp:ListItem Value="ABAP">ABAP</asp:ListItem>
																<asp:ListItem Value="ANDROID">ANDROID</asp:ListItem>
																<asp:ListItem value="IOS"> IOS</asp:ListItem>
																<asp:ListItem Value="ANDROID.IOS">ANDROID.IOS</asp:ListItem>	
																
																<asp:ListItem value="BI"> BI</asp:ListItem>
																<asp:ListItem value="B0"> BO</asp:ListItem>					
																 
																<asp:ListItem value="퍼블리싱"> 퍼블리싱</asp:ListItem>	
						                                        <asp:ListItem value="CSS"> CSS</asp:ListItem>
																
																
						                                        <asp:ListItem value="DB"> DB</asp:ListItem>
																<asp:ListItem value="DBA"> DBA</asp:ListItem>
																<asp:ListItem value="Oracle">Oracle</asp:ListItem>																
																<asp:ListItem value="MS-Sql">MS-Sql</asp:ListItem>																
																<asp:ListItem value="My-Sql">My-Sql</asp:ListItem>																


																
																<asp:ListItem value="DESIGN"> DESIGN</asp:ListItem>
						                                        <asp:ListItem value="DELPHI"> DELPHI</asp:ListItem>
																<asp:ListItem value="DW"> DW</asp:ListItem>	
																<asp:ListItem value="EXE-Exceed">EXE-Exceed</asp:ListItem>
																<asp:ListItem value="EAI"> EAI</asp:ListItem>
						                                        <asp:ListItem value="HTML"> HTML</asp:ListItem> 
																<asp:ListItem value=" ITO OP">  ITO OP</asp:ListItem>
						                                        <asp:ListItem value="JS"> JS</asp:ListItem>
						                                        <asp:ListItem value="JSP"> JSP</asp:ListItem>
																<asp:ListItem value="JEUS"> JEUS</asp:ListItem>
						                                        <asp:ListItem value="LINUX"> LINUX</asp:ListItem>
						                                        <asp:ListItem value="NETWORK"> NETWORK</asp:ListItem>
																<asp:ListItem value="Nexacro"> Nexacro</asp:ListItem> 
																
																<asp:ListItem value=" MES">  MES</asp:ListItem>
																<asp:ListItem value="Miplatform"> Miplatform</asp:ListItem>	
																<asp:ListItem value="MSTR"> MSTR</asp:ListItem>	
						                                        
						                                         <asp:ListItem value="PM">PM</asp:ListItem>
																<asp:ListItem value="Power Builder">Power Builder</asp:ListItem>
						                                        
						                                        <asp:ListItem value="QA"> QA</asp:ListItem>
						                                         
																<asp:ListItem value="Solution">Solution</asp:ListItem>
																
																<asp:ListItem value="OLAP">OLAP</asp:ListItem>	
						                                        
						                                         
																<asp:ListItem value="WebLogic"> WebLogic</asp:ListItem>																
																<asp:ListItem value="WebSphere"> WebSphere</asp:ListItem>
																<asp:ListItem value="WebSquare">WebSquare</asp:ListItem>
																<asp:ListItem value="TA">TA</asp:ListItem>																
						                                        <asp:ListItem value="임베디드"> 임베디드</asp:ListItem> 
																<asp:ListItem value=" 보안 엔지니어">  보안 엔지니어</asp:ListItem>
																<asp:ListItem value=" 빅데이터">  빅데이터</asp:ListItem> 
																<asp:ListItem value="웹기획"> 웹기획</asp:ListItem>
																<asp:ListItem value="서버이관">서버이관</asp:ListItem> 
																</asp:DropDownList>
</td></tr> 
<td bgcolor="#efefef" width="10%" align=center><b> 업무</b></td>		
<td width="40%" align=left><nobr><asp:DropDownList ID="txtsec1" runat="server">
																<asp:ListItem value="개발(SI)"> 개발(SI)</asp:ListItem>
						                                        <asp:ListItem value="운영(SM)"> 운영(SM)</asp:ListItem>
						                                        <asp:ListItem value="PM"> PM</asp:ListItem>
						                                        <asp:ListItem value="PMO"> PMO</asp:ListItem>
						                                        <asp:ListItem value="모바일"> 모바일</asp:ListItem>
																<asp:ListItem value="디자인"> 디자인</asp:ListItem>
						                                        <asp:ListItem value="QA"> QA</asp:ListItem>
						                                        <asp:ListItem value="기획"> 기획</asp:ListItem>
						                                        <asp:ListItem value="SERVER개발"> SERVER개발</asp:ListItem>
						                                        <asp:ListItem value="웹기획"> 웹기획</asp:ListItem>
						                                        <asp:ListItem value="모바일기획"> 모바일기획</asp:ListItem>
																<asp:ListItem value="Oracle컨설턴트"> Oracle컨설턴트</asp:ListItem>
																<asp:ListItem value="SAP컨설턴트"> SAP컨설턴트</asp:ListItem>	
																<asp:ListItem value="서버이관">서버이관</asp:ListItem>																
																</asp:DropDownList>		
																</td>  
																
<td bgcolor="#efefef" width="10%" align=center><b> 기술</b></td>
<td width="40%" align=left><nobr><asp:TextBox ID="txttech1"  runat="server"   width="90%"></asp:TextBox></td></tr>  
																
																
																
<tr>
<td bgcolor="#efefef" width="10%" align=center><b> 진행</b></td>
<td width="40%" align=left>
<asp:RadioButtonList ID="txtProgress1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="Radio">
    <asp:ListItem Value="접수">접수</asp:ListItem>
    <asp:ListItem Value="종료">종료</asp:ListItem>
    <asp:ListItem Value="연장">연장</asp:ListItem>
	</asp:RadioButtonList> 
</nobr></td>   
	 
<td bgcolor="#efefef" width="10%" align=center><b> 마감일자 </b></td>
<td align=left><nobr>
<asp:TextBox ID="txtDead1" runat="server"   width="20%" class="auto-kal"> </asp:TextBox> 
&nbsp;&nbsp;업체
<asp:DropDownList ID="txtcorp1" runat="server">
    <asp:ListItem Value="(주) 유윙 임형수 대표이사 ">임형수</asp:ListItem>
    <asp:ListItem Value="(주)아이테크솔루션그룹 공진석 이사"> 공진석</asp:ListItem>
    <asp:ListItem Value="엘투시스템 이용모 이사">이용모</asp:ListItem>
    <asp:ListItem Value="(주)원솔루션 허두영">허두영</asp:ListItem>
	<asp:ListItem Value="(주)아이앤시스템 최철묵 상무">최철묵</asp:ListItem>
</asp:DropDownList> 
</td> 
</tr></table>
<br>





<table width=98% border="1" bordercolor="#d7d7d7">
<tr>

<td bgcolor="#efefef" width="10%" align=center rowspan=2><b> 내용 </b></td>
<td width="40%" align=left valign=top><asp:TextBox ID="txtcs1" runat="server" TextMode="MultiLine"  width="100%" Rows="30">
⊙ 고객 : 
⊙ 업무 :   
⊙ 언어 : 
⊙ 근무 : 
⊙ 등급 :  
⊙ 기간 :  
⊙ 필수 :  
⊙ 기타 :  </asp:TextBox>

</td> 
<td bgcolor="#efefef" width="10%" align=center><b> 비고 </b></td>
<td width="40%"  align=left><b><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" width="100%" Rows="30" ></asp:TextBox></b></td></tr>
<tr><td colspan=3>
SCM_Notice/scm_project2/scm_project3/scm_project4/scm_project5 | 공공 프로젝트 2건 외  민간 프로젝트 2건 외 금융 프로젝트 2건 외 통신 프로젝트 2건 외<br> 
공공 프로젝트 지원자는 반드시 COSA 자격증이 필요합니다.<br> 
 JAVA  .NET   JQUERY ABAP  ANDROID  ASP  C  PROC-C  C++  COBOL  CSS   DESIGN   DELPHI  HTML5  IOS   JS  JSP  LINUX  NETWORK  PHP  POWER BUILDER  PYTHON    RUBY   VB  VC++   임베디드 
 <br><br> 
 </td></tr>
 </table> 











 
<table width="100%" border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/Images/ok_bt.gif" OnClick="btnSubmit_Click" />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/cancel_bt.gif"
                            OnClick="btnCancel_Click" />
                </td></tr>
            </table>



 
                                                                
													
						                                

 
                        
                           
                        
