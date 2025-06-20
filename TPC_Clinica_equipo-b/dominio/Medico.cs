using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Medico : Usuario
    {
        public string Matricula { get; set; }
        public List<Especialidad> Especialidades { get; set; }
    }
}
