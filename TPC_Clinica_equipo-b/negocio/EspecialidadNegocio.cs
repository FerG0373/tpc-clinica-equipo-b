﻿using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
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
                datos.setearConsulta("SP_listarEspecialidadesPorMedico");
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
                datos.setearConsulta("SELECT id, descripcion FROM Especialidad");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];                   

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
    }
}
