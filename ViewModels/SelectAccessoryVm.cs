using CarDatabaseTesting.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarDatabaseTesting.ViewModels
{
    public class SelectAccessoryVM
    {
        public SelectAccessoryVM(Accessory accessory)
        {
            this.ID = accessory.ID;
            this.Name = accessory.Name;
            this.Price = accessory.Price;
        }

        public int ID { get; set; }

        public string Name { get; set; }

        public decimal Price { get; set; }

        public string NameAndPrice
        {
            get
            {
                return string.Format("{0} - {1}$", Name, Price);
            }
        }

    }
}