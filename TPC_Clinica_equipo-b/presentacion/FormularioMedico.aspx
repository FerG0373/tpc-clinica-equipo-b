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
                    <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    <%--<asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="La contraseña es obligatoria."
                        Display="Dynamic"
                        CssClass="text-danger">
                    </asp:RequiredFieldValidator>--%>
<%--                    <asp:RegularExpressionValidator
                        ID="revPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d).{8,}$"
                        ErrorMessage="Debe tener al menos 8 caracteres (letras y números)."
                        Display="Dynamic"
                        CssClass="text-danger">
                    </asp:RegularExpressionValidator>--%>
                </div>

                <div class="text-center mt-5 mb-5">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-bold d-block mb-3" Visible="false" />
                    <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar Médico" CssClass="btn btn-success btn-lg px-4" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
