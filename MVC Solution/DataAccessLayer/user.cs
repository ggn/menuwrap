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
    
    public partial class user
    {
        public user()
        {
            this.comments = new HashSet<comment>();
            this.Orders = new HashSet<Order>();
        }
    
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Email_Id { get; set; }
        public string Contact { get; set; }
        public string Password { get; set; }
        public int Role_Id { get; set; }
        public string addr { get; set; }
        public int Zipcode { get; set; }
        public bool Isactive { get; set; }
    
        public virtual ICollection<comment> comments { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual Role Role { get; set; }
    }
}
