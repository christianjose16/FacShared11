Imports System.IO

Namespace FacShared11
    Public Class ArchivoController
        Inherits System.Web.Mvc.Controller

        Function Index() As ActionResult
            If Not (Request.IsAuthenticated) Then
                Return RedirectToAction("Home", "Home", "Home.aspx")
            Else
                ViewData("MessageFiles") = "Bienvenido a nuestro menu de creación de archivos"
                Return View()
            End If
        End Function

        Function ListaArchivos() As ActionResult
            Dim archivos = ArchivosRepo.GetAllArchivos()
            Return View(archivos)
        End Function
        Function ErrorPage(ByVal message As String) As ActionResult
            ViewData("Message") = message
            Return View()
        End Function

        Function Detalle(ByVal id As String) As ActionResult
            Return View(ArchivosRepo.SelectByID(id))
        End Function

        Function CrearNuevo(ByVal FileEntry As fac_archivo) As ActionResult
            If Not ModelState.IsValid Then
                Return View(FileEntry)
            End If
            Try
                ArchivosRepo.AddFile(FileEntry)
                ArchivosRepo.Save()
                Return RedirectToAction("Index")
            Catch ex As Exception
                Return View(FileEntry)
            End Try
        End Function

        <HttpPost()> _
        Function UpNuevo(ByVal file1 As HttpPostedFileBase) As ActionResult
            Dim FileEntry As New fac_archivo

            'Dim file1 As HttpPostedFileBase = HttpContext.Request.Files.Get("file1")
            Dim nueva As Byte()
            For i = 0 To file1.ContentLength
                file1.InputStream.Write(nueva, 0, file1.ContentLength)
            Next

            Dim strbyte As String
            FileEntry.a_archivo_b = nueva

            'FileEntry.a_archivo_b = uploadfile.InputStream.Read()
            If Not ModelState.IsValid Then
                Return View(FileEntry)
            End If
            Try
                ArchivosRepo.AddFile(FileEntry)
                ArchivosRepo.Save()
                Return RedirectToAction("Index")
            Catch ex As Exception
                Return View(FileEntry)
            End Try
        End Function
        <HttpPost()> _
        Public Function Upload(ByVal descripcion As String, ByVal fichero As HttpPostedFileBase) As ActionResult
            Dim FileEntry As New fac_archivo '<- Instancia de objeto de base de datos

            Dim bloblen As Integer = CInt(fichero.InputStream.Length) '<-Leemos la longitud en Bytes 

            Dim BLOB(bloblen) As Byte '<- Arreglo de Bytes vacío de Longitud de fichero
            Try
                fichero.InputStream.Read(BLOB, 0, bloblen) '<- Leemos el archivo y llenamos con los bytes
                fichero.InputStream.Close() '<- cerramos la lectura del archivo, para que pueda ser modificado o usado por otro winprocess
                ' AQUI DEFINIMOS LOS CAMPOS A INSERTAR EN LA BASE DE DATOS
                'INICIO
                FileEntry.a_detalle = descripcion
                FileEntry.a_idarchivo = Today.Year.ToString + (Today.Date.DayOfYear).ToString.PadRight(4, "0"c) + (Date.UtcNow.ToLongTimeString.ToString()).Replace(":"c, "f"c) + Session("SessionID").ToString
                FileEntry.a_archivo_b = BLOB
                FileEntry.a_nombre_archivo = fichero.FileName
                FileEntry.a_tamaño = fichero.InputStream.Length
                FileEntry.a_tipo_archivo = fichero.ContentType
                FileEntry.a_usuario = Session("SessionID").ToString
                FileEntry.a_link = fichero.FileName
                ' FIN
            Catch ex As Exception
                ViewData("MessageFiles") = "Es Lamentable.! Prueba Cerrar sesión y volver a iniciar "
                Return View("Index") '<- regresamos a inicio
            End Try
            If Not ModelState.IsValid Then '<- Si la expresion del modelo no se encuentra en estado válido
                ViewData("MessageFiles") = "Es Lamentable.! ha ocurrido un error de Origen Desconocido"
                Return View("Index") '<- regresamos a inicio
            End If
            Try
                ArchivosRepo.AddFile(FileEntry) '<- llamamos al modelo envianole nuestra instacia definida arriba
                ViewData("MessageFiles") = "Geniál Has Logrado trasferir " + fichero.FileName
                Return RedirectToAction("Index")
            Catch ex As Exception
                ViewData("MessageFiles") = "Es Lamentable.! ha ocurrido un error de Origen BD"
                Return View("Index")
            End Try
            Return View("Index")
        End Function

    End Class


End Namespace