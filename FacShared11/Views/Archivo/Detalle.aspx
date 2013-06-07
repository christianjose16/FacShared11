<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of FacShared11.fac_archivo)" %>
<%@ Register Src="~/Views/Comentario/CrearNuevo.ascx" TagName ="cmd" tagPrefix="cmdf"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalle</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="control-group warning"> 
            <label class="control-label" for="inputWarning">a_idarchivo</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: Model.a_idarchivo %> /></div>
        </div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_nombre_archivo</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: Model.a_nombre_archivo %> /></div></div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_tipo_archivo</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: Model.a_tipo_archivo %> /></div>
        </div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_tamaño</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: String.Format("{0:F}", Model.a_tamaño) %>/></div>
        </div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_usuario</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: Model.a_usuario %> /></div>
        </div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_link</label>
            <div class="controls"> <input type="text"  disabled="disabled" value=<%: Model.a_link %> /></div>
        </div>
        
        <div class="control-group warning">
            <label class="control-label" for="inputWarning">a_detalle</label>
            <div class="controls"> <p><%: Model.a_detalle %></p></div>
        </div>
        
    </fieldset>
    <cmdf:cmd runat="server" ID="panelComment"></cmdf:cmd>
    <p>

        <%: Html.ActionLink("Edit", "Edit", New With {.id = Model.a_idarchivo})%> |
        <%: Html.ActionLink("Back to List", "ListaArchivos")%>
    </p>
</asp:Content>

