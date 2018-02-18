<%@ Page Title="" Language="C#" MasterPageFile="~/ItemPage.Master" AutoEventWireup="true" CodeBehind="Itempage.aspx.cs" Inherits="CMStopicutopia.Itempage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheetItems.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="row" runat="server">
    <div class="container">
        
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <div class="col-sm-6">
                            <div class="mainImage"><img src="#" /></div>
                        </div>
                    <div class="col-sm-6">
                        
                        <div id="maintext"><h3><asp:Label ID="LabelMain" runat="server" Text="Placeholder"></asp:Label></h3>
                            <p>Placeholder text</p>
                        </div>
                    </div>
                    </div>
    <div class="container-items">
    <div class="col-sm-4">
    <asp:Label ID="Label1" runat="server" Text="Placeholder"></asp:Label>
        <section><asp:Image ID="Image1"  CssClass="image-size" runat="server" /></section>
    </div>
    <div class="col-sm-4">
    <asp:Label ID="Label2" runat="server" Text="Placeholder"></asp:Label>
       <section><asp:Image ID="Image2"  CssClass="image-size" runat="server" /></section>
        </div>
        <div class="col-sm-4">
    <asp:Label ID="Label3" runat="server" Text="Placeholder"></asp:Label>
            <section><asp:Image ID="Image3"  CssClass="image-size" runat="server" /></section>
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
