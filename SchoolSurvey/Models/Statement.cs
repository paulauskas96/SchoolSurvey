//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolSurvey.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Statement
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Statement()
        {
            this.Answer = new HashSet<Answer>();
            this.ScholarAnswer = new HashSet<ScholarAnswer>();
        }
    
        public int Id { get; set; }
        public string Text { get; set; }
        public int CategoryId { get; set; }
        public bool IsNullable { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Answer> Answer { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ScholarAnswer> ScholarAnswer { get; set; }
    }
}
