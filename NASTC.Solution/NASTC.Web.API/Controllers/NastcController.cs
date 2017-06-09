using NASTC.BO.Models;
using NASTC.Web.API.Filters;
using NASTC.Web.API.Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NASTC.Web.API.Controllers
{
    [UserAuthorize]
    public class NASTCController : BaseAPIController
    {
        #region Declaration
        MemberValidateRepository memberValidateRepository = new MemberValidateRepository();
        #endregion

        #region Constructor
        public NASTCController()
        {
        }
        #endregion        

        #region Validate NASTC Member Details - Post
        /// <summary>
        /// 
        /// </summary>
        /// <param name="memberDetails"></param>
        /// <returns></returns>
        [HttpPost]
        public NastcMemberDetails ValidateMemberDetails(NastcMemberDetails memberDetails)
        {
            if (memberDetails != null && memberDetails.MembershipId > 0 && !string.IsNullOrWhiteSpace(memberDetails.BusinessName))
            {
                memberDetails = memberValidateRepository.ValidateMember(memberDetails);
            }
            return memberDetails;
        }
        #endregion
    }
}