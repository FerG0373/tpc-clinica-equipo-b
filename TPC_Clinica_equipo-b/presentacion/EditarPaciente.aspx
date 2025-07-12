<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="EditarPaciente.aspx.cs" Inherits="presentacion.EditarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Editar Paciente</h2>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="form-group mb-3">
                    <label>DNI</label>
                    <asp:TextBox 
                        ID="txtDni" 
                        runat="server" 
                        CssClass="form-control" 
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Nombre</label>
                    <asp:TextBox 
                        ID="txtNombre"
                        runat="server" 
                        CssClass="form-control" />
                     <asp:Label 
                         ID="lblNombreError" 
                         runat="server" 
                         CssClass="text-danger" 
                         Visible="false" />
                </div>
                <div class="form-group mb-3">
                    <label>Apellido</label>
                    <asp:TextBox 
                        ID="txtApellido" 
                        runat="server" 
                        CssClass="form-control" />
                    <asp:Label 
                        ID="lblApellidoError" 
                        runat="server"
                        CssClass="text-danger" 
                        Visible="false" />
                </div>
                <div class="form-group mb-3">
                    <label>Fecha Nacimiento</label>
                    <asp:TextBox 
                        ID="txtFechaNacimiento" 
                        runat="server" 
                        TextMode="Date" 
                        CssClass="form-control" />
                    <asp:Label 
                        ID="lblFechaError" 
                        runat="server" 
                        CssClass="text-danger" 
                        Visible="false" />
                </div>
                <div class="form-group mb-3">
                    <label>Sexo</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                        <asp:ListItem Text="No especificado" Value="No especificado" />
                        <asp:ListItem Text="Masculino" Value="Masculino" />
                        <asp:ListItem Text="Femenino" Value="Femenino" />
                    </asp:DropDownList>
                </div>
                <div class="form-group mb-3">
                    <label>Teléfono</label>
                    <asp:TextBox 
                        ID="txtTelefono" 
                        runat="server" 
                        CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label>Email</label>
                    <asp:TextBox 
                        ID="txtEmail" 
                        runat="server" 
                        TextMode="Email"
                        CssClass="form-control" />
                    <asp:Label 
                        ID="lblEmailError" 
                        runat="server" 
                        CssClass="text-danger" 
                        Visible="false" />
                </div>
                <div class="form-group mb-3">
                    <label>Tipo de Cobertura</label>
                    <asp:TextBox 
                        ID="txtTipoCobertura" 
                        runat="server" 
                        CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label>Historial Clínico</label>
                    <asp:TextBox 
                        ID="txtHistorialClinico" 
                        runat="server" 
                        TextMode="MultiLine" 
                        CssClass="form-control" />
                </div>
                <div class="form-group form-check mb-3">
                    <asp:CheckBox ID="chkActivo" runat="server" />
                    <label class="form-check-label" for="chkActivo">Activo</label>
                </div>

                <asp:Label ID="lblErrorEditarPacienteGeneral" runat="server" CssClass="text-danger" Visible="false" />
                <asp:Label ID="lblExitoEditarPaciente" runat="server" CssClass="text-success" Visible="false" />

                <!-- Botones -->
                <div class="form-group d-flex justify-content-between">

                    <!-- Botones Guardar-->
                    <asp:Button
                        ID="btnGuardar"
                        runat="server"
                        Text="💾 Guardar Cambios"
                        CssClass="btn btn-success btn-block mb-4"
                        OnClick="btnGuardar_Click" />

                    <!-- Boton Cancelar -->
                    <asp:Button
                        ID="Button2"
                        runat="server"
                        Text="Cancelar"
                        CssClass="btn btn-secondary mb-4"
                        PostBackUrl="~/ListaPaciente.aspx" />
                </div>
            </div>
        </div>
</asp:Content>
