Namespace FacShared11
    Public Class PersonaController
        Inherits System.Web.Mvc.Controller

        '
        ' GET: /Persona
        Function ListaPersonas() As ActionResult
            Dim personas = PersonasRepo.GetAllPersonas()
            Return View(personas)
        End Function


    End Class
End Namespace