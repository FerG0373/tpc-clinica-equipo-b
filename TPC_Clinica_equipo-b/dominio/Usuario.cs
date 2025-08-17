using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public enum TipoUsuario
    {
        Administrador = 1,
        Recepcionista = 2,
        Medico = 3
    }
    public class Usuario
    {
        public int Id { get; set; }
        public int PersonaId { get; set; }
        public string Dni { get; set; }
        public string Pass { get; set; }
        public int PerfilAccesoId { get; set; }
        public bool Activo { get; set; }
        public TipoUsuario TipoUsuario { get; set; }

        public Usuario() { }
    }
}
