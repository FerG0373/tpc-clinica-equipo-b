<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoFormulario.aspx.cs" Inherits="presentacion.Turnos" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="container mt-5">
            <asp:Label ID="lblTurnoFormulario" runat="server" Text="Alta de Turno" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>

            <!-- Datos del paciente -->
            <div class="form-group mb-3">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtDni_TextChanged"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegistrarPaciente" runat="server" Text="Registrar Paciente" CssClass="btn btn-warning mb-4" OnClick="btnRegistrarPaciente_Click" Visible="false" />

            <!-- Datos del turno -->
            <div class="form-group mb-3">
                <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="form-group mb-3">
                <label for="ddlMedico" class="form-label">Medico</label>
                <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="form-group mb-3">
                <label for="ddlTurnoDisponible" class="form-label">Turnos Disponibles (Fecha - Hora - Médico)</label>
                <asp:DropDownList ID="ddlTurnoDisponible" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>

            <div class="form-group mb-3">
                <label for="txtMotivoConsulta" class="form-label">Motivo de consulta</label>
                <asp:TextBox ID="txtMotivoConsulta" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtObservaciones" class="form-label">Observaciones</label>
                <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>

            <div class="text-center mt-4">
                <asp:Button ID="btnGuardarTurno" runat="server" Text="💾 Guardar Turno" CssClass="btn btn-primary px-4" OnClick="btnGuardarTurno_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary ms-2" PostBackUrl="TurnoLista.aspx" />
            </div>
        </div>
    </div>


</asp:Content>
