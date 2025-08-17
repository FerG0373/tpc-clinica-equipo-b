using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TurnoTrabajoNegocio
    {
        public List<TurnoTrabajo> listarTurnosDeTrabajo(string id = "")
        {
            AccesoDatos datos = new AccesoDatos();
            List<TurnoTrabajo> listaTurnosDeTrabajo = new List<TurnoTrabajo>();

            try
            {
                datos.setearProcedimiento("SP_turnoTrabajoListar");
                if(!string.IsNullOrEmpty(id))
                {
                    if (int.TryParse(id, out int idNumerico))
                    {
                        datos.setearParametro("@id", idNumerico);
                    }
                }

                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    listaTurnosDeTrabajo.Add(aux);
                }
                return listaTurnosDeTrabajo;
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

        public List<TurnoTrabajo> listarTurnosDeTrabajoPorMedico(int medicoId)
        {
            AccesoDatos datos = new AccesoDatos();
            List<TurnoTrabajo> lista = new List<TurnoTrabajo>();

            try
            {
                datos.setearProcedimiento("SP_turnoTrabajoListarPorMedico");
                datos.setearParametro("@medicoId", medicoId);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];
                    aux.Activo = (bool)datos.Lector["Activo"];

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

        public void guardarTurnoDeTrabajo(int medicoId, int turnoTrabajoId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Medico_TurnoTrabajo (medico_id, turnoTrabajo_id) VALUES (@medicoId, @turnoTrabajoId)");
                datos.setearParametro("@medicoId", medicoId);
                datos.setearParametro("@turnoTrabajoId", turnoTrabajoId);
                datos.ejecutarAccion();
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

        public void eliminarTurnoDeTrabajo(int medicoId, int turnoTrabajoId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Medico_TurnoTrabajo WHERE medico_id = @medicoId AND turnoTrabajo_id = @turnoTrabajoId");
                datos.setearParametro("@medicoId", medicoId);
                datos.setearParametro("@turnoTrabajoId", turnoTrabajoId);
                datos.ejecutarAccion();
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

        public void insertarTurnoTrabajo(TurnoTrabajo nuevoTurnoTrabajo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO TurnoTrabajo (DiaSemana, HoraInicio, HoraFin) VALUES (@DiaSemana, @HoraInicio, @HoraFin)");
                datos.setearParametro("@diaSemana", nuevoTurnoTrabajo.DiaSemana);
                datos.setearParametro("@horaInicio", nuevoTurnoTrabajo.HoraInicio);
                datos.setearParametro("@HoraFin", nuevoTurnoTrabajo.HoraFin);
                datos.ejecutarAccion();
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

        public void actualizarTurnoTrabajo(TurnoTrabajo turnoTrabajo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_turnoTrabajoActualizar");
                datos.setearParametro("@id", turnoTrabajo.Id);
                datos.setearParametro("@diaSemana", turnoTrabajo.DiaSemana);
                datos.setearParametro("@horaInicio", turnoTrabajo.HoraInicio);
                datos.setearParametro("@horaFin", turnoTrabajo.HoraFin);

                datos.ejecutarAccion();
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




        // POSIBLEMENTE BORRAR listarMedicoTurnoTrabajo()
        public List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listarMedicoTurnoTrabajo()
        {
            AccesoDatos datos = new AccesoDatos();
            List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listaTurnosDeTrabajoPorMedicos = new List<(int, TurnoTrabajo)>();

            try
            {
                datos.setearProcedimiento("SP_turnoTrabajoListarPorMedico");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    int MedicoId = (int)datos.Lector["Medico_Id"];
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];

                    listaTurnosDeTrabajoPorMedicos.Add((MedicoId,aux));
                }
                return listaTurnosDeTrabajoPorMedicos;
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
