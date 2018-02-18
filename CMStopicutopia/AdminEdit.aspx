<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ItemPage.Master" CodeBehind="AdminEdit.aspx.cs" Inherits="CMStopicutopia.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheetIndex.min.css" rel="stylesheet" />
    <title>Complex Controls</title>
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:Label ID="statusInfo" runat="server"></asp:Label>
        <div>
            
            <br />
            <br />
            <asp:FileUpload ID="FileUpload" runat="server" />
            <br />
            <asp:Label ID="LabelNewFileName" runat="server" Text="New Filename"></asp:Label>
            <asp:TextBox ID="TextBoxNewName" runat="server"></asp:TextBox>
            <br />
           
        
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
            <asp:DropDownList ID="DropDownListOrigin" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="LabelMainCat" runat="server" Text="Main Category"></asp:Label>
            <asp:DropDownList ID="DropDownListCat" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="LabelManagerChoice" runat="server" Text="Highight Item"></asp:Label>
           <asp:CheckBox ID="CheckBoxStatus" runat="server" />
             <asp:Button ID="ButtonUpload" runat="server" Text="Upload new Item" Height="39px" OnClick="ButtonUpload_Click" Width="191px" />
            

        </div>
        
        <p>
            <asp:Label ID="LabelUpload" runat="server" Text=" File Upload"></asp:Label>
            </p>
        <br />
        <br />
        <asp:GridView ID="ItemGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="normalInfo" HeaderText="normalInfo" SortExpression="normalInfo" />
                <asp:BoundField DataField="extraInfo" HeaderText="extraInfo" SortExpression="extraInfo" />
                <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                <asp:BoundField DataField="main_Cat" HeaderText="main_Cat" SortExpression="main_Cat" />
                <asp:BoundField DataField="managers_choice_state" HeaderText="managers_choice_state" SortExpression="managers_choice_state" />
                <asp:ImageField DataImageUrlField="image" DataImageUrlFormatString="~\Images\{0}" HeaderText="image">
                    <ItemStyle Width="50px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" SelectCommand="SELECT * FROM [Items]" DeleteCommand="DELETE FROM [Items] WHERE [id] = @id" InsertCommand="INSERT INTO [Items] ([name], [normalInfo], [extraInfo], [origin], [main_Cat], [managers_choice_state], [image]) VALUES (@name, @normalInfo, @extraInfo, @origin, @main_Cat, @managers_choice_state, @image)" UpdateCommand="UPDATE [Items] SET [name] = @name, [normalInfo] = @normalInfo, [extraInfo] = @extraInfo, [origin] = @origin, [main_Cat] = @main_Cat, [managers_choice_state] = @managers_choice_state, [image] = @image WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="normalInfo" Type="String" />
                <asp:Parameter Name="extraInfo" Type="String" />
                <asp:Parameter Name="origin" Type="Int32" />
                <asp:Parameter Name="main_Cat" Type="Int32" />
                <asp:Parameter Name="managers_choice_state" Type="Int32" />
                <asp:Parameter Name="image" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="normalInfo" Type="String" />
                <asp:Parameter Name="extraInfo" Type="String" />
                <asp:Parameter Name="origin" Type="Int32" />
                <asp:Parameter Name="main_Cat" Type="Int32" />
                <asp:Parameter Name="managers_choice_state" Type="Int32" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
            
            <asp:Label ID="LabelJokeName" runat="server" Text="Joke Name"></asp:Label>
            <asp:TextBox ID="TextboxJokeName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelJokeText" runat="server" Text="Joke Text"></asp:Label>
            <asp:TextBox ID="TextboxJokeText" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelJokeLink" runat="server" Text="Joke Link"></asp:Label>
            <asp:TextBox ID="TextboxJokeLink" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelCatJoke" runat="server" Text="Joke Category"></asp:Label>
            <asp:DropDownList ID="DropDownListJokeCat" runat="server"></asp:DropDownList>
            <br />
        <asp:Button ID="ButtonCreateJoke" runat="server" Text="Create Joke" OnClick="ButtonCreateJoke_Click" />
        <asp:GridView ID="GridViewJokes" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceJokes" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="jokeText" HeaderText="jokeText" SortExpression="jokeText" />
                <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                <asp:BoundField DataField="relatedCat" HeaderText="relatedCat" SortExpression="relatedCat" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceJokes" runat="server" ConnectionString="<%$ ConnectionStrings:CMSConnectionStringJokes %>" DeleteCommand="DELETE FROM [Jokes] WHERE [id] = @id" InsertCommand="INSERT INTO [Jokes] ([name], [jokeText], [link], [relatedCat]) VALUES (@name, @jokeText, @link, @relatedCat)" SelectCommand="SELECT * FROM [Jokes]" UpdateCommand="UPDATE [Jokes] SET [name] = @name, [jokeText] = @jokeText, [link] = @link, [relatedCat] = @relatedCat WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="jokeText" Type="String" />
                <asp:Parameter Name="link" Type="String" />
                <asp:Parameter Name="relatedCat" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="jokeText" Type="String" />
                <asp:Parameter Name="link" Type="String" />
                <asp:Parameter Name="relatedCat" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
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

        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/download.jpg" />
            
            <asp:Button ID="ButtonChangeImage" runat="server" Text="ChangePicture" OnClick="ButtonChangeImage_Click" />
            <asp:Label ID="LabelControls" runat="server" Text="Calendar Controls"></asp:Label>
            
            <asp:Label ID="LabelSelection" runat="server" Text="Selected Date"></asp:Label>
            <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
            <asp:Label ID="LabelWeek" runat="server" Text="Week"></asp:Label>
            <asp:TextBox ID="TextBoxDay" runat="server"></asp:TextBox>
    </form>
</body>
</html>
