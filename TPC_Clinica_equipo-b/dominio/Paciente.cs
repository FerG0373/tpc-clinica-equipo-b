using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Paciente : Persona
    {
        public new int Id { get; set; }
        public string HistoriaClinica { get; set; }
        public string TipoCobertura { get; set; }
    }
}
