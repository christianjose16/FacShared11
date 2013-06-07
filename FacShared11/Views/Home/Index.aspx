<%@ Page Language="VB"Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="~/Views/Shared/LogOnUserControl.ascx" TagName="LogIn" TagPrefix="log" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Iniciar Sesion</title>
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="padding:40px; background-color:White; margin:20px">
<h1>FAC.Shared.</h1>
<h3>Sitio de Descargas Online :-)</h3>
<h4>Bienvenido...!</h4>
    <div style="padding:20px; width:620px; background-color:#FFFFCC">
        <p>El mejor sitio para compartir archivos</p>
        <br />
       <log:Login runat="server"></log:Login>
       <br />
       <img alt="LOGO" style="text-align:center; margin:10px;" src="../../Contenido/Logo.png" width="500px"/>
    </div>
</div>
</body>
</html>
