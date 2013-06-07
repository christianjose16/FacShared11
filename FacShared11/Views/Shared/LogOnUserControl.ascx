<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%-- La siguiente línea permitirá solucionar la advertencia del compilador de ASP.NET --%>
<%: ""%>
<%
    If Request.IsAuthenticated Then
    %>
        ¡Bienvenido <code>(<%: Page.User.Identity.Name%>)</code>.!
        [ <%: Html.ActionLink("Cerrar sesión", "LogOff", "Account")%> ]
    <%
    Else
    %>
        
        <b>Deseas Ingresar? Si no estas registrado Hazlo.!</b>
        [ <%: Html.ActionLink("Iniciar sesión", "LogOn", "Account")%> ]
        [ <%: Html.ActionLink("Registrarte", "Register", "Account")%> ]
            <%        
    End If
%>