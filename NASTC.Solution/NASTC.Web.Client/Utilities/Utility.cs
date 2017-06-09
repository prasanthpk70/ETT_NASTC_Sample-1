using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Net.Http.Headers;
using System.Web;

namespace NASTC.Web.Client.Utilities
{
    public class Utility
    {
        #region Get HttpRequest Header
        public static string GetHttpRequestHeader(HttpHeaders headers, string headerName)
        {
            if (!headers.Contains(headerName))
                return string.Empty;

            return headers.GetValues(headerName)
                            .SingleOrDefault();
        }
        public static string GetHttpRequestHeader(NameValueCollection headers, string headerName)
        {
            if (headers != null && string.IsNullOrEmpty(headers.Get(headerName)))
                return string.Empty;
            if (headers != null && !string.IsNullOrEmpty(headers.Get(headerName)))
                return headers.GetValues(headerName)
                                .SingleOrDefault();
            return string.Empty;
        }
        #endregion

        #region Get App Settings
        /// <summary>
        /// Get the appsetting value from the web.config
        /// </summary>
        /// <param name="appKey">appsettings key</param>
        /// <returns></returns>
        public static string GetAppSettings(string appKey)
        {
            object value = null;
            value = ConfigurationManager.AppSettings[appKey];
            if (value != null)
            {
                return value.ToString();
            }
            return string.Empty;
        }
        #endregion

        #region Convert to bool
        public static bool GetBool(object value)
        {
            bool result = false;
            if (value != null)
            {
                bool.TryParse(value.ToString(), out result);
            }
            return result;
        }
        #endregion

        #region Get Client IP Address
        public static string GetClientIPAddress()
        {
            string _ipAddress = HttpContext.Current.Request.UserHostAddress.ToString();
            //map IP client address
            bool _isLive = Convert.ToBoolean(ConfigurationManager.AppSettings[Constants.IsLive].ToString());
            //bool _isAWS_ELB = Convert.ToBoolean(ConfigurationManager.AppSettings[Constants.Is_AWS_ELB].ToString());
            if (_isLive)
            {
                _ipAddress = HttpContext.Current.Request.Headers["X-Forwarded-For"].ToString();
            }
            return _ipAddress;
        }
        #endregion
    }
}