using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;

namespace negocio
{
    public class TurnoNegocio
    {
        public List<Turno> listarTurnos()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Turno> listaDeTurnos = new List<Turno>();

            try
            {


                return listaDeTurnos;
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
