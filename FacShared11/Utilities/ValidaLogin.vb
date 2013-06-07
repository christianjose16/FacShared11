Public Class ValidaLogin
    Public Function Valida(ByVal usr As String, ByVal psswrd As String) As Boolean
        Try
            Using cs = New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("sqlclietfac").ConnectionString.ToString)
                Using cm = New SqlClient.SqlCommand("select p_usuario[SessioId], p_primer_nombre +' ' +p_primer_apellido [nombre] from fac_persona where p_usuario = @usuario and p_password = @password", cs)
                    Dim da As New SqlClient.SqlDataAdapter
                    Dim ds As New DataSet
                    cm.Parameters.AddWithValue("@usuario", usr)
                    cm.Parameters.AddWithValue("@password", psswrd)
                    da.SelectCommand = cm
                    da.Fill(ds)
                    If ds.Tables.Count > 0 Then
                        If ds.Tables(0).Rows.Count Then
                            HttpContext.Current.Session.Add("SessionID", ds.Tables(0).Rows(0)(0).ToString)
                            HttpContext.Current.Session.Add("Nombre", ds.Tables(0).Rows(0)(1).ToString)
                            Return True
                        Else
                            Return False
                        End If
                    Else
                        Return False
                    End If
                End Using
            End Using
        Catch ex As Exception
            Return False
        End Try
        Return False
    End Function
End Class
