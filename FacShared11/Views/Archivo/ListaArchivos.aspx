<%@ Page Title="Mis Archivos subidos" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of FacShared11.fac_archivo))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Listado De Archivos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Listado de Archivos</h2>

    <p>
        <%: Html.ActionLink("Subir Archivo", "CrearNuevo")%>
    </p>
    
    <table>
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Tamaño
            </th>
            <th>
                Propietario
            </th>
            <th>
                Descripcion
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver mas Info.", "Detalle", New With {.id = item.a_idarchivo})%>
            </td>
            
            <td>
                <%: item.a_nombre_archivo %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.a_tamaño) %>
            </td>
            <td>
                <%: item.a_usuario %>
            </td>
            
            <td>
                <%: item.a_detalle %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

