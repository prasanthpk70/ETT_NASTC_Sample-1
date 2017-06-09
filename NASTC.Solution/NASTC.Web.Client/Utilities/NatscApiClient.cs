using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http.Headers;
using System.Net.Http;

namespace NASTC.Web.Client.Utilities
{
    public class NatscApiClient : HttpClient
    {
        public NatscApiClient()
        {
            if (!string.IsNullOrWhiteSpace(Utility.GetAppSettings(Constants.NastcApi)))
            {
                this.BaseAddress = new Uri(Utility.GetAppSettings(Constants.NastcApi));
                this.Timeout = new TimeSpan(0, 20, 0);
            }
            else
            {
                this.BaseAddress = new Uri(HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority));
            }
            this.DefaultRequestHeaders.Accept.Clear();

            this.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}