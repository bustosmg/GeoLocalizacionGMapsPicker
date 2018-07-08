using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using cEntidades;
using System.Web;

namespace cConexion
{
    public class cCnx
    {
        HttpContext oContexto = HttpContext.Current;
        public string msgError { get; set; }

        public SqlConnection oCn;
        string sData = "Data Source=MARCELO\\SQLEXPRESS2;Initial Catalog=GeoLocalizacion;Integrated Security=True";
        //Data Source=MARCELO\SQLEXPRESS2;Initial Catalog=GeoLocalizacion;Integrated Security=True
        public cCnx()
        {
            oCn = new SqlConnection(sData);
        }

        public void AbrirCn()
        {
            try
            {
                oCn.Open();
            }
            catch(Exception ex)
            {
                msgError = ex.Message;
            }
            
        }
        public void CerrarCn()
        {
            oCn.Close();
        }
        public DataTable listaEntidades()
        {
            string cadena = "SELECT * FROM Entidades e, Domiclios d, TiposEntidad tpo " +
                "WHERE e.idTiposEntidad = tpo.idTiposEntidad " +
                "AND e.TiposEntidad_idTiposEntidad = d.Entidades_idEntidades ";

            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = CommandType.Text;
            oCmd.CommandText = cadena;
            oCmd.Connection = oCn;

            int estado = oCmd.ExecuteNonQuery();

            DataTable dt = new DataTable();

            if (msgEstado(estado))
            {
                SqlDataAdapter da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }

            return dt;
        }

        public string listaGetTpoEntidades(string param)
        {


            string cadena2 = "SELECT idTiposEntidad FROM TiposEntidad WHERE nombre LIKE '%" + param + "%'";
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = CommandType.Text;
            oCmd.CommandText = cadena2;
            oCmd.Connection = oCn;

            var estado = oCmd.ExecuteScalar();

            return estado.ToString();

        }
        public DataTable listaTpoEntidades()
        {
            string cadena2 = "SELECT * FROM TiposEntidad";
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = CommandType.Text;
            oCmd.CommandText = cadena2;
            oCmd.Connection = oCn;

            int estado = oCmd.ExecuteNonQuery();

            DataTable dt = new DataTable();

            if (msgEstado(estado))
            {
                SqlDataAdapter da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }

            return dt;

        }

        private string BuscarIdDomicilio(string param)
        {

            string cadena2 = "SELECT idDomicilios FROM Domiclios WHERE direccion LIKE '%" + param + "%'";
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = CommandType.Text;
            oCmd.CommandText = cadena2;
            oCmd.Connection = oCn;

            var estado = oCmd.ExecuteScalar();

            if (string.IsNullOrEmpty( estado.ToString()))
            {
                estado = "N/A";
            }
            return estado.ToString();

        }
        public bool ActualizarCoordenadas(Domicilios oDom)
        {
            string direccion = BuscarIdDomicilio(oDom.direccion);

            if (direccion == "N/A")
            {
                return false;
            } else
            {
                string cadena2 = "UPDATE SET latitud=" + oDom.latitud + ", longitud=" + oDom.longitud +
                    "WHERE idDomicilio =" + direccion;
                SqlCommand oCmd = new SqlCommand();
                oCmd.CommandType = CommandType.Text;
                oCmd.CommandText = cadena2;
                oCmd.Connection = oCn;

                int estado = oCmd.ExecuteNonQuery();
                return msgEstado(estado);
            }

        }
        public bool altaEntidad(Entidades Entidad, TiposDeEntidad TpoEntidad, Domicilios direccion )
        {
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = CommandType.Text;

            int estado;

            string sEntidad = "INSERT INTO Entidades " +
            " VALUES(" +
            direccion.Entidades_idEntidades + ", " +
            "'" + Entidad.RazonSocial + "', " +
            + Entidad.idRazonSocial + ", " +
            "'" + Entidad.cuit + "')" ;

            oCmd.CommandText = sEntidad;
            oCmd.Connection = oCn;
            estado = oCmd.ExecuteNonQuery();

            string sDomicilio = "INSERT INTO Domiclios " +
            " VALUES(" +
            direccion.Entidades_idEntidades + ", " +
            direccion.Entidades_idEntidades + ", " +
            "'" + direccion.direccion + "', " +
            + direccion.altura + ", " +
             +direccion.latitud + ", " +
             +direccion.longitud + ", " +
            "'" + direccion.partido + "'," +
            "'" + direccion.provincia + "', " +
            "'" + direccion.pais + "')";

            oCmd.CommandText = sEntidad;
            oCmd.Connection = oCn;
            estado = oCmd.ExecuteNonQuery();

            string sTpoEntidad = "INSERT INTO TipoEntidad " +
            " VALUES(" +
            "'" + TpoEntidad.nomnbre + "', " +
            "'" + TpoEntidad.descripcion + "')";

            oCmd.CommandText = sEntidad;
            oCmd.Connection = oCn;
            estado = oCmd.ExecuteNonQuery();

            return msgEstado(estado);      

        }

        private bool msgEstado(int estado)
        {

            if (estado != 0)
            {
                oContexto.Response.Write("<script languaje = javascript>");
                oContexto.Response.Write("alert('La operacion se realizo con exito!')");
                oContexto.Response.Write("</script>");
                return true;
            }
            else
            {
                oContexto.Response.Write("<script languaje = javascript>");
                oContexto.Response.Write("alert('La operacion NO se realizo con exito!')");
                oContexto.Response.Write("</script>");
                return false;
            }
        }
    }
}
