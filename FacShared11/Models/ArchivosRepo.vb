Imports System.Data.EntityClient
Namespace FacShared11
    Public Class ArchivosRepo
        Inherits System.Web.Mvc.Controller

        '
        ' GET: /ArchivosRepo
        Private Shared db As New FACSHAREDEntities
        Shared Function GetAllArchivos() As IQueryable(Of fac_archivo)
            Return db.fac_archivo
        End Function
        Shared Sub AddFile(ByVal file As fac_archivo)
            Using db2 As New FACSHAREDEntities
                db2.fac_archivo.AddObject(file)
                db2.SaveChanges()
            End Using
        End Sub
        Shared Function SelectByID(ByVal id As String) As fac_archivo
            Using db2 As New FACSHAREDEntities
                Dim query = (From archivo In db2.fac_archivo
                            Where archivo.a_idarchivo = id
                            Select archivo
                            ).SingleOrDefault
                Return query
            End Using
        End Function
        Shared Sub UpdateFile(ByVal file As fac_archivo)
            db.fac_archivo.Attach(file)
        End Sub
        Shared Sub Delete(ByVal file As fac_archivo)
            db.fac_archivo.DeleteObject(file)
        End Sub

        Shared Sub Save()
            db.SaveChanges()
        End Sub

    End Class
End Namespace