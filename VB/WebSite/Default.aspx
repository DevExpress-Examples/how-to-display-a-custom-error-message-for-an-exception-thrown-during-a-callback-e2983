<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to display a custom error message for an exception thrown during a callback</title>
</head>
<body>
	<form id="form1" runat="server">        
		<table>
			<tr>
				<td>
					<dx:ASPxButton ID="btnCallback" runat="server" Text="Perform Callback" AutoPostBack="false">
						<ClientSideEvents Click="function(s, e) { callback.SendCallback(); } " />
					</dx:ASPxButton>
				</td>
				<td valign="top">
					<dx:ASPxLabel ID="lblMessage" runat="server" Text="" ClientInstanceName="label" ForeColor="Red">
					</dx:ASPxLabel>
				</td>
			</tr>
		</table>
		<dx:ASPxCallback ID="callback" runat="server" ClientInstanceName="callback" OnCallback="SaveData">
			<ClientSideEvents CallbackComplete="function (s, e) {
					var strs = e.result.split('|');
					if (strs[0] == 'Error')
						label.SetText(strs[1]);
				}" />
		</dx:ASPxCallback>
	</form>
</body>
</html>