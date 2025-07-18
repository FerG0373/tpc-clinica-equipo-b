using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class MedicoNegocio
    {
        public List<Medico> listarMedicos(string id = "")
        {
            AccesoDatos datos = new AccesoDatos();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            List<Medico> listaMedicos = new List<Medico>();
            var relacionEspecialidadMedico = especialidadNegocio.listarEspecialidadesMedicos();

            try
            {
                datos.setearProcedimiento("SP_medicoListar");

                // INICIO: Lógica para pasar el parámetro ID al SP.
                if (!string.IsNullOrEmpty(id)) // Si el ID no está vacío.
                {
                    // Intenta convertir el string ID a un entero.
                    if (int.TryParse(id, out int idNumerico))  // Evita que la aplicación se bloquee si el usuario ingresa texto no numérico.
                    {
                        // Si la conversión es exitosa, setea el parámetro "@id" para el SP.
                        datos.setearParametro("@id", idNumerico);
                    }
                }

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Id = (int)datos.Lector["MedicoId"];
                    aux.PersonaId = (int)datos.Lector["PersonaId"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Matricula = (string)datos.Lector["Matricula"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Pass = (string)datos.Lector["Pass"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    aux.Especialidades = new List<Especialidad>();
                    foreach (var relacion in relacionEspecialidadMedico)
                    {
                        if (relacion.MedicoId == aux.Id)
                        {
                            aux.Especialidades.Add(relacion.Especialidad);
                        }
                    }

                    listaMedicos.Add(aux);

                }
                return listaMedicos;
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

        public void insertarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.iniciarTransaccion();

                datos.setearProcedimiento("SP_medicoInsertar");
                datos.setearParametro("@dni", medico.Dni);
                datos.setearParametro("@nombre", medico.Nombre);
                datos.setearParametro("@apellido", medico.Apellido);
                datos.setearParametro("@matricula", medico.Matricula);
                datos.setearParametro("@email", medico.Email);
                datos.setearParametro("@pass", medico.Pass);

                // Parámetro de salida. Necesito el id del médico insertado para tener control desde c# y poder recorrer la lista de especialidades.
                SqlParameter medicoIdParametroSalida = new SqlParameter("@medico_idSalida", System.Data.SqlDbType.Int);  // Crea un parámetro "@medico_id" del tipo INT (para capturar el ID generado).
                medicoIdParametroSalida.Direction = System.Data.ParameterDirection.Output;  // Indica que este parámetro es de salida y va a recibir luego el id del médico insertado.
                datos.setearParametroSalida(medicoIdParametroSalida);  // Agrega el parámetro al SqlCommand para que el SP lo incluya en la ejecución.

                datos.ejecutarAccion();

                int idMedicoInsertado = (int)medicoIdParametroSalida.Value;  // Obtiene el ID del médico insertado.

                foreach (Especialidad especialidad in medico.Especialidades)
                {
                    insertarEspecialidadMedico(datos, idMedicoInsertado, especialidad.Id);
                }

                datos.confirmarTransaccion();
            }
            catch (Exception ex)
            {
                datos.cancelarTransaccion();
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void insertarEspecialidadMedico(AccesoDatos datos, int medicoId, int especialidadId)
        {
            try
            {
                datos.setearConsulta("INSERT INTO Medico_Especialidad (medico_id, especialidad_id) VALUES (@medicoId, @especialidadId)");
                datos.setearParametro("@medicoId", medicoId);
                datos.setearParametro("@especialidadId", especialidadId);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void modificarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (string.IsNullOrWhiteSpace(medico.Pass))
                {
                    throw new ArgumentException("La contraseña no puede estar vacía.");
                }

                datos.iniciarTransaccion();

                // Modifica los datos de Persona, Usuario y Medico.
                datos.setearProcedimiento("SP_medicoModificar");
                datos.setearParametro("@idPersona", medico.PersonaId);
                datos.setearParametro("@dni", medico.Dni);
                datos.setearParametro("@nombre", medico.Nombre);
                datos.setearParametro("@apellido", medico.Apellido);
                datos.setearParametro("@matricula", medico.Matricula);
                datos.setearParametro("@email", medico.Email);
                datos.setearParametro("@pass", medico.Pass);

                datos.ejecutarAccion();

                // Borra todas las especialidades actuales del médico de la tabla Medico_Especialidad.
                datos.setearConsulta("DELETE FROM Medico_Especialidad WHERE medico_id = @idMedico");
                datos.setearParametro("@idMedico", medico.Id); // Usa el ID del médico.
                datos.ejecutarAccion();

                // Insertar las nuevas especialidades que vienen en el objeto medico.
                foreach (Especialidad especialidad in medico.Especialidades)
                {
                    datos.setearConsulta("INSERT INTO Medico_Especialidad (medico_id, especialidad_id) VALUES (@medicoId, @especialidadId)");
                    datos.setearParametro("@medicoId", medico.Id);
                    datos.setearParametro("@especialidadId", especialidad.Id);
                    datos.ejecutarAccion();
                }

                datos.confirmarTransaccion();
            }
            catch (Exception ex)
            {
                datos.cancelarTransaccion();
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void desactivarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Usuario SET activo = 0 WHERE persona_id = @idPersona");
                datos.setearParametro("@idPersona", medico.Id);
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
