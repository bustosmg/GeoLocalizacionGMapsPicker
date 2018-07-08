using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cEntidades
{
    public class Domicilios
    {

        public int Entidades_idEntidades { get; set; }
        public string direccion { get; set; }
        public int altura { get; set; }
        public decimal latitud { get; set; }
        public decimal longitud { get; set; }
        public string partido { get; set; }
        public string provincia { get; set; }
        public string pais { get; set; }
    }
}
