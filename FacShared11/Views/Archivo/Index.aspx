<%@ Page Title="Archivos con FACShared :-)" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	OPCIONES PARA ARCHIVOS
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>OPCIONES CON ARCHIVOS</h2>
            <ul id="menu">
                <li><%: Html.ActionLink("Mis Archivos", "ListaArchivos", "Archivo")%></li>
                <li><%: Html.ActionLink("Subir Archivo", "CrearNuevo", "Archivo")%></li>
            </ul>
            <div class="alert-info">
                 <p><%: ViewData("MessageFiles")%></p>
            </div>
                       
</asp:Content>
