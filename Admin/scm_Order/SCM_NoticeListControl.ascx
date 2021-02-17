<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeListControl.ascx.cs" Inherits="Admin_SCM_NoticeListControl" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                      <table width=98%  border="0" cellpadding="0" cellspacing="0"> 
			<tr><td height="30" colspan=9 align=center bgcolor="#5D7B9D"><font color="#ffffff"><b>발주 현황 알림</b></font></td></tr>
			    <tr><td height="40" align="center">


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="ctlNoticeList" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                    Width="100%" Font-Size="11px" CellPadding="4" ForeColor="#333333"  PageSize="50"
                                    OnPageIndexChanging="ctlNoticeList_PageIndexChanging">

                                    <Columns>
                                        <asp:BoundField DataField="SCM_OrderID" HeaderText="번호" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center"
                                            HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" />
                                      

                    <asp:TemplateField HeaderText="분류">
                            <ItemTemplate>
                                <a href='SCM_NoticeView.aspx?SCM_OrderID=<%#Eval("SCM_OrderID") %>'>
                                    <%#FuncCutStrng(Eval("serial_num"))%>
                                    &nbsp;
                                
                                </a>
                            </ItemTemplate>
                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                    </asp:TemplateField>

					  <asp:TemplateField HeaderText="회사명">
                                            <ItemTemplate>
                                                <a href='SCM_NoticeView.aspx?SCM_OrderID=<%#Eval("SCM_OrderID") %>'>
                                                    <%#FuncCutStrng(Eval("c_name"))%>
                                                    &nbsp;
                                                    <%#FuncNew(Eval("PostDate")) %>
                                                 </a>
                                            </ItemTemplate>
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
										
										
										<asp:TemplateField HeaderText ="사업자등록번호">
                                <ItemTemplate>                                     
                                    <%#FuncCutStrng(Eval("c_num"))%>	                                 
                                </ItemTemplate>
                                <ItemStyle Width ="10%" HorizontalAlign ="center" />
                             </asp:TemplateField> 
                                        
						<asp:TemplateField HeaderText ="납기일자">
                                <ItemTemplate>                                     
                                    <%#FuncCutStrng(Eval("due_date"))%>	                                 
                                </ItemTemplate>
                                <ItemStyle Width ="10%" HorizontalAlign ="Center" />
                             </asp:TemplateField>
							 
							 	
							 
							 <asp:TemplateField HeaderText ="수량합계">
                                <ItemTemplate>                                     
                                    <%#FuncCutStrng(Eval("t_amount"))%>	                                 
                                </ItemTemplate>
                                <ItemStyle Width ="8%" HorizontalAlign ="Center" />
                             </asp:TemplateField>
							 
							 <asp:TemplateField HeaderText ="공급가액합계">
                                <ItemTemplate>                                     
                                    <%#FuncCutStrng(Eval("t_uniprice"))%>                                
                                </ItemTemplate>
                                <ItemStyle Width ="10%" HorizontalAlign ="right" />
                             </asp:TemplateField>
							 
							 
							 
							 
							 
                         <asp:TemplateField HeaderText ="부가세합계">
                                <ItemTemplate>                                     
                                    <%#FuncCutStrng(Eval("t_vat"))%>	                                 
                                </ItemTemplate>
                                <ItemStyle Width ="10%" HorizontalAlign ="right" />
                             </asp:TemplateField>
							 
							 
						<asp:TemplateField HeaderText="총합계">
                                            <ItemTemplate> 
                                            <%#FuncCutStrng(Eval("t_price"))%>											   
                                            </ItemTemplate>
                                            <ItemStyle Width="13%" HorizontalAlign="right" />
                                        </asp:TemplateField> 
							 
							 
												
							  

                                        <asp:BoundField DataField="PostDate" HeaderText="작성일" HtmlEncode="False" DataFormatString="{0:yyyy-MM-dd}">
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundField>
										
                                        <asp:BoundField DataField="ReadCount" HeaderText="조회">
                                            <ItemStyle HorizontalAlign="Center"  Width="5%" />
                                        </asp:BoundField>
										
										   
								
										
										
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="center"   />
                                        </asp:TemplateField>
										
										
										
										
							 	
										
										
										
										
										
										
										
										
										
										
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#d7d7d7" Font-Bold="True" ForeColor="black" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td height="1" bgcolor="#cccccc">
                    </td>
                </tr>
<tr><td colspan=3 align=right>
				

<table    border="0" cellpadding="1" cellspacing="1" align=right>
                <tr>
                    <td height="40" align="right" valign="top">
                         <asp:Panel ID="Panel1" runat="server" Width="100%" DefaultButton="btnSearch">
                             <asp:DropDownList ID="lstField" runat="server" CssClass="DropList">
                                 <asp:ListItem Selected="True" Value="Title">제목</asp:ListItem> 
                                  <asp:ListItem Value="content2">내용</asp:ListItem>
                             </asp:DropDownList></td>                        
                             
			                  <td height="40" align="left" valign="top">
			                     <asp:TextBox ID="txtQuery" runat="server" CssClass="txt"></asp:TextBox>
			                  </td>
                              <td height="40" align="left" valign="top"><nobr><asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/find_bt.gif" OnClick="btnSearch_Click" />
                                 <asp:ImageButton ID="btnWrite" runat="server" ImageUrl="~/Images/write_bt.gif" OnClick="btnWrite_Click" />
                                 <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete_bt.gif" OnClick="btnDelete_Click" />
                                 <!--<asp:ImageButton ID="btnPush" runat="server" ImageUrl="~/Images/Push_bt.gif" OnClick="btnPush_Click" />-->
                              </td>
                         </asp:Panel>

<!--<td   align="center" valign="middle" width=100 bgcolor="red"><a href="./PushNotice.ashx?aaa=12345"><font color="#ffffff"><b>PushNotice</b></font></TD>-->
</tr></table> 





</tr></table> 

 
       
 </td></tr></table> 
 </td></tr></table> 
