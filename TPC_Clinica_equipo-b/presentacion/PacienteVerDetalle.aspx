<%@ Page Title="Detalle del paciente" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="PacienteVerDetalle.aspx.cs" Inherits="presentacion.VerDetallePaciente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Detalle de Paciente</h2>

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
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Apellido</label>
                    <asp:TextBox
                        ID="txtApellido"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Fecha Nacimiento</label>
                    <asp:TextBox
                        ID="txtFechaNacimiento"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Sexo</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control" Enable="false">
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
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Email</label>
                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Tipo de Cobertura</label>
                    <asp:TextBox
                        ID="txtTipoCobertura"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group mb-3">
                    <label>Historial Clínico</label>
                    <asp:TextBox
                        ID="txtHistorialClinico"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>
                <div class="form-group form-check mb-3">
                    <asp:CheckBox ID="chkActivo" runat="server" Enable="false" />
                    <label class="form-check-label" for="chkActivo">Activo</label>
                </div>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

                <div class="d-flex justify-content-end mb-4">
                    <asp:Button
                        ID="btnVolver"
                        runat="server"
                        Text="← Volver a la Lista"
                        CssClass="btn btn-secondary"
                        OnClick="btnVolver_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
