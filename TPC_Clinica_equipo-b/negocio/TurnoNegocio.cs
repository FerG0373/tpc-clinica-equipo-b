using dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class TurnoNegocio
    {
        public List<Turno> listarTurnos(string id = "")
        {
            AccesoDatos datos = new AccesoDatos();
            List<Turno> listaDeTurnos = new List<Turno>();

            try
            {
                datos.setearProcedimiento("SP_turnoListar");

                if (!string.IsNullOrEmpty(id))
                {
                    if (int.TryParse(id, out int idNumerico))
                    {
                        datos.setearParametro("@id", idNumerico);
                    }
                }

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    // 1. Instancia de Turno.
                    Turno aux = new Turno();
                    aux.Id = (int)datos.Lector["TurnoId"];
                    aux.Fecha = (DateTime)datos.Lector["fecha"];
                    aux.Hora = (TimeSpan)datos.Lector["hora"];
                    aux.Motivo = (string)datos.Lector["motivoConsulta"];
                    aux.Estado = (string)datos.Lector["estado"];
                    aux.Observaciones = (datos.Lector["observacionesMedico"] != DBNull.Value) ? (string)datos.Lector["observacionesMedico"] : "Sin observaciones";

                    // 2. Instancia de Paciente.
                    aux.Paciente = new Paciente();
                    aux.Paciente.Id = (int)datos.Lector["PacienteId"];
                    aux.Paciente.Dni = (string)datos.Lector["PacienteDni"];
                    aux.Paciente.Nombre = (string)datos.Lector["PacienteNombre"];
                    aux.Paciente.Apellido = (string)datos.Lector["PacienteApellido"];

                    // 3. Instancia de Medico.
                    aux.Medico = new Medico();
                    aux.Medico.Id = (int)datos.Lector["MedicoId"];
                    aux.Medico.Matricula = (string)datos.Lector["Matricula"];
                    aux.Medico.Nombre = (string)datos.Lector["MedicoNombre"];
                    aux.Medico.Apellido = (string)datos.Lector["MedicoApellido"];

                    // 4. Instancia de Especialidad.
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Id = (int)datos.Lector["EspecialidadId"];
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];

                    listaDeTurnos.Add(aux);
                }

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

        public List<Turno> listarTurnosPorMedicoYFecha(int medicoId, DateTime fecha)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Turno> listaDeTurnos = new List<Turno>();

            try
            {
                datos.setearProcedimiento("SP_turnoListarPorMedicoYFecha");
                datos.setearParametro("@medicoId", medicoId);
                datos.setearParametro("@fecha", fecha);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    // Para la lógica de turnos disponibles, solo se necesita la fecha y la hora. No se preocupa por la presentación de los datos al usuario.
                    aux.Id = (int)datos.Lector["TurnoId"];
                    aux.Fecha = (DateTime)datos.Lector["fecha"];
                    aux.Hora = (TimeSpan)datos.Lector["hora"];

                    listaDeTurnos.Add(aux);
                }
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

        public void insertarTurno(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_turnoInsertar");

                datos.setearParametro("@PacienteId", turno.Paciente.Id);
                datos.setearParametro("@MedicoId", turno.Medico.Id);
                datos.setearParametro("@Fecha", turno.Fecha.Date);
                datos.setearParametro("@Hora", turno.Hora);
                datos.setearParametro("@Motivo", turno.Motivo);
                datos.setearParametro("@Estado", turno.Estado);
                datos.setearParametro("@observacionesMedico", turno.Observaciones);

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

        public void modificarTurno(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_turnoModificar");
                datos.setearParametro("@TurnoId", turno.Id);
                datos.setearParametro("@PacienteId", turno.Paciente.Id);
                datos.setearParametro("@MedicoId", turno.Medico.Id);
                datos.setearParametro("@Fecha", turno.Fecha.Date);
                datos.setearParametro("@Hora", turno.Hora);
                datos.setearParametro("@Motivo", turno.Motivo);
                datos.setearParametro("@Estado", turno.Estado);
                datos.setearParametro("@observacionesMedico", turno.Observaciones);
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
    }
}
