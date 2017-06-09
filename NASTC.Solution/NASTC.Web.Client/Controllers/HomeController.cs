using NASTC.BO.Models;
using NASTC.Web.Client.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;

namespace NASTC.Web.Client.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NASTCMemberCheck()
        {
            NastcMemberDetails memberDetails = new NastcMemberDetails();
            return View(memberDetails);
        }

        [HttpPost]
        public JsonResult NASTCMemberCheck(NastcMemberDetails memberDetails)
        {
            if (memberDetails != null && memberDetails.MembershipId > 0 && !string.IsNullOrWhiteSpace(memberDetails.BusinessName))
            {
                using (var client = new NatscApiClient())
                {
                    string addTLUri = "Nastc/ValidateMemberDetails";
                    //ApiRequestUtility.GenerateAuthHeader(client, addTLUri, "POST");
                    var _tlResponse = client.PostAsJsonAsync(addTLUri, memberDetails).Result;
                    if (_tlResponse.IsSuccessStatusCode)
                    {
                        memberDetails = _tlResponse.Content.ReadAsAsync<NastcMemberDetails>().Result;
                        if (memberDetails.IsValidMember)
                        {
                            return Json(true, JsonRequestBehavior.AllowGet);
                        }
                        else
                        {
                            return Json(false, JsonRequestBehavior.AllowGet);
                        }
                    }
                }
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }
    }
}