<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_touch_formattingbar.index" %>

<%@ Register assembly="TXTextControl.Web, Version=33.0.1300.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" namespace="TXTextControl.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TX Text Control Sample: Formatting Bar</title>
    <link href="styles.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.js"></script>
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
            TXTextControl.addEventListener("textControlLoaded", function (e) {
                // these events are fired, if the format at the current
                // input position is changed
                TXTextControl.inputFormat.addEventListener("boldChanged", boldChangedHandler);
                TXTextControl.inputFormat.addEventListener("italicChanged", italicChangedHandler);
                TXTextControl.inputFormat.addEventListener("bulletedListChanged", bulletedListChangedHandler);
                TXTextControl.inputFormat.addEventListener("structuredListChanged", structuredListChangedHandler);
            });

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
                        TXTextControl.inputFormat.setBold(false);
                    } 
                    else
                    {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setBold(true);
                    }

                    TXTextControl.focus();
                })

                $('#fontitalic').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setItalic(false);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setItalic(true);
                    }

                    TXTextControl.focus();
                })

                $('#listbullet').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setBulletedList(false);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setBulletedList(true);
                    }

                    TXTextControl.focus();
                })

                $('#liststructured').click(function () {
                    if ($(this).hasClass('btniOSUX-selected')) {
                        $(this).removeClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setStructuredList(false);
                    }
                    else {
                        $(this).addClass('btniOSUX-selected');
                        TXTextControl.inputFormat.setStructuredList(true);
                    }

                    TXTextControl.focus();
                })
            });            

            // set the state of the new buttons to reflect the input format
            function boldChangedHandler(e) {
                var value = e.newValue;
                var btn = $("#fontbold");
                if (value) btn.addClass('btniOSUX-selected');
                else btn.removeClass('btniOSUX-selected');
            }

            function italicChangedHandler(e) {
                var value = e.newValue;
                var btn = $("#fontitalic");
                if (value) btn.addClass('btniOSUX-selected');
                else btn.removeClass('btniOSUX-selected');
            }

            function bulletedListChangedHandler(e) {
                var value = e.newValue;
                var btn = $("#listbullet");
                if (value) btn.addClass('btniOSUX-selected');
                else btn.removeClass('btniOSUX-selected');
            }

            function structuredListChangedHandler(e) {
                var value = e.newValue;
                var btn = $("#liststructured");
                if (value) btn.addClass('btniOSUX-selected');
                else btn.removeClass('btniOSUX-selected');
            }

        </script>

    </div>
    </form>
</body>
</html>
