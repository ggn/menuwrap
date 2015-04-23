using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Menuwrap.Models
{
    public class FilterViewModel
    {
        public SelectList Filters { get; set; }
        public SelectList Cuisines { get; set; }
    }
}