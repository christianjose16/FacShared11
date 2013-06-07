Imports System.Diagnostics.CodeAnalysis
Imports System.Security.Principal
Imports System.Web.Routing

<HandleError()> _
Public Class AccountController
    Inherits System.Web.Mvc.Controller

    Private formsServiceValue As IFormsAuthenticationService
    Private membershipServiceValue As IMembershipService

    Public Property FormsService() As IFormsAuthenticationService
        Get
            Return formsServiceValue
        End Get
        Set(ByVal value As IFormsAuthenticationService)
            formsServiceValue = value
        End Set
    End Property

    Public Property MembershipService() As IMembershipService
        Get
            Return membershipServiceValue
        End Get
        Set(ByVal value As IMembershipService)
            membershipServiceValue = value
        End Set
    End Property

    Protected Overrides Sub Initialize(ByVal requestContext As RequestContext)
        If FormsService Is Nothing Then FormsService = New FormsAuthenticationService()
        If MembershipService Is Nothing Then MembershipService = New AccountMembershipService()

        MyBase.Initialize(requestContext)
    End Sub

    ' **************************************
    ' URL: /Account/LogOn
    ' **************************************

    Public Function LogOn() As ActionResult
        Return View()
    End Function

    <HttpPost()> _
    Public Function LogOn(ByVal model As LogOnModel, ByVal returnUrl As String) As ActionResult
        Dim validas As New ValidaLogin
        If ModelState.IsValid Then
            If validas.Valida(model.UserName, model.Password) Then 'si nuestra validacion dió resultado correcto
                FormsService.SignIn(Session("Nombre"), model.RememberMe)
                If Not String.IsNullOrEmpty(returnUrl) Then
                    Return Redirect(returnUrl)
                Else

                    Return RedirectToAction("Home", "Home")
                End If
            Else
                ModelState.AddModelError("", "El nombre de usuario o la contraseña especificados son incorrectos.")
            End If
        End If

        ' Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
        Return View(model)
    End Function

    ' **************************************
    ' URL: /Account/LogOff
    ' **************************************

    Public Function LogOff() As ActionResult
        FormsService.SignOut()
        Session.Clear()
        Return RedirectToAction("Index", "Home")
    End Function

    ' **************************************
    ' URL: /Account/Register
    ' **************************************

    Public Function Register() As ActionResult
        ViewData("PasswordLength") = MembershipService.MinPasswordLength
        Return View()
    End Function

    <HttpPost()> _
    Public Function Register(ByVal model As fac_persona, ByVal confirmpassword As String) As ActionResult
        If ModelState.IsValid Then
            ' Intento de registrar al usuario
            Dim createStatus As MembershipCreateStatus = MembershipService.CreateUser(model.p_usuario, model.p_password, model.p_correo)
            Try
                If createStatus = MembershipCreateStatus.Success Then
                    FormsService.SignIn(model.p_usuario, False)
                    PersonasRepo.AddPerson(model)
                    Session("nombre") = model.p_usuario
                    Return RedirectToAction("Index", "Home")
                Else
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus))
                End If
            Catch ex As Exception
                ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus))
            End Try

        End If

        ' Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
        ViewData("PasswordLength") = MembershipService.MinPasswordLength
        Return View(model)
    End Function

    ' **************************************
    ' URL: /Account/ChangePassword
    ' **************************************

    <Authorize()> _
    Public Function ChangePassword() As ActionResult
        ViewData("PasswordLength") = MembershipService.MinPasswordLength
        Return View()
    End Function

    <Authorize()> _
    <HttpPost()> _
    Public Function ChangePassword(ByVal model As ChangePasswordModel) As ActionResult
        If ModelState.IsValid Then
            If MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword) Then
                Return RedirectToAction("ChangePasswordSuccess")
            Else
                ModelState.AddModelError("", "La contraseña actual es incorrecta o la nueva contraseña no es válida.")
            End If
        End If

        ' Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
        ViewData("PasswordLength") = MembershipService.MinPasswordLength
        Return View(model)
    End Function

    ' **************************************
    ' URL: /Account/ChangePasswordSuccess
    ' **************************************

    Public Function ChangePasswordSuccess() As ActionResult
        Return View()
    End Function
End Class
