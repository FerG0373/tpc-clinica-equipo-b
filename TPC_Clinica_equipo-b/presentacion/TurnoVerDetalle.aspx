<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoVerDetalle.aspx.cs" Inherits="presentacion.VerDetalleTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Detalle de Turno</h2>
        <div class="row justify-content-center">
            <div class="col-md-8 offset-md-3">
                <div class="row">

                    <!-- Datos del Paciente -->

                    <!-- DNI -->
                    <div>
                        class=" form-group mb-3"
                    <label for="txtDni" class="form-label">DNI</label>
                        <asp:TextBox
                            ID="txtDni"
                            runat="server"
                            AutoPostBack="true"
                            OnTextChanged="txtDni_TextChanged"
                            CssClass="form-control" />
                    </div>

                    <!-- Nombre -->
                    <div class=" form-group mb-3">
                        <label for="txtNombre" class="form-label">Nombre</label>
                        <asp:TextBox
                            ID="txtNombre"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Apellido -->
                    <div class=" form-group mb-3">
                        <label for="txtApellido" class="form-label">Apellido</label>
                        <asp:TextBox
                            ID="txtApellido"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Sexo -->
                    <div class=" form-group mb-3">
                        <label for="ddlSexo" class="form-label">Sexo</label>
                        <asp:DropDownList
                            ID="ddlSexo"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Fecha de Nacimiento -->
                    <div class=" form-group mb-3">
                        <label for="txtFechaNacimiento" class="form-label">Fecha Nacimiento</label>
                        <asp:TextBox
                            ID="txtFechaNacimiento"
                            runat="server"
                            TextMode="Date"
                            CssClass="form-control" />
                    </div>

                    <!-- Teléfono -->
                    <div class=" form-group mb-3">
                        <label for="txtTelefono" class="form-label">Teléfono</label>
                        <asp:TextBox
                            ID="txtTelefono"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Tipo de Cobertura -->
                    <div class=" form-group mb-3">
                        <label for="ddlCobertura" class="form-label">Cobertura</label>
                        <asp:DropDownList
                            ID="ddlCobertura"
                            runat="server"
                            CssClass="form-control" />
                    </div>


                    <!-- Datos del Turno -->

                    <!-- Especialidad -->
                    <div class=" form-group mb-3">
                        <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                        <asp:DropDownList
                            ID="ddlEspecialidad"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"
                            CssClass="form-control" />
                    </div>

                    <!-- Médico -->
                    <div class=" form-group mb-3">
                        <label for="ddlMedico" class="form-label">Médico</label>
                        <asp:DropDownList
                            ID="ddlMedico"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged"
                            CssClass="form-control" />
                    </div>

                    <!-- Fecha -->
                    <div class=" form-group mb-3">
                        <label for="txtFecha" class="form-label">Fecha</label>
                        <asp:TextBox
                            ID="txtFecha"
                            runat="server"
                            TextMode="Date"
                            CssClass="form-control" />
                    </div>

                    <!-- Horario Disponible -->
                    <div class=" form-group mb-3">
                        <label for="ddlHorario" class="form-label">Médico</label>
                        <asp:DropDownList
                            ID="ddlHorario"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Observaciones -->
                    <div class=" form-group mb-3">
                        <label for="txtObservaciones" class="form-label">Observaciones</label>
                        <asp:TextBox
                            ID="txtObsercvaciones"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Boton Volver -->
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
    </div>
</asp:Content>
