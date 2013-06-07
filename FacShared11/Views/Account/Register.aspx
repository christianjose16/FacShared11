<%@ Page Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of FacShared11.fac_persona)" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server"> Registrarse </asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Darte de alta</h2>
    <p>
        Complete los siguientes datos. 
    </p>

    <% Using Html.BeginForm() %>
        <%: Html.ValidationSummary(True, "La cuenta no se creó correctamente. Corrija los errores y vuelva a intentarlo.")%>
        <div>
            <fieldset>
                <legend>Información de la cuenta</legend>
                
                <div class="editor-label">
                    Nombre de Usuario
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_usuario)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_usuario)%>
                </div>
                <div class="editor-label">
                    Primer Nombre
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_primer_nombre)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_primer_nombre)%>
                </div>
                <div class="editor-label">
                    Segundo Nombre
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_segundo_nombre)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_segundo_nombre)%>
                </div>
                <div class="editor-label">
                    Primer Apellido
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_primer_apellido)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_primer_apellido)%>
                </div>
                <div class="editor-label">
                    Segundo Apellido
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_segundo_apellido)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_segundo_apellido)%>
                </div>
                
                <div class="editor-label">
                    Correo Electrónico
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(Function(m) m.p_correo)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_correo)%>
                </div>
                
                <div class="editor-label">
                    Contraseña
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(Function(m) m.p_password)%>
                    <%: Html.ValidationMessageFor(Function(m) m.p_password)%>
                </div>
                
                <p>
                    Estas Listo.!
                </p>
                <p>
                    <input type="submit" class="btn" value="Registrarse" />
                </p>
            </fieldset>
        </div>
    <% End Using %>
</asp:Content>

