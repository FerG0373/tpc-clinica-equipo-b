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
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();

            List<Medico> listaMedicos = new List<Medico>();
            var relacionEspecialidadMedico = negocioEspecialidad.listarEspecialidadesMedicos();

            try
            {
                datos.setearProcedimiento("SP_obtenerMedicos");

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
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Matricula = (string)datos.Lector["Matricula"];
                    aux.Email = (string)datos.Lector["Email"];
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

        public void agregarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.iniciarTransaccion();

                datos.setearProcedimiento("SP_altaMedico");
                datos.setearParametro("@dni", medico.Dni);
                datos.setearParametro("@nombre", medico.Nombre);
                datos.setearParametro("@apellido", medico.Apellido);
                datos.setearParametro("@matricula", medico.Matricula);
                datos.setearParametro("@email", medico.Email);
                datos.setearParametro("@pass", medico.Pass);

                // Parámetro de salida. Necesito el id del médico insertado para tener control desde c# y poder recorrer la lista de especialidades.
                SqlParameter outputId = new SqlParameter("@medico_id", System.Data.SqlDbType.Int);  // Crea un parámetro "@medico_id" del tipo INT (para capturar el ID generado).
                outputId.Direction = System.Data.ParameterDirection.Output;  // Indica que este parámetro es de salida y va a recibir luego el id del médico insertado.
                datos.agregarParametro(outputId);  // Agrega el parámetro al SqlCommand para que el SP lo incluya en la ejecución.

                datos.ejecutarAccion();

                int medicoId = (int)outputId.Value;  // Recuperación del ID del médico generado después del insert.

                datos.limpiarParametros();

                foreach (Especialidad esp in medico.Especialidades)
                {
                    datos.setearConsulta("INSERT INTO Medico_Especialidad (medico_id, especialidad_id) VALUES (@medicoId, @especialidadId)");
                    datos.setearParametro("@medicoId", medicoId);
                    datos.setearParametro("@especialidadId", esp.Id);

                    datos.ejecutarAccion();
                    datos.limpiarParametros();
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
    }
}
