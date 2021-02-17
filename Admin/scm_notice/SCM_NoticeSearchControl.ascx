<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeSearchControl.ascx.cs"
    Inherits="Admin_SCM_NoticeSearchControl" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
 <table width="670" border="0" cellpadding="0" cellspacing="0">
                            
                            <tr>
                                <td height="40" align="center">  
								<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                <asp:GridView ID="ctlNoticeList" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                    Width="100%" Font-Size="11px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    OnPageIndexChanging="ctlNoticeList_PageIndexChanging">
                                    <Columns>








						 <asp:TemplateField HeaderText="번호">
                                                                    <ItemTemplate>
                                                                        <%#Eval("NoticeID") %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="제목">
                                                                    <ItemTemplate>
                                                                        <a href='scm_NoticeView.aspx?NoticeID=<%#Eval("NoticeID") %>'>
                                                                            <%#FuncCutStrng(Eval("Title")) %>
                                                                            &nbsp;
                                                                            <%#FuncNew(Eval("PostDate")) %>
                                                                        </a>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="380px" HorizontalAlign="Left" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="글쓴이">
                                                                    <ItemTemplate>
                                                                        <a href="mailto:okay2000@101sys.com">관리자 </a>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="70px" HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="PostDate" HeaderText="작성일" DataFormatString="{0:yyyy-MM-dd}"
                                                                    HtmlEncode="False">
                                                                    <ItemStyle HorizontalAlign="Center" Width="160px" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="160px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ReadCount" HeaderText="조회수">
                                                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                </asp:BoundField>
                                                            </Columns>

                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <EditRowStyle BackColor="#999999" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#cccccc" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />



                                                        </asp:GridView>
                                                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    
<tr>
                                            <td height=5 ><hr size=1></td></tr>
                             </table>

				<table width="670" border="0" cellpadding="0" cellspacing="0">
				<tr><td align=right  valign="top" width=470>

                                    <asp:Panel ID="Panel1" runat="server" Width="100%" DefaultButton="btnSearch">
                                        <asp:DropDownList ID="lstField" runat="server" CssClass="DropList">
                                            <asp:ListItem Selected="True" Value="Title">제목</asp:ListItem>
                                            <asp:ListItem Value="Content">내용</asp:ListItem>
                                        </asp:DropDownList></td>
					<td>
                                        <asp:TextBox ID="txtQuery" runat="server" CssClass="txt"></asp:TextBox></td>
                                        <td width=3></td>
					<td><asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/find_bt.gif"
                                            OnClick="btnSearch_Click1" />







                                        
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    