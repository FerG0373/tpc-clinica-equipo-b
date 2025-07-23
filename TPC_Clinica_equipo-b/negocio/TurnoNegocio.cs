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
        public List<TurnoVista> ListarTurnos()
        {
            List<TurnoVista> lista = new List<TurnoVista>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_turnoVistaListar");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TurnoVista vista = new TurnoVista
                    {
                        Id = Convert.ToInt32(datos.Lector["Id"]),
                        NumeroTurno = Convert.ToInt32(datos.Lector["NumeroTurno"]),
                        FechaHora = Convert.ToDateTime(datos.Lector["FechaHora"]),
                        MotivoConsulta = datos.Lector["MotivoConsulta"].ToString(),
                        ObservacionesMedico = datos.Lector["ObservacionesMedico"].ToString(),
                        NombrePaciente = datos.Lector["NombrePaciente"].ToString(),
                        NombreMedico = datos.Lector["NombreMedico"].ToString(),
                        Especialidad = datos.Lector["Especialidad"].ToString(),
                        EstadoTurno = datos.Lector["EstadoTurno"].ToString()
                    };

                    lista.Add(vista);
                }
            }
            finally
            {
                datos.cerrarConexion();
            }

            return lista;
        }
    }
}
