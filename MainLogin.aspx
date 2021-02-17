<%@ Page Language="C#" MasterPageFile="MasterPageLogin.master" Title="프로젝트" %>
<%@ Register Src="LoginSubControl.ascx" TagName="LoginSubControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:LoginSubControl ID="LoginSubControl1" runat="server" />
</asp:Content>

