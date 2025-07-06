<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormularioMedico.aspx.cs" Inherits="presentacion.FormularioMedico" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
    <h2 class="text-center mb-4">Agregar Médico</h2>

    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="mb-3">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtMatricula" class="form-label">Matrícula</label>
                <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            </div>

            <div class="mb-3">
                <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-3 form-check">
                <asp:CheckBox ID="chkActivo" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkActivo">Activo</label>
            </div>

            <div class="text-center mt-4">
                <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar Médico" CssClass="btn btn-success btn-lg px-4" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>
</div>

</asp:Content>
