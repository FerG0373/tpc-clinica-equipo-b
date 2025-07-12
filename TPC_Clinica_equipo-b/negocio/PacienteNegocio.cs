using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace negocio
{
    public class PacienteNegocio
    {
        public List<Paciente> listarPacientes()
        {
            List<Paciente> listaPacientes = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_listarPaciente");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];

                    //Verifica si FechaNacimiento es NULL
                    if (datos.Lector["FechaNacimiento"] != DBNull.Value)
                    {
                        aux.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    }
                    //Si lo es dispara MinValue (Valor minimo) por defecto
                    else
                    {
                        aux.FechaNacimiento = DateTime.MinValue;
                    }


                    aux.Sexo = datos.Lector["Sexo"] as string ?? "No especificado"; // Envia "No especificado" si es NULL por defecto
                    aux.Telefono = datos.Lector["Telefono"] as string ?? "Sin telefono"; // Envia "Sin telefono" si es NULL por defecto
                    aux.Email = (string)datos.Lector["Email"];
                    aux.HistorialClinico = datos.Lector["HistorialClinico"] as string ?? "Sin historial"; // Envia "Sin historial" si es NULL por defecto
                    aux.TipoCobertura = datos.Lector["TipoCobertura"] as string ?? "Sin cobertura"; // Envia "Sin cobertura" si es NULL por defecto

                    listaPacientes.Add(aux);
                }
                return listaPacientes;
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

        public void agregarPaciente(Paciente nuevoPaciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_insertarPacientes");
                datos.setearParametro("@Dni", nuevoPaciente.Dni);
                datos.setearParametro("@Nombre", nuevoPaciente.Nombre);
                datos.setearParametro("@Apellido", nuevoPaciente.Apellido);
                datos.setearParametro("@FechaNacimiento", nuevoPaciente.FechaNacimiento.HasValue ? (object)nuevoPaciente.FechaNacimiento.Value : DBNull.Value);
                datos.setearParametro("@Sexo", string.IsNullOrWhiteSpace(nuevoPaciente.Sexo) ? (object)DBNull.Value : nuevoPaciente.Sexo);
                datos.setearParametro("@Telefono", string.IsNullOrWhiteSpace(nuevoPaciente.Telefono) ? (object)DBNull.Value : nuevoPaciente.Telefono);
                datos.setearParametro("@Email", string.IsNullOrWhiteSpace(nuevoPaciente.Email) ? (object)DBNull.Value : nuevoPaciente.Email);
                datos.setearParametro("@TipoCobertura", string.IsNullOrWhiteSpace(nuevoPaciente.TipoCobertura) ? (object)DBNull.Value : nuevoPaciente.TipoCobertura);
                datos.setearParametro("@Activo", nuevoPaciente.Activo);
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

        public bool existePacientePorDni(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_verificarDniExistente");
                datos.setearParametro("@Dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int count = datos.Lector.GetInt32(0);
                    return count > 0; // Retorna true si el conteo es mayor que 0 (DNI existe)
                }
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error en existePacientePorDni: " + ex.Message);
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }



        public void modificarPaciente(Paciente paciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_modificarPaciente");
                datos.setearParametro("@Dni", paciente.Dni);
                datos.setearParametro("@Nombre", paciente.Nombre);
                datos.setearParametro("@Apellido", paciente.Apellido);
                datos.setearParametro("@FechaNacimiento", paciente.FechaNacimiento.HasValue ? (object)paciente.FechaNacimiento.Value : DBNull.Value);
                datos.setearParametro("@Sexo", string.IsNullOrWhiteSpace(paciente.Sexo) ? (object)DBNull.Value : paciente.Sexo);
                datos.setearParametro("@Telefono", string.IsNullOrWhiteSpace(paciente.Telefono) ? (object)DBNull.Value : paciente.Telefono);
                datos.setearParametro("@Email", paciente.Email);
                datos.setearParametro("@TipoCobertura", string.IsNullOrWhiteSpace(paciente.TipoCobertura) ? (object)DBNull.Value : paciente.TipoCobertura);
                datos.setearParametro("@HistorialClinico", string.IsNullOrWhiteSpace(paciente.HistorialClinico) ? (object)DBNull.Value : paciente.HistorialClinico);
                datos.setearParametro("@Activo", paciente.Activo);
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

        public Paciente buscarPorDni(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_buscarPacientePorDni");
                datos.setearParametro("@Dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    // Crear una nueva instancia de Paciente
                    Paciente paciente = new Paciente();

                    // Mapear los datos de la Persona
                    paciente.Dni = (string)datos.Lector["dni"];
                    paciente.Nombre = (string)datos.Lector["nombre"];
                    paciente.Apellido = (string)datos.Lector["apellido"];

                    // Manejo de campos anulables (FechaNacimiento, Sexo, Telefono, Email)
                    paciente.FechaNacimiento = datos.Lector["fechaNacimiento"] != DBNull.Value
                                            ? (DateTime)datos.Lector["fechaNacimiento"]
                                            : (DateTime?)null;

                    paciente.Sexo = datos.Lector["sexo"] != DBNull.Value
                                    ? (string)datos.Lector["sexo"]
                                    : null;

                    paciente.Telefono = datos.Lector["telefono"] != DBNull.Value
                                        ? (string)datos.Lector["telefono"]
                                        : null;

                    paciente.Email = datos.Lector["email"] != DBNull.Value
                                    ? (string)datos.Lector["email"]
                                    : null;

                    paciente.TipoCobertura = datos.Lector["tipoCobertura"] != DBNull.Value
                                            ? (string)datos.Lector["tipoCobertura"]
                                            : null;

                    paciente.HistorialClinico = datos.Lector["historialClinico"] != DBNull.Value
                                                ? (string)datos.Lector["historialClinico"]
                                                : null;

                    paciente.Activo = datos.Lector["activo"] != DBNull.Value
                                    ? (bool)datos.Lector["activo"]
                                    : true;

                    return paciente;
                }

                return null; // Si no se encontró ningún paciente con ese DNI, devuelve null
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error en buscarPorDni: " + ex.Message);
                throw; 
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void actualizarEstadoPaciente(int id, bool activo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Paciente SET Activo = @Activo WHERE Id = @Id");
                datos.setearParametro("@Activo", activo);
                datos.setearParametro("@Id", id);
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
