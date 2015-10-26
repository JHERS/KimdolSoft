using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace KimdolSoft.Models
{
    public class ClienteMetaData
    {
        [Display(Name = "* Documento: ")]
        [Required]
        [MaxLength(20)]
        public string idCliente { get; set; }

        [Display(Name = "  Tipo Documento: ")]
        [Required]
        public int tipoDocumento { get; set; }

        [Display(Name = "* Primer Nombre: ")]
        [Required]
        [MaxLength(20)]
        public string primerNombre { get; set; }

        [Display(Name = "  Segundo Nombre: ")]
        [MaxLength(20)]
        public string segundoNombre { get; set; }

        [Display(Name = "* Primer Apellido: ")]
        [Required]
        [MaxLength(20)]
        public string primerApellido { get; set; }

        [Display(Name = "  Segundo Apellido: ")]
        [MaxLength(20)]
        public string segundoApellido { get; set; }

        [Display(Name = "  Telefono: ")]
        [MaxLength(7)]
        [MinLength(7)]
        public string telefono { get; set; }

        [Display(Name = "  Celular: ")]
        [MaxLength(12)]
        [MinLength(10)]
        public string celular { get; set; }

        [Display(Name = "  Email")]
        [MaxLength(30)]
        public string email { get; set; }

        [Display(Name = "* Dirección: ")]
        [Required]
        [MaxLength(40)]
        public string direccion { get; set; }

        [Display(Name = "  Estado: ")]
        [Required]
        public string estado { get; set; }
    }

    [MetadataType(typeof(ClienteMetaData))]
    public partial class cliente
    {

    }
}