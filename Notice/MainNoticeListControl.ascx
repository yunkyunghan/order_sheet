<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainNoticeListControl.ascx.cs"
    Inherits="Main_MainNoticeListControl" %>

            
                            <table border="10" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:HyperLink ID="lnkNotice" runat="server" NavigateUrl="~/Notice/Default.aspx"
                                            ImageUrl="~/Images/title_bar_3_a.gif"></asp:HyperLink></td>
                                    <td align="right">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Notice/Default.aspx"
                                            CssClass="no2" ImageUrl="~/Images/more.gif"></asp:HyperLink></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td  colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" height=1 background="../Images/dot_.gif">
                                        
                                    </td>
                                </tr>
					<tr>
                                    <td colspan="3" height=3>
                                        
                                    </td>
                                </tr>
                                <asp:Literal ID="ltlNoticeList" runat="server"></asp:Literal>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                   
       
