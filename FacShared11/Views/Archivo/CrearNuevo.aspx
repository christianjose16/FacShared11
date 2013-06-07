<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CrearNuevo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>NUEVA CARGA</h2>
    <br />
    
    <form action="<%: Url.Action("Upload") %>" enctype="multipart/form-data" method="post">
    <fieldset>
        <legend>DATOS DEL ARCHIVO</legend>
        
        <div class="editor-label">Selecciona tu archivo</div>
        <div class="editor-field"><input  type="file" name="fichero" size="40" /></div>
        <div class="editor-label">Agrega una descripción</div>
        <div class="editor-field"><textarea rows="6" cols="100"  id="descripcion" name="descripcion" ></textarea> </div>
        <br />
        <p><input type="submit" class="btn btn-warning" value="Subir Archivo" /></p>
    </fieldset>
    </form>

    </asp:Content>

