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
                    //Si lo es dispara MinValue por defecto
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
    }
}
