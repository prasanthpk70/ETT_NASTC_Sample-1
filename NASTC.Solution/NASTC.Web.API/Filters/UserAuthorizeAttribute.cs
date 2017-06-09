using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace NASTC.Web.API.Filters
{
    public class UserAuthorizeAttribute : ActionFilterAttribute
    {
        public bool IsBeforeLogin;

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            bool isValidRequest = false;
            AuthenticationHeaderValue authValue = actionContext.Request.Headers.Authorization;

            //Check the AuthorizeScheme from the API Controller and if it "Secure", then request to this API action should be from Secure
            //If the API request doesn't have Secure, return Error in response
            base.OnActionExecuting(actionContext);
        }

        static void AddErrorResponse(HttpActionContext actionContext)
        {
            var response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
            actionContext.Response = response;
        }
    }
}