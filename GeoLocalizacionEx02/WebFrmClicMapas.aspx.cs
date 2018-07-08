
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;

using System.Windows;

using cConexion;
using cEntidades;

namespace GeoLocalizacionEx02
{
    public partial class WebFrmClicMapas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            Latitud = Request.Cookies["coordenadas"]["Latitud"].ToString();
            longitud =  Request.Cookies["coordenadas"]["longitud"];
            domicilio = Request.Cookies["coordenadas"]["direccion"];

            // Guardar en la Base de Datos (UPDATE)
            cCnx oCn = new cCnx();
            oCn.AbrirCn();

            Domicilios oDom = new Domicilios();
            oDom.latitud = Convert.ToDecimal( Latitud);
            oDom.longitud = Convert.ToDecimal(longitud);
            oDom.direccion = domicilio;


            if (oCn.ActualizarCoordenadas(oDom))
            {
                string msg = "Datos actualizados correctamente!";
                Response.Write("<script> alert('" + msg + "')</script>");
            }
            else
            {
                string msg = "Error en actualizacion...";
                Response.Write("<script> alert('" + msg + "')</script>");
            }
        }

        public string Latitud { get; set; }
        public string longitud { get; set; }
        public string domicilio { get; set; }
    }
}