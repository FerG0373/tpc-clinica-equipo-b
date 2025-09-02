using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Medico
    {
        public int Id { get; set; }
        public int PersonaId { get; set; }
        public string Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NombreCompleto { get { return Apellido + ", " + Nombre; } }
        public string Matricula { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public List<TurnoTrabajo> TurnosDeTrabajo { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
        public bool Activo { get; set; }
    }
}
