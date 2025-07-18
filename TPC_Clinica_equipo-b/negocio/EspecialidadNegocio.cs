using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace negocio
{
    public class EspecialidadNegocio
    {
        public List<(int MedicoId, Especialidad Especialidad)> listarEspecialidadesMedicos()
        {
            List<(int MedicoId, Especialidad Especialidad)> listaEspecialidadPorMedico = new List<(int, Especialidad)>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SP_medicoListarPorEspecialidades");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    int MedicoId = (int)datos.Lector["Medico_Id"];
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    listaEspecialidadPorMedico.Add((MedicoId, aux));
                }

                return listaEspecialidadPorMedico;
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

        public List<Especialidad> listarEspecialidades()
        {
            List<Especialidad> listaEspecialidades = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT id, descripcion, activo FROM Especialidad ORDER BY descripcion");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.Id = (int)datos.Lector["id"];
                    aux.Descripcion = (string)datos.Lector["descripcion"].ToString();
                    aux.Activo = (bool)datos.Lector["activo"];

                    listaEspecialidades.Add(aux);
                }

                return listaEspecialidades;
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

        public void agregarEspecialidad(Especialidad nuevaEspecialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Especialidad (Descripcion, Activo) VALUES (@Descripcion, @Activo)");
                datos.setearParametro("@Descripcion", nuevaEspecialidad.Descripcion);
                datos.setearParametro("@Activo", nuevaEspecialidad.Activo);
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

        public void actualizarEstadoEspecialidad(int id, bool activo = false)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Especialidad SET activo = @activo WHERE id = @id");
                datos.setearParametro("@id", id);
                datos.setearParametro("@activo", activo);
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

        public void eliminarEspecialidad(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Especialidad WHERE id = @id");
                datos.setearParametro("@id", id);
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

        // Método para verificar si una especialidad con la descripción dada ya existe
        public bool existeEspecialidad(string descripcion)
        {
            // Instancia de AccesoDatos para manejar la conexión y consultas a la base de datos
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Consulta para contar cuántas especialidades tienen la misma descripción
                datos.setearConsulta("SELECT COUNT(*) FROM Especialidad WHERE Descripcion = @Descripcion");
                datos.setearParametro("@Descripcion", descripcion);
                datos.ejecutarLectura();

                // Si se obtiene un resultado, se verifica si la cantidad es mayor a 0
                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    return cantidad > 0;
                }
                return false;
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


        // Método para modificar una especialidad existente
        public void modificarEspecialidad(int id, string nuevaDescripcion)
        {
            // Instancia de AccesoDatos para manejar la conexión y consultas a la base de datos
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Consulta para actualizar la descripción de la especialidad por su ID
                datos.setearConsulta("UPDATE Especialidad SET Descripcion = @Descripcion WHERE Id = @Id");
                datos.setearParametro("@Descripcion", nuevaDescripcion);
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

        // Método para verificar si existe otra especialidad con la misma descripción, excluyendo una específica por su ID
        public bool existeOtraEspecialidad(string descripcion, int idExcluir)
        {
            // Instancia de AccesoDatos para manejar la conexión y consultas a la base de datos
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Consulta para contar cuántas especialidades tienen la misma descripción, excluyendo la que se pasa por parámetro
                datos.setearConsulta("SELECT COUNT(*) FROM Especialidad WHERE LOWER(Descripcion) = @Descripcion AND Id <> @Id");
                datos.setearParametro("@Descripcion", descripcion.ToLower());
                datos.setearParametro("@Id", idExcluir);
                datos.ejecutarLectura();

                // Si se obtiene un resultado, se verifica si la cantidad es mayor a 0
                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    return cantidad > 0;
                }

                return false;
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

        // Método para obtener una especialidad por su ID
        public Especialidad obtenerEspecialidadPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id, Descripcion, Activo FROM Especialidad WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Especialidad esp = new Especialidad
                    {
                        Id = (int)datos.Lector["Id"],
                        Descripcion = (string)datos.Lector["Descripcion"],
                        Activo = (bool)datos.Lector["Activo"]
                    };
                    return esp;
                }

                return null;
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
