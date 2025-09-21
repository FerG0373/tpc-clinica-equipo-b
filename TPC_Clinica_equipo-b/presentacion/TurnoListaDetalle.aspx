<%@ Page Title="Detalle del turno" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoListaDetalle.aspx.cs" Inherits="presentacion.TurnoListaDetalle" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
    <h2 class="text-center mb-5">Detalle del Turno</h2>
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header bg-success-subtle p-0">
                    <div class="row g-0">
                        <div class="col-6 py-2 px-3 fw-bold border-end">Información del Turno:</div>
                        <div class="col-6 py-2 px-3 fw-bold">Motivo de la Consulta:</div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="row g-0">
                        <div class="col-6 border-end">
                            <div class="p-3">
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Fecha:</div>
                                    <div class="col-8"><asp:Label ID="lblFecha" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Hora:</div>
                                    <div class="col-8"><asp:Label ID="lblHora" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">DNI:</div>
                                    <div class="col-8"><asp:Label ID="lblDNI" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Paciente:</div>
                                    <div class="col-8"><asp:Label ID="lblPaciente" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Especialidad:</div>
                                    <div class="col-8"><asp:Label ID="lblEspecialidad" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Médico:</div>
                                    <div class="col-8"><asp:Label ID="lblMedico" runat="server" /></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 fw-bold">Estado:</div>
                                    <div class="col-8"><asp:Label ID="lblEstado" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-3">
                                <asp:Label ID="lblMotivo" runat="server" />
                            </div>
                            
                            <div class="card-header bg-success-subtle py-2 mt-4 px-3 fw-bold">Observaciones del Médico:</div>
                            <div class="p-3">
                                <asp:Label ID="lblObservaciones" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center mt-4">
        <asp:Button ID="btnEditar" runat="server" Text="✏️ Editar" CssClass="btn btn-success px-4 me-4 mt-4" />
        <a href="TurnoLista.aspx" class="btn btn-warning px-4 mt-4">Atrás</a>
    </div>
</div>
</asp:Content>
