Imports System
Imports System.Collections.Generic
Imports System.Threading
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub CallbackPanel_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		Dim panel As ASPxCallbackPanel = DirectCast(sender, ASPxCallbackPanel)
		NoCommentsLabel.Visible = False
		Thread.Sleep(3000)

		Dim comment As New ASPxLabel() With {
			.Text = String.Format("[{0}]" & vbLf & "{1}" & vbLf & vbLf, Date.Now.ToLocalTime(),If(Not String.IsNullOrEmpty(TextBox.Text), TextBox.Text, "Empty comment")),
			.CssClass = "comment"
		}

		Dim comments As List(Of ASPxLabel) = If(DirectCast(Session("comments"), List(Of ASPxLabel)), New List(Of ASPxLabel)())

		comments.Add(comment)
		panel.Controls.Add(comment)
		Session("comments") = comments

		CountLabel.Text = "Comments Count : " & comments.Count
	End Sub

	Protected Sub CallbackPanel_Init(ByVal sender As Object, ByVal e As EventArgs)
		If Not IsPostBack AndAlso Not IsCallback Then
			Session.Clear()
		End If
		RecreateComments(sender)
	End Sub

	Private Sub RecreateComments(ByVal sender As Object)
		Dim comments As List(Of ASPxLabel)
		comments = DirectCast(Session("comments"), List(Of ASPxLabel))
		If comments IsNot Nothing Then
			CountLabel.Text = "Comments Count : " & comments.Count
			Dim panel As ASPxCallbackPanel = DirectCast(sender, ASPxCallbackPanel)
			NoCommentsLabel.Visible = False
			For Each comment As ASPxLabel In comments
				panel.Controls.Add(comment)
			Next comment
		End If
	End Sub
End Class