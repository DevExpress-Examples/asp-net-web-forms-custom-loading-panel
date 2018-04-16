<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to implement a custom loading panel, and how to add and hide controls in the ASPxCallbackPanel control</title>
    <style>
        .sendCommentBlock {
            margin: 20px 0;
        }

        .comment {
            border-bottom: 1px dashed #888888;
        }
    </style>
    <script>
        function SendCommentCallback(s, e) {
            CallbackPanel.PerformCallback();
        };

        function OnBeginCallback(s, e) {
            LoadingPanel.Show();
        };

        function OnEndCallback(s, e) {
            LoadingPanel.Hide();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sendCommentBlock">
            <dx:ASPxButton ID="Button" runat="server" Text="Post Comment" AutoPostBack="false">
                <ClientSideEvents Click="SendCommentCallback" />
            </dx:ASPxButton> 
            <br />
            <br />
            <dx:ASPxTextBox ID="TextBox" runat="server" Width="170px"></dx:ASPxTextBox>
        </div>

        <dx:ASPxCallbackPanel ID="CallbackPanel" ClientInstanceName="CallbackPanel" 
            runat="server"
            CssClass="pnl"
            Width="300px"
            OnCallback="CallbackPanel_Callback"
            OnInit="CallbackPanel_Init">
            <SettingsLoadingPanel Enabled="false" />
            <ClientSideEvents BeginCallback="OnBeginCallback" EndCallback="OnEndCallback" />
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxLabel ID="CountLabel" runat="server" Text="Comments Count : "></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="NoCommentsLabel" runat="server" Text="No Comments" ForeColor="Gray"></dx:ASPxLabel>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        <dx:ASPxLoadingPanel ID="LoadingPanel" ClientInstanceName="LoadingPanel"
            runat="server"
            Modal="true"
            HorizontalAlign="Center"
            VerticalAlign="Middle">
            <Image Url="Images/load.gif" Height="50px" Width="50px"></Image>
        </dx:ASPxLoadingPanel>
    </form>
</body>
</html>
