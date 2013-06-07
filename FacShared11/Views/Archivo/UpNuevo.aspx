<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UpNuevo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>UpNuevo</h2>
    <form action="<%: Url.Action("UpNuevo")%>" method="post">
        <input type="file" name="file1" runat="server" id="file1"/>
        <input class="btn-info" type="submit" value="Envia"/>
    </form>
        
</asp:Content>
