//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KimdolSoft.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class producto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public producto()
        {
            this.detallecompra = new HashSet<detallecompra>();
            this.detalledevolucion = new HashSet<detalledevolucion>();
            this.detallemovimiento = new HashSet<detallemovimiento>();
            this.existencia = new HashSet<existencia>();
        }
    
        public int idProducto { get; set; }
        public string nombre { get; set; }
        public int valor { get; set; }
        public string descripcion { get; set; }
        public short idPresentacion { get; set; }
        public short idTipoProducto { get; set; }
        public short idMarca { get; set; }
        public short idUnidad { get; set; }
        public string estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detallecompra> detallecompra { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detalledevolucion> detalledevolucion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detallemovimiento> detallemovimiento { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<existencia> existencia { get; set; }
        public virtual marca marca { get; set; }
        public virtual presentacion presentacion { get; set; }
        public virtual tipoproducto tipoproducto { get; set; }
        public virtual unidad unidad { get; set; }
    }
}
