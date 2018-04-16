using System;
using System.Collections.Generic;
using System.Threading;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void CallbackPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
        ASPxCallbackPanel panel = (ASPxCallbackPanel)sender;
        NoCommentsLabel.Visible = false;
        Thread.Sleep(3000);

        ASPxLabel comment = new ASPxLabel() {
            Text = string.Format("[{0}]\n{1}\n\n",
                DateTime.Now.ToLocalTime(),
                !string.IsNullOrEmpty(TextBox.Text) ? TextBox.Text : "Empty comment"
            ),
            CssClass = "comment"
        };

        List<ASPxLabel> comments = (List<ASPxLabel>)Session["comments"] ?? new List<ASPxLabel>();

        comments.Add(comment);
        panel.Controls.Add(comment);
        Session["comments"] = comments;

        CountLabel.Text = "Comments Count : " + comments.Count;
    }

    protected void CallbackPanel_Init(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback)
            Session.Clear();
        RecreateComments(sender);
    }

    private void RecreateComments(object sender) {
        List<ASPxLabel> comments;
        if((comments = (List<ASPxLabel>)Session["comments"]) != null) {
            CountLabel.Text = "Comments Count : " + comments.Count;
            ASPxCallbackPanel panel = (ASPxCallbackPanel)sender;
            NoCommentsLabel.Visible = false;
            foreach(ASPxLabel comment in comments) {
                panel.Controls.Add(comment);
            }
        }
    }
}