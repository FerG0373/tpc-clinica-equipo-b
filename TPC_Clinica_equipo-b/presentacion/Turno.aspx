<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Turno.aspx.cs" Inherits="presentacion.Turnos" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center mb-4">Agendar Turno</h2>
                <form asp-action="CrearTurno" method="post">

                    <!-- Paciente -->
                    <div class="mb-3">
                        <label for="PacienteId" class="form-label">Paciente</label>
                        <select class="form-select" id="PacienteId" name="PacienteId" required>
                            <option value="">Seleccione un paciente</option>
                            <!-- Ejemplo: podrías cargar desde base de datos -->
                            <option value="1">DNI 12345678 - Juan Pérez</option>
                            <option value="2">DNI 23456789 - Ana López</option>
                        </select>
                    </div>

                    <!-- Especialidad -->
                    <div class="mb-3">
                        <label for="Especialidad" class="form-label">Especialidad</label>
                        <select class="form-select" id="Especialidad" name="Especialidad" required onchange="filtrarMedicosPorEspecialidad(this.value)">
                            <option value="">Seleccione una especialidad</option>
                            <option value="Cardiología">Cardiología</option>
                            <option value="Pediatría">Pediatría</option>
                            <option value="Clínica">Clínica</option>
                        </select>
                    </div>

                    <!-- Médico -->
                    <div class="mb-3">
                        <label for="MedicoId" class="form-label">Médico</label>
                        <select class="form-select" id="MedicoId" name="MedicoId" required>
                            <option value="">Seleccione un médico</option>
                            <!-- Este select se puede llenar dinámicamente con JS -->
                            <option value="1" data-especialidad="Cardiología">Dr. Carlos Gómez</option>
                            <option value="2" data-especialidad="Pediatría">Dra. Laura Medina</option>
                            <option value="3" data-especialidad="Clínica">Dr. Pablo Suárez</option>
                        </select>
                    </div>

                    <!-- Fecha -->
                    <div class="mb-3">
                        <label for="FechaTurno" class="form-label">Fecha</label>
                        <input type="date" class="form-control" id="FechaTurno" name="FechaTurno" required>
                    </div>

                    <!-- Hora -->
                    <div class="mb-3">
                        <label for="HoraTurno" class="form-label">Hora</label>
                        <input type="time" class="form-control" id="HoraTurno" name="HoraTurno" required>
                    </div>

                    <!-- Observaciones -->
                    <div class="mb-3">
                        <label for="Observacion" class="form-label">Motivo / Observaciones</label>
                        <textarea class="form-control" id="Observacion" name="Observacion" rows="3" placeholder="Motivo de la consulta (opcional)"></textarea>
                    </div>

                    <!-- Botón -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Confirmar Turno</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Script para filtrar médicos por especialidad -->
    <script>
        function filtrarMedicosPorEspecialidad(especialidad) {
            const medicos = document.querySelectorAll("#MedicoId option");
            medicos.forEach(opt => {
                if (!opt.value) return; // dejar la opción vacía
                opt.style.display = opt.dataset.especialidad === especialidad ? "block" : "none";
            });
            document.getElementById("MedicoId").value = ""; // reset
        }
    </script>
</asp:Content>
