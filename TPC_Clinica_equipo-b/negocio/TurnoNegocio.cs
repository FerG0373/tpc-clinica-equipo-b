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
                        NumeroTurno = datos.Lector["NumeroTurno"].ToString(),
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

        //public void Agregar(Turno nuevoTurno)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearProcedimiento("SP_agregarTurno");
        //        datos.setearParametro("@FechaHora", nuevoTurno.FechaHora);
        //        datos.setearParametro("@MotivoConsulta", nuevoTurno.MotivoConsulta);
        //        datos.setearParametro("@ObservacionesMedico", nuevoTurno.ObservacionesMedico);
        //        datos.setearParametro("@PacienteId", nuevoTurno.PacienteId);
        //        datos.setearParametro("@MedicoId", nuevoTurno.MedicoId);
        //        datos.setearParametro("@EspecialidadId", nuevoTurno.EspecialidadId);
        //        datos.setearParametro("@EstadoTurnoId", nuevoTurno.EstadoTurnoId);

        //        datos.ejecutarAccion();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }
        //}
    }
}
