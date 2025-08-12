<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoFormulario.aspx.cs" Inherits="presentacion.Turnos" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Registrar Turno</h2>

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

            <div class="form-group mb-3">
                <label for="txtSexo" class="form-label">Sexo</label>
                <asp:TextBox ID="txtSexo" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtTelefono" class="form-label">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group mb-4">
                <label for="txtCobertura" class="form-label">Cobertura</label>
                 <asp:TextBox ID="txtCobertura" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegistrarPaciente" runat="server" Text="Registrar Paciente" CssClass="btn btn-warning mb-4" OnClick="btnRegistrarPaciente_Click" Visible="false" />

            <hr class="my-4" />

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
