<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_touch_formattingbar.index" %>

<%@ Register assembly="TXTextControl.Web, Version=22.0.200.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" namespace="TXTextControl.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TX Text Control Sample: Formatting Bar</title>
    <link href="styles.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.4.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div id="iOSUXBar">
            <input type="button" id="fontbold" title="Bold" class="btniOSUX" />
            <input type="button" id="fontitalic" title="Italic" class="btniOSUX" />
            <input type="button" id="listbullet" title="Bulleted List" class="btniOSUX separator" />
            <input type="button" id="liststructured" title="Structured List" class="btniOSUX" />
        </div>

        <cc1:TextControl ID="TextControl1" runat="server" />
    
        <script>
            // enable hidden commands
            TXTextControl.enableCommands();

            // remove the ribbon and status bar
            TXTextControl.addEventListener("ribbonTabsLoaded", function (e) {
                TXTextControl.showRibbonBar(false);
                TXTextControl.showStatusBar(false);
            });

            // add click event handlers to buttons
            $(function () {
                $('#fontbold').click(function(){
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.Bold, 0);
                    } 
                    else
                    {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.Bold, 1);
                    }

                    TXTextControl.focus();
                })

                $('#fontitalic').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.Italic, 0);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.Italic, 1);
                    }

                    TXTextControl.focus();
                })

                $('#listbullet').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.BulletedList, 0);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.BulletedList, 1);
                    }

                    TXTextControl.focus();
                })

                $('#liststructured').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.StructuredList, 0);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.sendCommand(TXTextControl.Command.InputFormat, TXTextControl.InputFormatProperty.StructuredList, 1);
                    }

                    TXTextControl.focus();
                })
            });

            // this event is fired, if the format at the current
            // input position is changed
            document.addEventListener("inputFormatReceived", inputFormatReceivedHandler);

            // process the message
            function inputFormatReceivedHandler(e) {
                var msg = e.detail;

                if (msg.hasOwnProperty("Bold")) inputFormatChanged(TXTextControl.InputFormatProperty.Bold, msg.Bold);
                if (msg.hasOwnProperty("Italic")) inputFormatChanged(TXTextControl.InputFormatProperty.Italic, msg.Italic);
                if (msg.hasOwnProperty("BulletedList")) inputFormatChanged(TXTextControl.InputFormatProperty.BulletedList, msg.BulletedList);
                if (msg.hasOwnProperty("StructuredList")) inputFormatChanged(TXTextControl.InputFormatProperty.StructuredList, msg.StructuredList);
            }

            // set the state of the new buttons to reflect the input format
            function inputFormatChanged(id, value, stringValue) {
                var btns = null;

                switch (id) {
                    case TXTextControl.InputFormatProperty.Bold:
                        btns = [$("#fontbold")];
                        break;
                    case TXTextControl.InputFormatProperty.Italic:
                        btns = [$("#fontitalic")];
                        break;
                    case TXTextControl.InputFormatProperty.BulletedList:
                        btns = [$("#listbullet")];
                        break;
                    case TXTextControl.InputFormatProperty.StructuredList:
                        btns = [$("#liststructured")];
                        break;
                }

                if (btns) {
                    btns.forEach(function (btn) {
                        if (value) btn.addClass('btniOSUX-selected');
                        else btn.removeClass('btniOSUX-selected');
                    });
                }
            }

        </script>

    </div>
    </form>
</body>
</html>
