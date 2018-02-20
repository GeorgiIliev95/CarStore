using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarDatabaseTesting.ViewModels
{
    ///<summary> Used to display car model in html select list
    ///</summary>  
    public class CarModelCreateVM
    {
        public CarModelCreateVM(int id, string name)
        {
            this.ID = id;
            this.Name = name;
        }

        public int ID { get; set; }
        public string Name { get; set; }
    }
}