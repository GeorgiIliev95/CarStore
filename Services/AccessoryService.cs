using CarDatabaseTesting.Models;
using CarDatabaseTesting.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarDatabaseTesting.Services
{
    public class AccessoryService
    {
        public List<SelectAccessoryVM> MapSelectAccessoryVM(List<Accessory> dbAccessory)
        {
            List<SelectAccessoryVM> accessoryVM = new List<SelectAccessoryVM>();

            foreach (var accessory in dbAccessory)
            {
                accessoryVM.Add(new SelectAccessoryVM(accessory));
            }

            return accessoryVM;
        }
    }
}