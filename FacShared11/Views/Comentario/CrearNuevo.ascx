<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of FacShared11.fac_comentario)" %>

    <%-- The following line works around an ASP.NET compiler warning --%>
    <%: ""%>
    <% Using Html.BeginForm()%>
        <%: Html.ValidationSummary(True) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(Function(model) model.c_idarchivo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(Function(model) model.c_idarchivo) %>
                <%: Html.ValidationMessageFor(Function(model) model.c_idarchivo) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(Function(model) model.c_usuario) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(Function(model) model.c_usuario) %>
                <%: Html.ValidationMessageFor(Function(model) model.c_usuario) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(Function(model) model.c_texto) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(Function(model) model.c_texto) %>
                <%: Html.ValidationMessageFor(Function(model) model.c_texto) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(Function(model) model.c_estado) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(Function(model) model.c_estado) %>
                <%: Html.ValidationMessageFor(Function(model) model.c_estado) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>


