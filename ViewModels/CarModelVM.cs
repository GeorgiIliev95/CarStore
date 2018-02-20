using CarDatabaseTesting.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarDatabaseTesting.ViewModels
{
    public class CarModelVM
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public int Horsepower { get; set; }
        public Nullable<int> MaxSpeed { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        public int ClassID { get; set; }

        public int? OrderID { get; set; }

        public IEnumerable<Accessory> Accessories { get; set; }
    }
}