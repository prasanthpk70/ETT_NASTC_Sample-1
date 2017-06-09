using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace NASTC.Web.API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            config.Routes.MapHttpRoute(
                 name: "SecondApi",
                 routeTemplate: "{controller}/{action}/{id}",
                 defaults: new { id = RouteParameter.Optional }
             );

            config.Routes.MapHttpRoute(
               name: "ThirdApi",
               routeTemplate: "{controller}/{action}/{id}/{id2}",
               defaults: new { id = RouteParameter.Optional, id2 = "" }
           );
        }
    }
}
