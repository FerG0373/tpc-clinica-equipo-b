<%@ Page Title="Formulario de pacientes" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="PacienteFormulario.aspx.cs" Inherits="presentacion.FormularioPaciente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Agregar Paciente</h2>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <!--DNI-->
                <div class="form-group mb-3">
                    <label for="txtDni" class="form-label">DNI</label>
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
                </div>
                <!--Nombre-->
                <div class="form-group mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <!--Apellido-->
                <div class="form-group mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                </div>
                <!--Fecha Nacimiento-->
                <div class="form-group mb-3">
                    <label for="txtFechaNacimiento" class="form-label">Fecha Nacimiento</label>
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" textmode="Date" CssClass="form-control" />
                </div>
                <!--Sexo-->
                <div class="form-group mb-3">
                    <label for="ddlSexo" class="form-label">Sexo</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar..." Value="" />
                        <asp:ListItem Text="Masculino" Value="Masculino" />
                        <asp:ListItem Text="Femenino" Value="Femenino" />
                        <asp:ListItem Text="No especificado" Value="No especificado" />
                    </asp:DropDownList>
                </div>
                <!--Telefono-->
                <div class="form-group mb-3">
                    <label for="txtTelefono" class="form-label">Telefono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                </div>
                <!--Email-->
                <div class="form-group mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>
                <!--Tipo de cobertura-->
                <div class="form-group mb-4">
                    <label for="txtTipoCobertura" class="form-label">Tipo Cobertura</label>
                    <asp:TextBox ID="txtTipoCobertura" runat="server" CssClass="form-control" />
                </div>

                <asp:Label ID="lblErrorPaciente" runat="server" CssClass="text-danger fw-bold mb-2" Visible="false"></asp:Label>
                <asp:Label ID="lblExitoPaciente" runat="server" CssClass="text-success fw-bold mb-4" Visible="false"></asp:Label>

                <!--Botón guardar-->
                <div class="text-center mt-5 mb-5">
                    <asp:Button
                        ID="btnGuardarPaciente"
                        runat="server"
                        Text="💾 Guardar Paciente"
                        CssClass="btn btn-success px-4"
                        OnClick="btnGuardarPaciente_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
