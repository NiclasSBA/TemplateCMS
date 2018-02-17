<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CMStopicutopia.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Complex Controls</title>
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:Label ID="statusInfo" runat="server"></asp:Label>
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/download.jpg" />
            
            <asp:Button ID="ButtonChangeImage" runat="server" Text="ChangePicture" OnClick="ButtonChangeImage_Click" />
            <asp:Label ID="LabelControls" runat="server" Text="Calendar Controls"></asp:Label>
            <asp:Calendar ID="Calendar" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar_SelectionChanged" TitleFormat="Month" Width="400px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <asp:Label ID="LabelSelection" runat="server" Text="Selected Date"></asp:Label>
            <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
            <asp:Label ID="LabelWeek" runat="server" Text="Week"></asp:Label>
            <asp:TextBox ID="TextBoxDay" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload" runat="server" />
            <br />
            <asp:Label ID="LabelNewFileName" runat="server" Text="New Filename"></asp:Label>
            <asp:TextBox ID="TextBoxNewName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonUpload" runat="server" Text="Upload to AppData" Height="39px" OnClick="ButtonUpload_Click" Width="191px" />
        
            <asp:Label ID="LabelName" runat="server" Text="Name" ></asp:Label>
            <asp:TextBox ID="TextboxName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelNormalInfo" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="TextboxNormalInfo" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelExtraInfo" runat="server" Text="Extra info:"></asp:Label>
            <asp:TextBox ID="TextboxExtraInfo" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelOrigin" runat="server" Text="Origin"></asp:Label>
            <asp:TextBox ID="TextboxOrigin" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelMainCat" runat="server" Text="Main Category"></asp:Label>
            <asp:TextBox ID="TextboxMainCat" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelManagerChoice" runat="server" Text="Item Status"></asp:Label>
            <asp:TextBox ID="TextboxManagerChoice" runat="server"></asp:TextBox>



        </div>
        <p>
            <asp:TextBox ID="TextBoxInfo" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="LabelUpload" runat="server" Text=" File Upload"></asp:Label>
            </p>
    </form>
</body>
</html>
