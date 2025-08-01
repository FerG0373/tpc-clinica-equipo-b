﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoFormulario.aspx.cs" Inherits="presentacion.Turnos" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Agendar Turno</h2>
        <div class="row justify-content-center">
            <div class="col-md-8 offset-md-3">
                <div class="row">

                    <!-- Datos del Paciente -->
                    <h5>Datos del paciente</h5>


                    <!-- DNI -->
                    <div class=" form-group mb-3">
                        <label for="txtDni" class="form-label">DNI</label>
                        <asp:TextBox
                            ID="txtDni"
                            runat="server"
                            AutoPostBack="true"
                            OnTextChanged="txtDni_TextChanged"
                            CssClass="form-control" />
                    </div>

                    <asp:Button
                        ID="btnRegistrarPaciente"
                        runat="server"
                        Text="Registrar nuevo paciente"
                        CssClass="btn btn-warning mt-3"
                        OnClick="btnRegistrarPaciente_Click"
                        Visible="false" />

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

                    <!-- Email -->
                    <div class=" form-group mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox
                            ID="txtEmail"
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
                    <h5>Datos del turno</h5>

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
                        <label for="ddlHorario" class="form-label">Horario disponible</label>
                        <asp:DropDownList
                            ID="ddlHorario"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Motivo Consulta -->
                    <div class=" form-group mb-3">
                        <label for="txtMotivoConsulta" class="form-label">MotivoConsulta</label>
                        <asp:TextBox
                            ID="txtMotivoConsulta"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine" />
                    </div>

                    <!-- Observaciones -->
                    <div class=" form-group mb-3">
                        <label for="txtObservaciones" class="form-label">Observaciones</label>
                        <asp:TextBox
                            ID="txtObsercvaciones"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine" />
                    </div>

                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

                    <!-- Boton Guardar -->
                    <div class=" mt-5 mb-5">
                        <asp:Button
                            ID="btnGuardarTurno"
                            runat="server"
                            Text="💾 Guardar Turno"
                            OnClick="btnGuardarTurno_Click"
                            CssClass="btn btn-success px-4" />
                    </div>
                    <!-- Boton Cancelar -->
                    <div class=" mt-5 mb-5">
                        <asp:Button
                            ID="Button2"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-secondary mb-4"
                            PostBackUrl="~/TurnoLista.aspx" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
