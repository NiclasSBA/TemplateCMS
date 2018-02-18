<%@ Page Title="" Language="C#" MasterPageFile="~/ItemPage.Master" AutoEventWireup="true" CodeBehind="Itempage.aspx.cs" Inherits="CMStopicutopia.Itempage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheetItems.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="Labelinfo" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="row" runat="server">
    <div class="container">
        
        
                            
                    <div class="col-sm-6">
                        
                        <div id="maintext">
                            <h3>
                                <asp:Label ID="LabelMain" runat="server" Text="There is special focus on this item"></asp:Label></h3>
                            <p>There is special focus on this item</p>
                        </div>
                    </div>
        <div class="col-sm-6">
                            <div class="mainImage"><asp:Image ID="mainImage"  CssClass="image-size" runat="server" /></div>
                        </div>
                    </div>
    <div class="container-items">
    <div class="col-sm-4">
    
        <div > 
            <asp:Label ID="Label1" runat="server" Text="Placeholder"></asp:Label>
            </div>
        
            <div><asp:Image ID="Image1"  CssClass="image-size" runat="server" /></div>
        <div><asp:Label ID="Label1Category" runat="server" Text="Placeholder"></asp:Label></div>
    </div>
    <div class="col-sm-4">
    
        <div >
            <asp:Label ID="Label2" runat="server" Text="Placeholder"></asp:Label>
            </div>
       <div><asp:Image ID="Image2"  CssClass="image-size" runat="server" /></div>
        <div><asp:Label ID="Label2Category" runat="server" Text="Placeholder"></asp:Label></div>
        </div>
        <div class="col-sm-4">
   
            <div >
                <asp:Label ID="Label3" runat="server" Text="Placeholder"></asp:Label>
                </div>
            <div><asp:Image ID="Image3"  CssClass="image-size" runat="server" /></div>
            <div><asp:Label ID="Label3Category" runat="server" Text="Placeholder"></asp:Label></div>
            </div>
        </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ItemImage" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ItemCat" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ItemDesc" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
