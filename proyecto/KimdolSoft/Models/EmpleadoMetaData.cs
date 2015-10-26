using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace KimdolSoft.Models
{
    public class EmpleadoMetaData
    {
        [Remote("validacionEmail", "empleadoes")]
        public string email { get; set; }
    }
    [MetadataType(typeof(EmpleadoMetaData))]

    public partial class empleado
    {

    }
}