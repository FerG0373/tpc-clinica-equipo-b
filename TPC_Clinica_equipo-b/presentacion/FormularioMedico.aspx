<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormularioMedico.aspx.cs" Inherits="presentacion.FormularioMedico" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
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
                <%--Matrícula--%>
                <div class="mb-3">
                    <label for="txtMatricula" class="form-label">Matrícula</label>
                    <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" />
                </div>
                <%--Especialidad(es)--%>
                <asp:UpdatePanel ID="updEspecialidades" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                            <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" />
                            <%--Botón Agregar Especialidad--%>
                            <asp:Button ID="btnAgrearEspecialidad" runat="server" Text="Agregar" CssClass="btn btn-outline-primary mt-2" OnClick="btnAgregarEspecialidad_Click" />
                            <asp:ListBox ID="lstbEspecialidadesSeleccionadas" runat="server" CssClass="form-control mt-4" AutoPostBack="true" OnSelectedIndexChanged="lstbEspecialidadesSeleccionadas_SelectedIndexChanged" />
                            <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                            <%--Botón Eliminar Especialidad--%>
                            <asp:Button ID="btnQuitarEspecialidad" runat="server" Text="Quitar" CssClass="btn btn-outline-danger mt-2" OnClick="btnQuitarEspecialidad_Click"/>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--Email--%>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>
                <%--Contraseña--%>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:Label ID="lblErrorPass" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
                    <%--<asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="La contraseña es obligatoria."
                        Display="Dynamic"
                        CssClass="text-danger">
                    </asp:RequiredFieldValidator>--%>
                    <%--<asp:RegularExpressionValidator
                        ID="revPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d).{8,}$"
                        ErrorMessage="Debe tener al menos 8 caracteres (letras y números)."
                        Display="Dynamic"
                        CssClass="text-danger">
                    </asp:RegularExpressionValidator>--%>
                </div>
                <%--Botón guardar--%>
                <div class="text-center mt-5 mb-5">
                    <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar Médico" CssClass="btn btn-success btn-lg px-4" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
