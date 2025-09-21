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
        public Usuario iniciarSesion(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_usuarioLogin");
                datos.setearParametro("@Dni", usuario.Dni);
                datos.setearParametro("@Pass", usuario.Pass);
                datos.ejecutarLectura();

                if (datos.Lector.Read()) {
                    Usuario aux = new Usuario();
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Pass = (string)datos.Lector["Pass"];
                    aux.Activo = (bool)datos.Lector["Activo"];
                    aux.TipoUsuario = (string)datos.Lector["TipoUsuario"];

                    return aux;
                }
                return null;  // No se encontró el usuario.
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
