using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Menuwrap.Models
{
    public class RegisterViewModel
    {
        public string email { get; set; }
        public string first_name { get; set; }
        public string gender { get; set; }
        public string id { get; set; }
        public string last_name { get; set; }
        public string link { get; set; }
        public string locale { get; set; }
        public string middle_name { get; set; }
        public string name { get; set; }
        public string timezone { get; set; }
        public string updated_time { get; set; }
        public string verified { get; set; }
        public int userID { get; set; }
        public string contact { get; set; }
        public string ExpiresIn { get; set; }
        public string AccessToken { get; set; }
    }
}
