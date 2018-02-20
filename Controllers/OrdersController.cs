using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CarDatabaseTesting.Models;
using CarDatabaseTesting.ViewModels;
using CarDatabaseTesting.Services;

namespace CarDatabaseTesting.Controllers
{
    //[RoutePrefix("orders")]
    public class OrdersController : Controller
    {
        private CarSystemEntities db = new CarSystemEntities();
        private OrderService serviceOrder = new OrderService();
        private AccessoryService accessoryService = new AccessoryService();

        
        // GET: Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Client);
            ViewBag.CarsOrdered = serviceOrder.GetAllCarModelFromOrder(db);
            return View(orders.ToList());
        }

        // GET: Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

            ViewBag.CarOrdered = serviceOrder.GetCarModelFromOrder(db, id);
            ViewBag.CarAccessories = new SelectList(serviceOrder.GetCarAccessoriesFromOrder(db, id), "ID", "Name");
            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            List<ClientVM> clientsViewModel = serviceOrder.MapClientViewModel(db.Clients.ToList());
            List<SelectAccessoryVM> accessoryVM = accessoryService.MapSelectAccessoryVM(db.Accessories.ToList());
            //ViewBag.ClientID = new SelectList(clientsViewModel, "ID", "FullNameAndPhone");
            //ViewBag.AllCarModels = new SelectList(db.Models.ToList(), "ID", "Name");
            //ViewBag.ClientID = new SelectList(db.Clients, "ID", "FirstName");
            CreateOrderVM newOrder = new CreateOrderVM(clientsViewModel, db.Models.ToList(), accessoryVM);
            return View(newOrder);
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,OrderDate,Price,SelectedClientID,SelectedModelID,AccessoriesIDs")] CreateOrderVM newOrder)
        {
            //Create New Order- mapped from order view model(use only order date and selected ids; Order ID is going to be hash code from OrderVM; Price is going to be decided from model and accessories)

            if (ModelState.IsValid)
            {
                Order order = serviceOrder.MapOrderViewModel(db, newOrder);
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.ClientID = new SelectList(db.Clients, "ID", "FirstName", order.ClientID);
            return View();
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            List<ClientVM> clientsViewModel = serviceOrder.MapClientViewModel(db.Clients.ToList());
            List<SelectAccessoryVM> accessoryVM = accessoryService.MapSelectAccessoryVM(db.Accessories.ToList());
            int modelID = serviceOrder.GetCarModelFromOrder(db, order.ID).ID;

            CreateOrderVM editOrderVM = new CreateOrderVM(order.ID, order.OrderDate, order.Price, order.ClientID, modelID, clientsViewModel, db.Models.ToList(), accessoryVM);

            //ViewBag.CarModel = serviceOrder.GetCarModelFromOrder(db, id);

           // List<ClientVM> clientsViewModel = serviceOrder.MapClientViewModel(db.Clients.ToList());
            //ViewBag.ClientID = new SelectList(clientsViewModel, "ID", "FullNameAndPhone", order.ClientID);
            return View(editOrderVM);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,OrderDate,Price,SelectedClientID,SelectedModelID,AccessoriesIDs")] CreateOrderVM editedOrder)
        {
            Order order = serviceOrder.MapEditedOrderViewModel(db, editedOrder);
            try
            {
                if (ModelState.IsValid && order.OrderDetails != null)
                {
                    //need to check if there is duplicate key in object 'dbo.OrderDetail'
                    db.Entry(order).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (System.Data.SqlClient.SqlException)
            {
                
            }
           

            ViewBag.ClientID = new SelectList(db.Clients, "ID", "FirstName", order.ClientID);
            return View(order);
        }

        // GET: Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            var ordersToDelete = db.OrderDetails.Where(od => od.OrderID == id).ToList();
            db.OrderDetails.RemoveRange(ordersToDelete);
            db.Orders.Remove(order);
           // db.OrderDetails.Remove(db.OrderDetails.Where(od => od.OrderID == id).FirstOrDefault());           
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        
    }
}
