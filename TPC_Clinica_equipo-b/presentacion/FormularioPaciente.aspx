<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormularioPaciente.aspx.cs" Inherits="presentacion.FormularioPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="container mt-5">
        <h2 class="text-center mb-4">Agregar Médico</h2>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%--DNI--%>
                <div class="mb-3">
                    <label for="txtDni" class="form-label">DNI</label>
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
                </div>
                <%--Nombre--%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <%--Apellido--%>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                </div>
                <%--Fecha Nacimiento--%>
                <div class="mb-3">
                    <label for="txtFechaNacimiento" class="form-label">Fecha Nacimiento</label>
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" />
                </div>
                <%--Sexo--%>
                <div class="mb-3">
                    <label for="ddlSexo" class="form-label">Sexo</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-select" />
                </div>
                <%--Telefono--%>
                <div class="mb-3">
                    <label for="txtTelefono" class="form-label">Telefono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                </div>
                <%--Email--%>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>
                <%--Tipo de cobertura--%>
                <div class="mb-3">
                    <label for="txtTipoCobertura" class="form-label">Tipo Cobertura</label>
                    <asp:TextBox ID="txtTipoCobertura" runat="server" CssClass="form-control" />
                </div>
                <%--Botón guardar--%>
                <div class="text-center mt-5 mb-5">
                    <asp:Button ID="btnGuardarPaciente" runat="server" Text="💾 Guardar Paciente" CssClass="btn btn-success btn-lg px-4" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
