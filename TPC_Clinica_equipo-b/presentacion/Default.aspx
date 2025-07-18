<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Index" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="IndexMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <%--Carrusel--%>
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%= ResolveUrl("~/assets/img/Carrousel-1.png") %>" class="d-block w-100" alt="Imagen del carrusel: mano del dr. sobre mano del paciente">
                </div>
                <div class="carousel-item">
                    <img src="<%= ResolveUrl("~/assets/img/Carrousel-2.png") %>" class="d-block w-100" alt="Imagen del carrusel: camilla y dispositivos médicos">
                </div>
                <div class="carousel-item">
                    <img src="<%= ResolveUrl("~/assets/img/Carrousel-3.png") %>" class="d-block w-100" alt="Imagen del carrusel: manos del dr. sobre mano del paciente">
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

        <div class="d-flex flex-wrap justify-content-center gap-4 mt-5">
            <!--Botón Médicos-->
            <a href="MedicoLista.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none">
                <span class="icon-circle"><i class="fas fa-users"></i></span>
                <span class="btn-text">Médicos</span>
            </a>

            <!--Botón Turnos-->
            <a href="ListaTurno.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none">
                <span class="icon-circle"><i class="fas fa-calendar-alt"></i></span>
                <span class="btn-text">Turnos</span>
            </a>

            <!--Botón Especialidades-->
            <a href="ListaEspecialidad.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none">
                <span class="icon-circle"><i class="fas fa-stethoscope"></i></span>
                <span class="btn-text">Especialidades</span>
            </a>

            <!--Botón Turnos de Trabajo-->
            <a href="TurnoTrabajo.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none">
                <span class="icon-circle"><i class="fas fa-briefcase-medical"></i></span>
                <span class="btn-text">Turnos de trabajo</span>
            </a>

            <!--Botón Mis Turnos-->
            <a href="" class="btn custom-btn gap-2 ">
                <span class="icon-circle"><i class="fas fa-user-md"></i></span>
                <span class="btn-text">Mis Turnos</span>
            </a>

            <!--Botón Pacientes-->
            <a href="ListaPaciente.aspx" class="btn custom-btn gap-2 ">
                <span class="icon-circle">
                    <i class="fas fa-user"></i></span>
                <span class="btn-text">Pacientes</span>
            </a>
        </div>
    </main>
</asp:Content>
