using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Persona> listar()
        {
            List<Persona> lista = new List<Persona>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_Listar2");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Persona aux = new Persona();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    //aux.Email = (string)datos.Lector["Email"];
                    //aux.Contraseña = (string)datos.Lector["Contraseña"];
                    //aux.PerfilAccesoId = (int)datos.Lector["PerfilAccesoId"];
                    //aux.Matricula = (string)datos.Lector["Matrícula"];
                    //aux.Activo = (int)datos.Lector["Activo"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    public Usuario Login(string dni, string pass)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
            SELECT u.Id, 
                   u.persona_id, 
                   u.dni, 
                   u.pass, 
                   u.perfilAcceso_id, 
                   u.activo
            FROM Usuario u
            WHERE u.Dni = @dni
              AND u.Pass = @pass
              AND u.activo = 1");

                datos.setearParametro("@dni", dni);
                datos.setearParametro("@pass", pass);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario
                    {
                        Id = (int)datos.Lector["Id"],
                        PersonaId = (int)datos.Lector["persona_id"],
                        Dni = (string)datos.Lector["Dni"],
                        Pass = (string)datos.Lector["Pass"],
                        PerfilAccesoId = (int)datos.Lector["perfilAcceso_id"],
                        Activo = (bool)datos.Lector["activo"]
                    };

                    // Convertir PerfilAccesoId al enum TipoUsuario
                    usuario.TipoUsuario = (TipoUsuario)usuario.PerfilAccesoId;

                    return usuario;
                }
            }
            finally
            {
                datos.cerrarConexion();
            }

            return null;
        }
    }
}
