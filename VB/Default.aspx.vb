Imports System
Imports System.Drawing
Imports System.Threading
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
        Dim panel As ASPxCallbackPanel = DirectCast(sender, ASPxCallbackPanel)

        ' Perform long task
        Thread.Sleep(5000)

        ' Add/Modify/Hide controls inside callback panel
        TimeLabel.Text = Date.Now.ToLongDateString()
        TimeLabel.ForeColor = Color.Green
        TextBoxToHide.Visible = False
        ButtonToDisable.Enabled = False

        panel.Controls.Add(New ASPxHyperLink() With {.NavigateUrl = "https://www.devexpress.com/sc", .Text = "Navigate to DevExpress support center"})
    End Sub
End Class