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
    
    public partial class Restaurant
    {
        public Restaurant()
        {
            this.comments = new HashSet<comment>();
            this.Res_food_map = new HashSet<Res_food_map>();
        }
    
        public int Resturant_Id { get; set; }
        public string Restaurant_name { get; set; }
        public string Rest_Desc { get; set; }
        public string Landmark { get; set; }
        public int Location_Id { get; set; }
        public int Zipcode { get; set; }
        public string Rest_mailId { get; set; }
        public bool Is_active { get; set; }
    
        public virtual ICollection<comment> comments { get; set; }
        public virtual Location Location { get; set; }
        public virtual ICollection<Res_food_map> Res_food_map { get; set; }
    }
}