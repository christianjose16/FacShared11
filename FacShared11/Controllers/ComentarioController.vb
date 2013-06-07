Namespace FacShared11
    Public Class ComentarioController
        Inherits System.Web.Mvc.Controller

        '
        ' GET: /Comentario

        Function Index() As ActionResult
            Return View()
        End Function

        Function CrearNuevo(ByVal Cometario As fac_comentario) As ActionResult
            If Not ModelState.IsValid Then
                Return View(Cometario)
            End If
            Try
                ComentRepo.AddCommet(Cometario)
                ComentRepo.Save()
                Return RedirectToAction("Index")
            Catch ex As Exception
                Return View(Cometario)
            End Try
        End Function
    End Class
End Namespace