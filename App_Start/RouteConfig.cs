using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CarDatabaseTesting
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
              name: "Models",
              url: "Model/{action}/{id}",
              defaults: new { controller = "Models", action = "Index", id = UrlParameter.Optional }
          );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Orders", action = "Index", id = UrlParameter.Optional }
            );

           

            //routes.MapMvcAttributeRoutes();
        }
    }
}
