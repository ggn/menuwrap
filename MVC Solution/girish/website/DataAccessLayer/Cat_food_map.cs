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
    
    public partial class Cat_food_map
    {
        public int cat_food_mid { get; set; }
        public int Item_Id { get; set; }
        public int Category_Id { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual FoodItem FoodItem { get; set; }
    }
}
