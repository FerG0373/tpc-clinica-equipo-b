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
        public List<Turno> listarTurnos()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Turno> listaDeTurnos = new List<Turno>();

            try
            {
                datos.setearProcedimiento("SP_turnoListar");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    // 1. Instancia de Turno.
                    Turno aux = new Turno();
                    aux.Id = (int)datos.Lector["TurnoId"];
                    aux.NumeroTurno = (string)datos.Lector["nroTurno"];
                    aux.Fecha = (DateTime)datos.Lector["fecha"];
                    aux.Hora = (TimeSpan)datos.Lector["hora"];
                    aux.Motivo = (string)datos.Lector["motivoConsulta"];
                    aux.Estado = (string)datos.Lector["estado"];
                    //aux.Observaciones = (string)datos.Lector["observacionesMedico"];

                    // 2. Instancias de Paciente.
                    aux.Paciente = new Paciente();
                    aux.Paciente.Id = (int)datos.Lector["PacienteId"];
                    aux.Paciente.Dni = (string)datos.Lector["PacienteDni"];
                    aux.Paciente.Nombre = (string)datos.Lector["PacienteNombre"];
                    aux.Paciente.Apellido = (string)datos.Lector["PacienteApellido"];

                    // 3. Instancias de Medico.
                    aux.Medico = new Medico();
                    aux.Medico.Id = (int)datos.Lector["MedicoId"];
                    aux.Medico.Matricula = (string)datos.Lector["Matricula"];
                    aux.Medico.Nombre = (string)datos.Lector["MedicoNombre"];
                    aux.Medico.Apellido = (string)datos.Lector["MedicoApellido"];

                    // 4. Instancia de Especialidad.
                    aux.Especialidad = new Especialidad();
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
    }
}
