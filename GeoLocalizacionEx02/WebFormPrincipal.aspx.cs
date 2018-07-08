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
    public partial class WebFormPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cCnx oCn = new cCnx();
            oCn.AbrirCn();

            if (!string.IsNullOrEmpty( oCn.msgError) )
            {
                Console.WriteLine(oCn.msgError);
            } else
            {
                DataTable dt = new DataTable();
                //dt = oCn.listaEntidades();
                //GridViewEntidad.DataSource = dt;
            }

            if (!true)
            {
                DropDownList1.DataSource = oCn.listaTpoEntidades();
                DropDownList1.DataBind();
            }

        }

        protected void SqlEntidades_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btn_ubicacion_Click(object sender, EventArgs e)
        {
            if (Request.Browser.Cookies)
            {

                // --------------------------------------------------------------------------------
                // Hardcodeo estas variables porque google maps es pago y no toma las direcciones.
                // --------------------------------------------------------------------------------
                string sLat = "-34.550290";
                string sLong = "-58.515915";

                // VALIDAR LOS CAMPOS EN BLANCO
                if (string.IsNullOrEmpty( txt_dom.Text))
                {
                    mensaje("¡Ingrese el domicilio!");
                }
                else
                {
                    Response.Cookies["coordenadas"]["Longitud"] = sLat;
                    Response.Cookies["coordenadas"]["Latitud"] = sLong;
                    Response.Cookies["coordenadas"]["direccion"] = txt_dom.Text;
                    Response.Redirect("WebFrmClicMapas.aspx");
                }       
            }
            else
            {
                string msg = "Su navegador no adminite envio de cookies";
                Response.Write("<script> alert('" + msg + "')</script>");
            }
 
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void chk_nuevo_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_nuevo.Checked)
            {
                Panel1.Enabled = true;
            } else
            {
                Panel1.Enabled = false;
            }
        }

        protected void btn_alta_Click(object sender, EventArgs e)
        {
            cCnx oCn = new cCnx();
            oCn.AbrirCn();

            Domicilios oDom = new Domicilios();
            Entidades oE = new Entidades();
            TiposDeEntidad tpo = new TiposDeEntidad();
   
            oDom.Entidades_idEntidades = Convert.ToInt16( oCn.listaGetTpoEntidades(DropDownList1.SelectedValue.ToString()));
            oDom.direccion = txt_dom.Text;
            oDom.altura = Convert.ToInt16( txt_altura.Text);
            oDom.latitud = 0;
            oDom.longitud = 0;
            oDom.partido = txt_partido.Text;
            oDom.provincia = txt_provicnia.Text;
            oDom.pais = txt_pais.Text;

            Random rd = new Random();
           
            oE.cuit = "20215700469";
            oE.RazonSocial = "Juan Carlos" + rd.Next(1,99);
            oE.idEntidades = oDom.Entidades_idEntidades;

            tpo.nomnbre = "Rubro " + rd.Next(1,99);
            tpo.descripcion = tpo.nomnbre + " - " + rd.Next(1, 99);


            if (oCn.altaEntidad(oE, tpo, oDom))
            {
                mensaje("Alta Realizada con exito!");
            }
            else
            {
                mensaje("¡Error en ingreso!");
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {

        }
        private void mensaje(string msg)
        {
            Response.Write("<script> alert('" + msg + "')</script>");
        }
    }
}