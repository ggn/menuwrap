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
    
    public partial class comment
    {
        public int Comment_Id { get; set; }
        public int UserId { get; set; }
        public string Comment1 { get; set; }
        public Nullable<double> Rating { get; set; }
        public Nullable<int> Item_Id { get; set; }
        public Nullable<int> Resturant_Id { get; set; }
        public Nullable<int> Res_food_mId { get; set; }
        public bool Isactive { get; set; }
    
        public virtual FoodItem FoodItem { get; set; }
        public virtual Res_food_map Res_food_map { get; set; }
        public virtual Restaurant Restaurant { get; set; }
        public virtual user user { get; set; }
    }
}
