Public Class PersonasRepo
    Private Shared db As New FACSHAREDEntities

    Shared Function GetAllPersonas() As IQueryable(Of fac_persona)
        Return db.fac_persona
    End Function

    Shared Sub AddPerson(ByVal user As fac_persona)
        Using db2 As New FACSHAREDEntities 'INSTANCIA DE BASE DE DATOS DE ENTITY FRAMEWORK db2 es el nombre de la variable
            user.p_fecha_crea = System.DateTime.Today 'asignamos a usuario la fecha de creacion igual a fecha del sistema
            db2.fac_persona.AddObject(user) ''
            db2.SaveChanges()
        End Using
    End Sub
End Class
