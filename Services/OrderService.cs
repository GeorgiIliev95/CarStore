using CarDatabaseTesting.Models;
using CarDatabaseTesting.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;


namespace CarDatabaseTesting.Services
{
    public class OrderService
    {
        public HashSet<CarModelVM> GetAllCarModelFromOrder(CarSystemEntities db)
        {
            HashSet<CarModelVM> carsOrdered = new HashSet<CarModelVM>();

            foreach (var order in db.Orders)
            {
                CarModelVM modelVM = GetCarModelFromOrder(db, order.ID);
                if (modelVM != null)
                {
                    carsOrdered.Add(modelVM);
                }                
            }

            return carsOrdered;
        }
        public CarModelVM GetCarModelFromOrder(CarSystemEntities db, int? orderID)
        {
            var modelQuery = from junctionTable in db.OrderDetails
                             where junctionTable.OrderID == orderID
                             join model in db.Models on junctionTable.ModelID equals model.ID
                             select new CarModelVM { Name = model.Name, OrderID = orderID, ID = model.ID };

            return modelQuery.FirstOrDefault();
        }

        public List<AccessoryVM> GetCarAccessoriesFromOrder(CarSystemEntities db, int? orderID)
        {
            var accessoryQuery = from junctionTable in db.OrderDetails
                                 where junctionTable.OrderID == orderID
                                 join accessory in db.Accessories on junctionTable.AccessoryID equals accessory.ID
                                 select new AccessoryVM { Name = accessory.Name, Description = accessory.Description, Price = accessory.Price, ID = accessory.ID };
            return accessoryQuery.ToList();
        }

        public List<ClientVM> MapClientViewModel(List<Client> clientDB)
        {
            List<ClientVM> clientVM = new List<ClientVM>();

            foreach (var client in clientDB)
            {
                clientVM.Add(new ClientVM(client));
            }

            return clientVM;
        }

        public List<CarModelCreateVM> MapCarViewModel(List<Model> carEntities)
        {
            List<CarModelCreateVM> carVM = new List<CarModelCreateVM>();

            foreach (var car in carEntities)
            {
                carVM.Add(new CarModelCreateVM(car.ID, car.Name));
            }

            return carVM;
        }

        public Order MapOrderViewModel(CarSystemEntities db, CreateOrderVM newOrderVM)//Creates Order Entity Model that is saved to the database from Order view model
        {
            int newOrderID = newOrderVM.GetHashCode();
            DateTime newOrderDate = newOrderVM.OrderDate;
            decimal newOrderPrice = CalculateOrderPrice(db, newOrderVM.SelectedModelID, newOrderVM.AccessoriesIDs);
            int newOrderClient = newOrderVM.SelectedClientID;
            ICollection<OrderDetail> orderDetails = CreateOrderDetailFromOrderVm(newOrderVM.SelectedModelID, newOrderID, newOrderVM.AccessoriesIDs);

            Order newOrderEM = new Order(newOrderID, newOrderDate, newOrderPrice, newOrderClient, db.Clients.Find(newOrderClient), orderDetails);
            return newOrderEM;
        }

        public Order MapEditedOrderViewModel(CarSystemEntities db, CreateOrderVM editedOrder)
        {
            Order order = db.Orders.Find(editedOrder.ID);
            order.OrderDate = editedOrder.OrderDate;
            order.Price = CalculateOrderPrice(db, editedOrder.SelectedModelID, editedOrder.AccessoriesIDs);
            order.ClientID = editedOrder.SelectedClientID;
            order.Client = db.Clients.Find(editedOrder.SelectedClientID);
            if (!IsDublicateInOrderDetails(db, editedOrder.SelectedModelID, editedOrder.ID, editedOrder.AccessoriesIDs))
            {
                order.OrderDetails = CreateOrderDetailFromOrderVm(editedOrder.SelectedModelID, editedOrder.ID, editedOrder.AccessoriesIDs);
                RemoveOrderDetailsFromDB(db, editedOrder.ID);
            }

            return order;
        }

        private decimal CalculateOrderPrice(CarSystemEntities db, int modelID, IEnumerable<int> accessoriesID)
        {
            decimal orderPrice = db.Models.Find(modelID).Price;
            if (accessoriesID != null && accessoriesID.Count() > 0) 
            {
                foreach (var itemID in accessoriesID)
                {
                    orderPrice += db.Accessories.Find(itemID).Price;
                }
            }

            return orderPrice;
        }

        private void RemoveOrderDetailsFromDB(CarSystemEntities db, int orderID)
        {
            List<OrderDetail> orderDetails = db.OrderDetails.Where(o => o.OrderID == orderID).ToList();
            db.OrderDetails.RemoveRange(orderDetails);
        }

        private HashSet<OrderDetail> CreateOrderDetailFromOrderVm(int modelID,int orderID,IEnumerable<int> accessoriesID)
        {
            HashSet<OrderDetail> orderDetails = new HashSet<OrderDetail>();

            if (accessoriesID != null && accessoriesID.Count() > 0)
            {
                foreach (var itemID in accessoriesID)
                {
                    orderDetails.Add(new OrderDetail(modelID, orderID, itemID));
                }
            }
            else
            {
                orderDetails.Add(new OrderDetail(modelID, orderID, 0));
            }

            return orderDetails;
        }

        private bool IsDublicateInOrderDetails(CarSystemEntities db, int modelID, int orderID, IEnumerable<int> accessoriesID)
        {
            if (accessoriesID == null)
            {
                accessoriesID = new List<int>() { 0 };
                
            }
            foreach (int accessoryID in accessoriesID)
            {
                var dublicatesQuery = from junctionTable in db.OrderDetails
                                      join accessory in db.Accessories on junctionTable.AccessoryID equals accessory.ID
                                      join model in db.Models on junctionTable.ModelID equals model.ID
                                      join order in db.Orders on junctionTable.OrderID equals order.ID
                                      where model.ID == modelID && order.ID == orderID && accessory.ID == accessoryID
                                      select new {ModelID = junctionTable.ModelID, OrderID = junctionTable.OrderID, AccessoryID = junctionTable.AccessoryID };
                if (dublicatesQuery.Any())
                {
                    //there would be dublicate record!
                    return true;
                }
            }

            return false;
        }
    }
}