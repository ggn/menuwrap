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
    
    public partial class City
    {
        public City()
        {
            this.Locations = new HashSet<Location>();
        }
    
        public int City_Id { get; set; }
        public string City_name { get; set; }
        public int State_Id { get; set; }
    
        public virtual State State { get; set; }
        public virtual ICollection<Location> Locations { get; set; }
    }
}
