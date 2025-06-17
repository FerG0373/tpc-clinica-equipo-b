<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="presentacion.Index" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="IndexMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="Content/misestilos.css" rel="stylesheet" />
    <main>
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%= ResolveUrl("~/assets/img/Carrousel-1.png") %>" class="d-block w-100" alt="Imagen del carrusel: mano del dr. sobre la del paciente">
                </div>
                <div class="carousel-item">
                    <img src="<%= ResolveUrl("~/assets/img/Carrousel-2.png") %>" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>



        <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; margin-top: 30px;">

            <asp:Button ID="btnUsuario" runat="server" OnClick="btnUsuario_Click" Text="Usuarios" Style="display: none;" />

            <button type="button" class="custom-btn" onclick="document.getElementById('<%= btnUsuario.ClientID %>').click();">
                <span class="icon-circle"><i class="fas fa-users"></i></span>
                <span class="btn-text">Usuarios</span>
            </button>

            <button class="custom-btn">
                <span class="icon-circle"><i class="fas fa-calendar-alt"></i></span>
                <span class="btn-text">Turnos</span>
            </button>

            <button class="custom-btn">
                <span class="icon-circle"><i class="fas fa-stethoscope"></i></span>
                <span class="btn-text">Especialidades</span>
            </button>

            <button class="custom-btn">
                <span class="icon-circle"><i class="fas fa-briefcase-medical"></i></span>
                <span class="btn-text">Turnos de trabajo</span>
            </button>

            <button class="custom-btn">
                <span class="icon-circle"><i class="fas fa-user-md"></i></span>
                <span class="btn-text">Mis Turnos</span>
            </button>
        </div>
    </main>
</asp:Content>
