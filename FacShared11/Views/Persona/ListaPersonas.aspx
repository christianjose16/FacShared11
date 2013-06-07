<%@ Page Title="Listado de personas" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of FacShared11.fac_persona))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListaPersonas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ListaPersonas</h2>

    <p>
        <%: Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr>
            <th>
                p_usuario
            </th>
            <th>
                p_primer_nombre
            </th>
            <th>
                p_segundo_nombre
            </th>
            <th>
                p_primer_apellido
            </th>
            <th>
                p_segundo_apellido
            </th>
            <th>
                p_correo
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%: item.p_usuario %>
            </td>
            <td>
                <%: item.p_primer_nombre %>
            </td>
            <td>
                <%: item.p_segundo_nombre %>
            </td>
            <td>
                <%: item.p_primer_apellido %>
            </td>
            <td>
                <%: item.p_segundo_apellido %>
            </td>
            <td>
                <%: item.p_correo %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

