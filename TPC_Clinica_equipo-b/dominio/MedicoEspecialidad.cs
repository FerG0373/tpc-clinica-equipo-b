using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    internal class MedicoEspecialidad
    {
        public int Id { get; set; }
        public int MedicoId { get; set; }
        public int EspecialidadId { get; set; }
    }
}
