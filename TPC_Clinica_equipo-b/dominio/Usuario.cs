using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace dominio
{
    public class Usuario
    {
        public int Id { get; set; }

        public int Dni { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        //public DateTime FechaNacimiento { get; set; } 

        //public string Sexo { get; set; }

        //public string Telefono { get; set; }

        public string Email { get; set; }

        public string Contraseña { get; set; }

        //public string Direccion { get; set; }

        public int PerfilAccesoId { get; set; }

        public int Activo { get; set; }


    }
}
