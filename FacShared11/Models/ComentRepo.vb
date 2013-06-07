Public Class ComentRepo


    Shared db As FACSHAREDEntities
    Shared Function SelectByID(ByVal id As String) As fac_comentario
        Using db2 As New FACSHAREDEntities
            Dim query = From archivo In db2.fac_comentario
                        Where archivo.c_idarchivo = id
                        Select archivo

            Return query
        End Using

    End Function
    Shared Sub AddCommet(ByVal comment As fac_comentario)
        Using db2 As New FACSHAREDEntities 'INSTANCIA DE BASE DE DATOS DE ENTITY FRAMEWORK db2 es el nombre de la variable
            db2.fac_comentario.AddObject(comment) ''
            db2.SaveChanges()
        End Using
    End Sub

    Shared Sub Save()
        db.SaveChanges()
    End Sub

End Class
