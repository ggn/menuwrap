//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Filter
    {
        public Filter()
        {
            this.Filter_cat_map = new HashSet<Filter_cat_map>();
        }
    
        public int Filter_Id { get; set; }
        public string Filter_name { get; set; }
        public string Filter_desc { get; set; }
    
        public virtual ICollection<Filter_cat_map> Filter_cat_map { get; set; }
    }
}