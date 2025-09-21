using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {        
        public string Dni { get; set; }
        public string Pass { get; set; }
        public string TipoUsuario { get; set; }
        public bool Activo { get; set; }
    }
}
