<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajo.aspx.cs" Inherits="presentacion.TurnosTrabajo" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h3 class="text-center mb-4">Asignar Turno de Trabajo</h3>

                <!-- Médico -->
                <div class="mb-3">
                    <label for="ddlMedico" class="form-label">Médico</label>
                    <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccione un médico" Value="" />
                        <asp:ListItem Text="Dr. Pablo Suárez" Value="1" />
                        <asp:ListItem Text="Dra. Laura Medina" Value="2" />
                    </asp:DropDownList>
                </div>

                <!-- Día de la semana -->
                <div class="mb-3">
                    <label for="ddlDiaSemana" class="form-label">Día de la semana</label>
                    <asp:DropDownList ID="ddlDiaSemana" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccione un día" Value="" />
                        <asp:ListItem>Lunes</asp:ListItem>
                        <asp:ListItem>Martes</asp:ListItem>
                        <asp:ListItem>Miércoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                        <asp:ListItem>Sábado</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Hora inicio -->
                <div class="mb-3">
                    <label for="txtHoraInicio" class="form-label">Hora de inicio</label>
                    <asp:TextBox ID="txtHoraInicio" runat="server" CssClass="form-control" TextMode="Time" />
                </div>

                <!-- Hora fin -->
                <div class="mb-3">
                    <label for="txtHoraFin" class="form-label">Hora de fin</label>
                    <asp:TextBox ID="txtHoraFin" runat="server" CssClass="form-control" TextMode="Time" />
                </div>

                <!-- Observaciones -->
                <div class="mb-3">
                    <label for="txtObservacion" class="form-label">Observaciones (opcional)</label>
                    <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>

                <!-- Botón ASP.NET oculto -->
                <asp:Button ID="btnGuardarTurnoTrabajo" runat="server" Text="Guardar" Style="display: none;" />
                <!-- Botón visible estilizado -->
                <div class="d-grid">
                    <button type="button" class="btn btn-success" onclick="document.getElementById('<%= btnGuardarTurnoTrabajo.ClientID %>').click();">
                        <i class="fas fa-calendar-plus me-2"></i>Guardar Turno de Trabajo
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
