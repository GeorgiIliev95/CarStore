using CarDatabaseTesting.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace CarDatabaseTesting.ViewModels
{
    public class CreateOrderVM
    {
        public CreateOrderVM()
        {
            
        }

        public CreateOrderVM(int id, DateTime orderDate, decimal price, int clientID, int modelID, List<ClientVM> clientsViewModel, List<Model> dbCarModels, List<SelectAccessoryVM> accessoryVM)
        {
            this.ID = id;
            this.OrderDate = orderDate;
            this.Price = price;
            this.SelectedClientID = clientID;
            this.SelectedModelID = modelID;
            this.Clients = new SelectList(clientsViewModel, "ID", "FullNameAndPhone");
            this.AllCarModels = new SelectList(dbCarModels, "ID", "Name");
            this.Accessories = new MultiSelectList(accessoryVM, "ID", "NameAndPrice");
        }

        public CreateOrderVM(List<ClientVM> clientsViewModel, List<Model> dbCarModels, List<SelectAccessoryVM> accessoryVM)
        {        
            this.Clients = new SelectList(clientsViewModel, "ID", "FullNameAndPhone");
            this.AllCarModels = new SelectList(dbCarModels, "ID", "Name");
            this.Accessories = new MultiSelectList(accessoryVM, "ID", "NameAndPrice");
        }

        public int ID { get; set; }

        [Display(Name = "Order Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime OrderDate { get; set; }

        [DataType(DataType.Currency)]
        public decimal Price { get; set; }

        [Required()]
        public int SelectedClientID { get; set; }

        public SelectList Clients { get; set; }

        [Required()]
        public int SelectedModelID { get; set; }
        public SelectList AllCarModels { get; set; }
        public MultiSelectList Accessories { get; set; }

        public IEnumerable<int> AccessoriesIDs { get; set; }
        
        public int GetSelectedClientID()
        {
            ClientVM selectedClient = Clients.SelectedValue as ClientVM;
            return selectedClient.ID;
        }

        public int GetSelectedModelID()
        {
            Model selectedModel = AllCarModels.SelectedValue as Model;
            return selectedModel.ID;
        }
    }
}