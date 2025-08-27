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
        public string Motivo { get; set; }
        public string Observaciones { get; set; }
        public string Estado { get; set; }
        public Paciente Paciente { get; set; }
        public Especialidad Especialidad { get; set; }
        public Medico Medico { get; set; }
    }
}
