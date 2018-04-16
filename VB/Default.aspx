<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .btn-send {
            margin: 20px 0;
        }
    </style>
    <script>
        function SendTaskRequest(s, e) {
            panel.PerformCallback();
        };

        function BeginCallbackHandler(s, e) {
            console.debug(e)
            loadingPanel.Show();
        };

        function EndCallbackHandler(s, e) {
            loadingPanel.Hide();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Perform Task" AutoPostBack="false" CssClass="btn-send">
            <ClientSideEvents Click="SendTaskRequest" />
        </dx:ASPxButton>

        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
            ClientInstanceName="panel"
            CssClass="pnl"
            Width="300px" 
            OnCallback="ASPxCallbackPanel1_Callback">
            <SettingsLoadingPanel Enabled="false" />
            <ClientSideEvents BeginCallback="BeginCallbackHandler" EndCallback="EndCallbackHandler" />
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxLabel ID="TimeLabel" runat="server" Text="[Server Time]" CssClass="margin-element"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="TextBoxToHide" runat="server" Width="170px" NullText="This textbox will be hidden"></dx:ASPxTextBox>
                    <dx:ASPxButton ID="ButtonToDisable" runat="server" Text="Button"></dx:ASPxButton>
                    <br />
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" 
            ClientInstanceName="loadingPanel" 
            Modal="true" 
            HorizontalAlign="Center" 
            VerticalAlign="Middle">
            <Image Url="Images/load.gif" Height="50px" Width="50px"></Image>
        </dx:ASPxLoadingPanel>
    </form>
</body>
</html>