<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajo.aspx.cs" Inherits="presentacion.TurnosTrabajo" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <%--Título--%>
                <asp:Label ID="lblTituloTurnoTrabajoFormulario" runat="server" Text="Agregar Turno de Trabajo" CssClass="text-center mb-4 d-block fs-2 fw-semibold"></asp:Label>

                <!-- Día de la semana -->
                <div class="mb-3">
                    <label for="<%= ddlDiaSemana.ClientID %>" class="form-label">Día de la semana</label>
                    <asp:DropDownList ID="ddlDiaSemana" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar día" Value="" />
                        <asp:ListItem>Lunes</asp:ListItem>
                        <asp:ListItem>Martes</asp:ListItem>
                        <asp:ListItem>Miércoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                        <asp:ListItem>Sábado</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrorDiaSemana" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>

                <!-- Hora inicio -->
                <div class="mb-3">
                    <label for="<%= txtHoraInicio.ClientID %>" class="form-label">Hora de inicio</label>
                    <asp:TextBox ID="txtHoraInicio" runat="server" CssClass="form-control" TextMode="Time" />
                    <asp:Label ID="lblErrorHoraInicio" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>

                <!-- Hora fin -->
                <div class="mb-3">
                    <label for="<%= txtHoraFin.ClientID %>" class="form-label">Hora de fin</label>
                    <asp:TextBox ID="txtHoraFin" runat="server" CssClass="form-control" TextMode="Time" />
                    <asp:Label ID="lblErrorHoraFin" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>

                <%--Botón guardar--%>
                <div class="text-center mt-5 mb-5">
                    <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar" CssClass="btn btn-success btn-lg px-4 me-5" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="✖ Cancelar" CssClass="btn btn-danger btn-lg px-4" OnClick="btnCancelar_Click" />
                </div>
                <div class="text-center mt-3">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-bold" Visible="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
