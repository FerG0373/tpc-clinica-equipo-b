using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class TurnoVista
    {
        public int Id { get; set; }
        public string NumeroTurno { get; set; }
        public DateTime FechaHora { get; set; }
        public string MotivoConsulta { get; set; }
        public string ObservacionesMedico { get; set; }
        public string NombrePaciente { get; set; }
        public string NombreMedico { get; set; }
        public string Especialidad { get; set; }
        public string EstadoTurno { get; set; }
    }
}
