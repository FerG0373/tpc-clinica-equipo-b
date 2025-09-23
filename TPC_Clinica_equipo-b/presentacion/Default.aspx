<%@ Page Title="Clínica Médica" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Index" %>

<asp:Content ID="IndexMainContent" ContentPlaceHolderID="MainContent" runat="server">
        <%--Carrusel--%>
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active mb-5">
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
            <!--MÉDICOS-->
            <a href="MedicoLista.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none" id="btnMedicos" runat="server">
                <span class="icon-circle"><i class="fas fa-users"></i></span>
                <span class="btn-text">Médicos</span>
            </a>

            <!--TURNOS-->
            <a href="TurnoLista.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none" id="btnTurnos" runat="server">
                <span class="icon-circle"><i class="fas fa-calendar-alt"></i></span>
                <span class="btn-text">Turnos</span>
            </a>

            <!--ESPECIALIDADES-->
            <a href="EspecialidadLista.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none" id="btnEspecialidades" runat="server">
                <span class="icon-circle"><i class="fas fa-stethoscope"></i></span>
                <span class="btn-text">Especialidades</span>
            </a>

            <!--TURNOS DE TRABAJO-->
            <a href="TurnoTrabajoLista.aspx" class="btn custom-btn d-flex align-items-center gap-2 text-decoration-none" id="btnTurnosTrabajo" runat="server">
                <span class="icon-circle"><i class="fas fa-briefcase-medical"></i></span>
                <span class="btn-text">Turnos de trabajo</span>
            </a>

            <!--MIS TURNOS-->
            <a href="#" class="btn custom-btn gap-2 " id="btnMisTurnos" runat="server">
                <span class="icon-circle"><i class="fas fa-user-md"></i></span>
                <span class="btn-text">Mis Turnos</span>
            </a>

            <%--PACIENTES--%> 
            <a href="PacienteLista.aspx" class="btn custom-btn gap-2" id="btnPacientes" runat="server">
                <span class="icon-circle">
                    <i class="fas fa-user"></i></span>
                <span class="btn-text">Pacientes</span>
            </a>
        </div>
</asp:Content>
