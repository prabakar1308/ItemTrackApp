
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
    
public partial class TBL_QA_DETAILS
{

    public string JiraID { get; set; }

    public string QAStatus { get; set; }

    public string Validation { get; set; }

    public Nullable<System.DateTime> TestReadyDate { get; set; }

    public Nullable<System.DateTime> TestStartedDate { get; set; }

    public Nullable<System.DateTime> TestCompletedDate { get; set; }

    public string TestedBy { get; set; }

    public Nullable<int> Rounds { get; set; }

    public Nullable<int> Defects { get; set; }

    public Nullable<int> TestCasePassed { get; set; }

    public Nullable<int> TestCaseFailed { get; set; }

    public Nullable<int> ActualHours { get; set; }

    public string Comments { get; set; }



    public virtual TBL_QA_STATUS TBL_QA_STATUS { get; set; }

}

}
