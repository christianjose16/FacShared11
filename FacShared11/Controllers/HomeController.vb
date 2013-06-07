<HandleError()> _
Public Class HomeController
    Inherits System.Web.Mvc.Controller

    Function Index() As ActionResult
        If Request.IsAuthenticated Then
            Return RedirectToAction("Home", "Home", "Home.aspx")
        Else
            Return View()
        End If
    End Function
    Function Home() As ActionResult
        If Request.IsAuthenticated Then
            ViewData("Message") = Session("nombre")
            Return View()
        Else
            Return RedirectToAction("Index", "Home", "Index.aspx")
        End If
    End Function

    Function About() As ActionResult
        Return View()
    End Function
End Class
