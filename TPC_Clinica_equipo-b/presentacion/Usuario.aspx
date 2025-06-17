<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="presentacion.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Alta de Usuario</h2>
                <form asp-action="CrearUsuario" method="post">
                    <!-- DNI -->
                    <div class="mb-3">
                        <label for="Dni" class="form-label">DNI</label>
                        <input type="text" class="form-control" id="Dni" name="Dni" required>
                    </div>

                    <!-- Nombre -->
                    <div class="mb-3">
                        <label for="Nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                    </div>

                    <!-- Apellido -->
                    <div class="mb-3">
                        <label for="Apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" id="Apellido" name="Apellido" required>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="Email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="Email" name="Email" required>
                    </div>

                    <!-- Perfil de Acceso -->
                    <div class="mb-3">
                        <label for="Perfil" class="form-label">Perfil de Acceso</label>
                        <select class="form-select" id="Perfil" name="Perfil" required onchange="toggleCamposMedico(this.value)">
                            <option value="">Seleccione un perfil</option>
                            <option value="medico">Médico</option>
                            <option value="recepcionista">Recepcionista</option>
                            <option value="admin">Administrador</option>
                        </select>
                    </div>

                    <!-- Matrícula (solo médico) -->
                    <div class="mb-3" id="MatriculaGroup" style="display: none;">
                        <label for="Matricula" class="form-label">Matrícula</label>
                        <input type="text" class="form-control" id="Matricula" name="Matricula">
                    </div>

                    <!-- Especialidad (solo médico) -->
                    <div class="mb-3" id="EspecialidadGroup" style="display: none;">
                        <label for="Especialidad" class="form-label">Especialidad</label>
                        <input type="text" class="form-control" id="Especialidad" name="Especialidad">
                    </div>

                    <!-- Contraseña -->
                    <div class="mb-3">
                        <label for="Password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="Password" name="Password" required>
                    </div>

                    <!-- Confirmar contraseña -->
                    <div class="mb-3">
                        <label for="ConfirmPassword" class="form-label">Confirmar Contraseña</label>
                        <input type="password" class="form-control" id="ConfirmPassword" name="ConfirmPassword" required>
                    </div>

                    <!-- Activo -->
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="Activo" name="Activo" checked>
                        <label class="form-check-label" for="Activo">Usuario activo</label>
                    </div>

                    <!-- Botón -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Guardar Usuario</button>
                    </div>

                    <!-- Script para mostrar matrícula y especialidad si es médico -->
                    <script>
                        function toggleCamposMedico(perfil) {
                            const mostrar = perfil === "medico";
                            document.getElementById("MatriculaGroup").style.display = mostrar ? "block" : "none";
                            document.getElementById("EspecialidadGroup").style.display = mostrar ? "block" : "none";
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
