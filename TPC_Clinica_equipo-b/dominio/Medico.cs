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
        public string Matricula { get; set; }

        // Relación con Usuario
        public Usuario Usuario { get; set; }
        public int UsuarioId { get; set; }

        //Relación con Especialidades
        public List<Especialidad> Especialidades { get; set; }
    }
}
