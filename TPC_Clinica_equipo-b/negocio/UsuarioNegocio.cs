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
        public  List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //datos.setearConsulta("SELECT Id, Dni, Nombre, Apellido, Email, Contraseña, PerfilAccesoId, Activo FROM USUARIOS");
                
                datos.setearProcedimiento("SP_Listar");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Dni = (int)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Contraseña = (string)datos.Lector["Contraseña"];
                    aux.PerfilAccesoId = (int)datos.Lector["PerfilAccesoId"];
                    aux.Activo = (int)datos.Lector["Activo"];
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
    }
}
