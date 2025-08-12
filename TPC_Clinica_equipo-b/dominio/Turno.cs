using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Turno
    {
        public int Id { get; set; }
        public string NumeroTurno { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string MotivoConsulta { get; set; }
        public string ObservacionesMedico { get; set; }
        public int PacienteId { get; set; }
        public int EstadoTurnoId { get; set; }
        public int MedicoId { get; set; }
        public int EspecialidadId { get; set; }

    }
}
