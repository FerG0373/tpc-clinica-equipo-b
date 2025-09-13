<%@ Page Title="Formulario Médico" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="MedicoFormulario.aspx.cs" Inherits="presentacion.MedicoFormulario" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <%--Título--%>       
        <asp:Label ID="lblTituloFormularioMedico" runat="server" Text="Agregar Médico" CssClass="text-center mb-4 d-block fs-2 fw-semibold"></asp:Label>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%--DNI--%>
                <div class="mb-3">
                    <label for="txtDni" class="form-label fw-semibold">DNI</label>
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorDni" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Nombre--%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label fw-semibold">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorNombre" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Apellido--%>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label fw-semibold">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorApellido" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Matrícula--%>
                <div class="mb-3">
                    <label for="txtMatricula" class="form-label fw-semibold">Matrícula</label>
                    <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorMatricula" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Especialidad(es)--%>
                <asp:UpdatePanel ID="updEspecialidades" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="ddlEspecialidad" class="form-label fw-semibold">Especialidad</label>
                            <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" />
                            <%--Botón Agregar Especialidad--%>
                            <asp:Button ID="btnAgrearEspecialidad" runat="server" Text="Agregar" CssClass="btn btn-outline-primary mt-2" OnClick="btnAgregarEspecialidad_Click" />
                            <asp:ListBox ID="lstbEspecialidadesSeleccionadas" runat="server" CssClass="form-control mt-4" AutoPostBack="true" OnSelectedIndexChanged="lstbEspecialidadesSeleccionadas_SelectedIndexChanged" />
                            <asp:Label ID="lblErrorEspecialidad" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                            <%--Botón Eliminar Especialidad--%>
                            <asp:Button ID="btnQuitarEspecialidad" runat="server" Text="Quitar" CssClass="btn btn-outline-danger mt-2" OnClick="btnQuitarEspecialidad_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--Email--%>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label fw-semibold">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    <asp:Label ID="lblErrorEmail" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Contraseña--%>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label fw-semibold">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:Label ID="lblErrorPass" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                </div>
                <%--Botón guardar--%>
                <div class="text-center mt-5 mb-5">
                    <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar" CssClass="btn btn-success px-4 me-4" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="✖ Cancelar" CssClass="btn btn-danger px-4" OnClick="btnCancelar_Click" />
                </div>
                 <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
            </div>
        </div>
    </div>

</asp:Content>
