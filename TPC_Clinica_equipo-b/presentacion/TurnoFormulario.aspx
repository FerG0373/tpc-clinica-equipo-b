<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoFormulario.aspx.cs" Inherits="presentacion.Turnos" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="container mt-5">
            <asp:Label ID="lblTurnoFormulario" runat="server" Text="Alta de Turno" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>

            <!-- DATOS DEL PACIENTE -->
            <%--DNI--%>
            <div class="form-group mb-3">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtDni_TextChanged"></asp:TextBox>
                <asp:Label ID="lblErrorDni" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
            </div>
            <%--NOMBRE--%>
            <div class="form-group mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <%--APELLIDO--%>
            <div class="form-group mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- DATOS DEL TURNO -->
            <%--ESPECIALIDADES--%>
            <asp:UpdatePanel ID="updEspecialidades" runat="server">
                <ContentTemplate>
                    <div class="form-group mb-3">
                        <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="lblErrorEspecialidad" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--MEDICO--%>
            <asp:UpdatePanel ID="updMedicos" runat="server">
                <ContentTemplate>
                    <div class="form-group mb-3">
                        <label for="ddlMedico" class="form-label">Médico</label>
                        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="lblErrorMedico" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--TURNOS--%>
            <asp:UpdatePanel ID="updTurnos" runat="server">
                <ContentTemplate>
                    <div class="form-group mb-3">
                        <label for="ddlTurnoDisponible" class="form-label">Turnos Disponibles</label>
                        <asp:DropDownList ID="ddlTurnoDisponible" runat="server" CssClass="form-select"></asp:DropDownList>
                        <asp:Label ID="lblErrorTurno" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--CONSULTA--%>
            <div class="form-group mb-3">
                <label for="txtMotivoConsulta" class="form-label">Motivo de consulta</label>
                <asp:TextBox ID="txtMotivoConsulta" runat="server" CssClass="form-control"></asp:TextBox>
            </div>            
            <%--BOTÓN GUARDAR--%>
            <div class="text-center mt-4">
                <asp:Button ID="btnGuardarTurno" runat="server" Text="💾 Guardar Turno" CssClass="btn btn-primary px-4 mt-3 mb-4" OnClick="btnGuardarTurno_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="✖ Cancelar" CssClass="btn btn-secondary ms-2 mt-3 mb-4" PostBackUrl="TurnoLista.aspx" />
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
        </div>
    </div>
</asp:Content>
