<%@ Page Language="C#" MasterPageFile="MasterPageNotice.master" Title="충정교회" %>

<%@ Register Src="NoticeListControl.ascx" TagName="NoticeListControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:NoticeListControl ID="NoticeListControl1" runat="server" />
</asp:Content>

