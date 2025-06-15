<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="presentacion.Index" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="IndexMainContent" ContentPlaceHolderID="MainContent" runat="server">
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
    </main>
</asp:Content>
