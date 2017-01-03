//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ItemTrackingAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_JIRA_ITEMS
    {
        public string JiraID { get; set; }
        public Nullable<int> ReleaseID { get; set; }
        public int TrackID { get; set; }
        public string Application { get; set; }
        public string Module { get; set; }
        public string Priority { get; set; }
        public string Title { get; set; }
        public string Status { get; set; }
        public string EstimatedBy { get; set; }
        public string PlannedBundle { get; set; }
        public string Developer { get; set; }
        public string Reviewer { get; set; }
        public string Tester { get; set; }
        public Nullable<decimal> Analysis { get; set; }
        public Nullable<decimal> Coding { get; set; }
        public Nullable<decimal> UnitTesting { get; set; }
        public Nullable<decimal> DeveloperEffort { get; set; }
        public Nullable<decimal> LeadEffort { get; set; }
        public Nullable<decimal> DevEstimatedEffort { get; set; }
        public Nullable<decimal> QAEstimatedEffort { get; set; }
        public Nullable<decimal> TotalEffort { get; set; }
    
        public virtual TBK_DEV_STATUS TBK_DEV_STATUS { get; set; }
        public virtual TBL_RELEASE TBL_RELEASE { get; set; }
        public virtual TBL_TEAM TBL_TEAM { get; set; }
        public virtual TBL_TEAM TBL_TEAM1 { get; set; }
        public virtual TBL_TEAM TBL_TEAM2 { get; set; }
        public virtual TBL_TEAM TBL_TEAM3 { get; set; }
        public virtual TBL_TRACK TBL_TRACK { get; set; }
    }
}
