<%@ Page Title="" Theme="Theme1" Language="C#" MasterPageFile="~/ItemPage.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="CMStopicutopia.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheetItems.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="row" runat="server">
    <asp:Label ID="statusInfo" runat="server"></asp:Label>
    
    <div class="container-items">
    <div class="col-sm-4">
    <h3> <asp:Label ID="Label1" runat="server" Text="Placeholder"></asp:Label></h3>
        <section><asp:GridView ID="ItemGridView" SkinId="gridviewskintest" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="normalInfo" HeaderText="normalInfo" SortExpression="normal Info" />
                <asp:BoundField DataField="extraInfo" HeaderText="extraInfo" SortExpression="extra Info" />
                <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                <asp:BoundField DataField="main_Cat" HeaderText="main_Cat" SortExpression="main Cat" />
                <asp:BoundField DataField="managers_choice_state" HeaderText="state" SortExpression="managers_choice_state" />
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
        </section>
    </div>
    <div class="col-sm-4">
        
    <h3> <asp:Label ID="Label2" runat="server" Text="Placeholder"></asp:Label></h3>
       <section><asp:Label ID="LabelJokeName" runat="server" Text="Joke Name"></asp:Label>
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
        <asp:Button ID="ButtonCreateJoke" runat="server" Text="Create Joke" OnClick="ButtonCreateJoke_Click" /></section>
        </div>
        <div class="col-sm-4">
    <h3> <asp:Label ID="Label3" runat="server" Text="Placeholder"></asp:Label></h3>
            <section><asp:GridView ID="GridViewJokes" SkinID="gridviewskintest" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceJokes" >
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
        </asp:SqlDataSource></section>
            </div>
        </div><div class="container-contain">
    <div class="container">
        
        
                            
                    <div class="col-sm-6">
                        
                        <div class="col-sm-6" id="maintext">
                            <div><h3><asp:Label ID="LabelMain" runat="server" Text="Placeholder"></asp:Label></h3></div>
                            
        <div id="main-div-item">
            
            <br />
            <br />
            <div class="col-sm-6">
            <asp:FileUpload ID="FileUpload" runat="server" />
            <br />
                </div>
            <div class="col-sm-6">
            <asp:Label ID="LabelNewFileName" runat="server" Text="New Filename"></asp:Label>
                
            <asp:TextBox ID="TextBoxNewName" runat="server"></asp:TextBox></div>
            <br />
           
        
            
            <div class="col-sm-6">
                <asp:Label ID="LabelName" runat="server" Text="Name" ></asp:Label>
                <asp:TextBox ID="TextboxName" runat="server"></asp:TextBox></div>
            <br />
            
            <div class="col-sm-6">
                <asp:Label ID="LabelNormalInfo" runat="server" Text="Description"></asp:Label>
                <asp:TextBox ID="TextboxNormalInfo" runat="server"></asp:TextBox></div>
            <br />
            
            <div class="col-sm-6">
                <asp:Label ID="LabelExtraInfo" runat="server" Text="Extra info:"></asp:Label>
                <asp:TextBox ID="TextboxExtraInfo" runat="server"></asp:TextBox></div>
            <br />
            
            <div class="col-sm-6">
                <asp:Label ID="LabelOrigin" runat="server" Text="Origin"></asp:Label>
                <asp:DropDownList ID="DropDownListOrigin" runat="server"></asp:DropDownList></div>
            <br />
            
            <div class="col-sm-6">
                <asp:Label ID="LabelMainCat" runat="server" Text="Main Category"></asp:Label>
                <asp:DropDownList ID="DropDownListCat" runat="server"></asp:DropDownList></div>
            <br />
            
          
             <div class="col-sm-6">
                  <asp:CheckBox ID="CheckBoxStatus" runat="server" />
                 <asp:Label ID="LabelManagerChoice" runat="server" Text="Highight Item"></asp:Label>
                 <asp:Button ID="ButtonUpload" runat="server" Text="Upload new Item" Height="39px" OnClick="ButtonUpload_Click" Width="191px" /></div>
            

        </div>

                            </div>
                        </div>
        
                            



                    </div>



            <div class="col-sm-6">

                                <div class="col-sm-6" id="joke">
        <asp:DropDownList ID="DropDownListMainItem" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="DropDownListJoke" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="DropDownListFirstItem" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="DropDownListSecondItem" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="DropDownListThirdItem" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Update Template" OnClick="Button1_Click" />

    </div>

                            </div>
                    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ItemImage" runat="server">
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ItemCat" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ItemDesc" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
