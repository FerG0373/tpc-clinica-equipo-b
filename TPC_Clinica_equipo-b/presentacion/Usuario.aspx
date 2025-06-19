<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="presentacion.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/misestilos.css" rel="stylesheet" />

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Lista de Usuarios</h2>

                <asp:Button ID="btnAltaUsuario" runat="server" OnClick="btnAltaUsuario_Click" Text="Alta de Usuario" Style="display: none;" />
                <div type="d-grid">
                    <button type="button" class="custom-btn" onclick="document.getElementById('<%= btnAltaUsuario.ClientID %>').click();">
                        <span class="btn-text">Alta de Usuario</span>
                    </button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
