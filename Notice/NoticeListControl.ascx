<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NoticeListControl.ascx.cs"  Inherits="Notice_NoticeListControl" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>


                    
                            <DIV class=view-thumb-txt>
			<TABLE  class=tbl-news-list>

				<TBODY>
						<TR>
						<td valign=top>
						<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        
						<ContentTemplate>
  							<asp:GridView ID="ctlNoticeList" runat="server" AutoGenerateColumns="False" GridLines="None" 
						AllowPaging="true" PageSize="10" CellPadding="0" ForeColor="#c0c0c0" >
                                                
						<Columns>					 
                                                    <asp:TemplateField HeaderText="" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center"
                                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" HeaderStyle-height="1px">
                                                        
							<ItemTemplate><%#Eval("NoticeID") %></ItemTemplate>
                                                        <ItemStyle  HorizontalAlign="Center" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>



                                                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <a href='NoticeView.aspx?NoticeID=<%#Eval("NoticeID") %>'>
                                                                <%#FuncCutStrng(Eval("Title")) %><%#FuncNew(Eval("PostDate")) %>
                                                            </a>
                                                        </ItemTemplate>
									
									<ItemStyle   HorizontalAlign="Left" />
                                                        <HeaderStyle HorizontalAlign="Center" />
								</asp:TemplateField>

                                                         <asp:TemplateField HeaderText="">  
                                                        <ItemTemplate>
                                                            <a href='NoticeView.aspx?NoticeID=<%#Eval("NoticeID") %>'><img src="../images/book.png" BORDER=0 width=30></a>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>



                                               </Columns>                                              

 					        <FooterStyle BackColor="#c0c0c0" Font-Bold="True" ForeColor="Black" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#000000" />
                                                <EditRowStyle BackColor="#000000" />
 
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#F7F6F3" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                     </asp:GridView>					 


                                            <asp:Label ID="lblNoticeError" runat="server" ForeColor="Red"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div></td>
                            </tr>


<tr><td height=1 bgcolor="#d7d7d7"> 
				</td></tr></table>	
	 						</div>

							<p style="margin-top:10%;">
 
				<p style="margin-top:20px;">

						<TABLE width=100%>								
				<tr><td  align=center valign=top><a href="#top"><img src="../images/up_icon_1.gif" BORDER=0 width=90></a>&nbsp;</td></tr>
					</td></tr></table>	
	 						</div>
							 




  
				<!--<table width=300  border="0" cellpadding="0" cellspacing="2" align=center>
 
                            <tr>
                                <td align=right valign="middle">
                                    <asp:Panel ID="Panel1" runat="server" Width="80%" DefaultButton="btnSearch">
                                        <asp:DropDownList ID="lstField" runat="server" CssClass="DropList">
                                            <asp:ListItem Selected="True" Value="Title">제&nbsp;&nbsp;&nbsp;목</asp:ListItem> 
                                             <asp:ListItem Value="Content">내&nbsp;&nbsp;&nbsp;용</asp:ListItem>
                                        </asp:DropDownList></TD> 
                                        <TD   align=right><asp:TextBox ID="txtQuery" runat="server" height=18></asp:TextBox> </td>                                    

					<TD   align=left><asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/find_bt.gif"  
                                OnClick="btnSearch_Click1" />                                       
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>-->
                    
 