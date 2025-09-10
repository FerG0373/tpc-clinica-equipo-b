<%@ Page Title="Detalle del turno" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoListaDetalle.aspx.cs" Inherits="presentacion.TurnoListaDetalle" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Detalle del Turno</h2>

        <div class="row">
            <div class="col-md-10 mx-auto">
                <table class="table table-bordered">
                    <!-- Cabecera: izquierda (Detalles del Turno) y derecha (Motivo de Consulta) -->
                    <tr class="table-success">
                        <th colspan="2">Detalles del Turno</th>
                        <th colspan="2">Motivo de Consulta</th>
                    </tr>

                    <!-- Primera fila de datos: Fecha (izq) y CELDA DERECHA que ocupa varias filas -->
                    <tr>
                        <th>Fecha:</th>
                        <td>
                            <asp:Label ID="lblFecha" runat="server" />
                        </td>

                        <!-- IMPORTANTE: rowspan debe cubrir todas las filas de la columna izquierda -->
                        <td colspan="2" rowspan="7" class="align-top p-0">
                            <table class="table mb-0">
                                <!-- Fila Motivo de consulta -->

                                <tr>
                                    <td style="border-bottom: none;">
                                        <asp:Label ID="lblMotivo" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="height: 82px;"></td>
                                </tr>
                                <!-- Fila Observaciones del médico -->
                                <tr class="table-success">
                                    <th>Observaciones del Médico:</th>
                                </tr>
                                <tr>
                                    <td style="border-bottom: none;">
                                        <asp:Label ID="lblObservaciones" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- Resto de filas de la columna izquierda -->
                    <tr>
                        <th>Hora:</th>
                        <td>
                            <asp:Label ID="lblHora" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>DNI:</th>
                        <td>
                            <asp:Label ID="lblDNI" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Paciente:</th>
                        <td>
                            <asp:Label ID="lblPaciente" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Especialidad:</th>
                        <td>
                            <asp:Label ID="lblEspecialidad" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Médico:</th>
                        <td>
                            <asp:Label ID="lblMedico" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Estado:</th>
                        <td>
                            <asp:Label ID="lblEstado" runat="server" /></td>
                    </tr>

                </table>
            </div>
        </div>

        <div class="d-flex justify-content-center mt-4">
            <asp:Button ID="btnEditar" runat="server" Text="✏️ Editar" CssClass="btn btn-success me-2 me-4" />
            <asp:Button ID="btnCerrar" runat="server" Text="Atrás" PostBackUrl="~/TurnoLista.aspx" CssClass="btn btn-warning" />
        </div>
    </div>
</asp:Content>
