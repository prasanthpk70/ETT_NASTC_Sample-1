using NASTC.BO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NASTC.Web.API.Resources
{
    public class MemberValidateRepository
    {
        #region Validate Membership Details
        public NastcMemberDetails ValidateMember(NastcMemberDetails memberDetails)
        {
            using (var entities = new ETT_NASTC_LocalEntities())
            {
                Nastc_Member_Details dbMemberDetails = entities.Nastc_Member_Details.Where(e => e.Membership_Id == memberDetails.MembershipId && !e.Is_Deleted).SingleOrDefault();
                if (dbMemberDetails != null)
                {
                    memberDetails.BusinessName = memberDetails.BusinessName.Replace(" ", string.Empty);
                    dbMemberDetails.Business_Name = dbMemberDetails.Business_Name.Replace(" ", string.Empty);
                    if (dbMemberDetails.Business_Name.Length >= 3 && memberDetails.BusinessName.Length >= 3 && dbMemberDetails.Business_Name.ToLower().Substring(0, 3).Equals(memberDetails.BusinessName.ToLower().Substring(0, 3)))
                    {
                        memberDetails.IsValidMember = true;
                    }
                }
            }
            return memberDetails;
        }
        #endregion
    }
}