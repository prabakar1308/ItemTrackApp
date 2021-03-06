﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ItemTrackingAPI.Models;

namespace ItemTrackingAPI.Controllers
{
    [RoutePrefix("api/RetrieveData")]
    public class RetrieveItemsController : ApiController
    {
        private BacklogEntities db;
        public RetrieveItemsController()
        {
            db = new BacklogEntities();
            db.Configuration.ProxyCreationEnabled = false;
        }


        // GET: api/RetrieveItems
        //[HttpGet]
        //[Route("getJiraItems")]
        //public IQueryable<TBL_JIRA_ITEMS> GetTBL_JIRA_ITEMS()
        //{
        //    return db.TBL_JIRA_ITEMS;
        //}

        // GET: api/RetrieveItems
        [HttpGet]
        [Route("getJiraItems/{releaseId}/{trackId}/{releaseFilter}/{trackFilter}")]
        [ResponseType(typeof(List<TBL_JIRA_ITEMS>))]
        public IHttpActionResult GetTBL_JIRA_ITEMS(int releaseId,int trackId,bool releaseFilter, bool trackFilter)
        {

            if (releaseFilter && trackFilter)
            {
              var items = (from c in db.TBL_JIRA_ITEMS
                             where c.ReleaseID == releaseId && c.TrackID == trackId
                           select new {
                               JiraID = c.JiraID,
                               ReleaseID = c.ReleaseID,
                               TrackID = c.TrackID,
                               Application = c.Application,
                               Module = c.Module,
                               Priority = c.Priority,
                               Title = c.Title,
                               Status = c.TBK_DEV_STATUS,
                               JiraStatus = c.JiraStatus,
                               EstimatedBy = c.TBL_TEAM,
                               PlannedBundle = c.PlannedBundle,
                               Developer = c.TBL_TEAM1,
                               Reviewer = c.TBL_TEAM2,
                               Tester = c.TBL_TEAM3,
                               Analysis = c.Analysis,
                               Coding = c.Coding,
                               UnitTesting = c.UnitTesting,
                               DeveloperEffort = c.DeveloperEffort,
                               LeadEffort = c.LeadEffort,
                               DevEstimatedEffort = c.DevEstimatedEffort,
                               QAEstimatedEffort = c.QAEstimatedEffort,
                               TotalEffort = c.TotalEffort
                           }).ToList();

                return Ok(items);
            }
            else if (!releaseFilter && trackFilter) {
                var items = (from c in db.TBL_JIRA_ITEMS
                             where c.TrackID == trackId
                             select new
                             {
                                 JiraID = c.JiraID,
                                 ReleaseID = c.ReleaseID,
                                 TrackID = c.TrackID,
                                 Application = c.Application,
                                 Module = c.Module,
                                 Priority = c.Priority,
                                 Title = c.Title,
                                 Status = c.TBK_DEV_STATUS,
                                 JiraStatus = c.JiraStatus,
                                 EstimatedBy = c.TBL_TEAM,
                                 PlannedBundle = c.PlannedBundle,
                                 Developer = c.TBL_TEAM1,
                                 Reviewer = c.TBL_TEAM2,
                                 Tester = c.TBL_TEAM3,
                                 Analysis = c.Analysis,
                                 Coding = c.Coding,
                                 UnitTesting = c.UnitTesting,
                                 DeveloperEffort = c.DeveloperEffort,
                                 LeadEffort = c.LeadEffort,
                                 DevEstimatedEffort = c.DevEstimatedEffort,
                                 QAEstimatedEffort = c.QAEstimatedEffort,
                                 TotalEffort = c.TotalEffort
                             }).ToList();
                return Ok(items);
            }
            else if (releaseFilter && !trackFilter)
            {
                var items = (from c in db.TBL_JIRA_ITEMS
                             where c.ReleaseID == releaseId
                             select new
                             {
                                 JiraID = c.JiraID,
                                 ReleaseID = c.ReleaseID,
                                 TrackID = c.TrackID,
                                 Application = c.Application,
                                 Module = c.Module,
                                 Priority = c.Priority,
                                 Title = c.Title,
                                 Status = c.TBK_DEV_STATUS,
                                 JiraStatus = c.JiraStatus,
                                 EstimatedBy = c.TBL_TEAM,
                                 PlannedBundle = c.PlannedBundle,
                                 Developer = c.TBL_TEAM1,
                                 Reviewer = c.TBL_TEAM2,
                                 Tester = c.TBL_TEAM3,
                                 Analysis = c.Analysis,
                                 Coding = c.Coding,
                                 UnitTesting = c.UnitTesting,
                                 DeveloperEffort = c.DeveloperEffort,
                                 LeadEffort = c.LeadEffort,
                                 DevEstimatedEffort = c.DevEstimatedEffort,
                                 QAEstimatedEffort = c.QAEstimatedEffort,
                                 TotalEffort = c.TotalEffort
                             }).ToList();
                return Ok(items);
            }
            else
            {
                var items = (from c in db.TBL_JIRA_ITEMS
                             select new
                             {
                                 JiraID = c.JiraID,
                                 ReleaseID = c.ReleaseID,
                                 TrackID = c.TrackID,
                                 Application = c.Application,
                                 Module = c.Module,
                                 Priority = c.Priority,
                                 Title = c.Title,
                                 Status = c.TBK_DEV_STATUS,
                                 JiraStatus = c.JiraStatus,
                                 EstimatedBy = c.TBL_TEAM,
                                 PlannedBundle = c.PlannedBundle,
                                 Developer = c.TBL_TEAM1,
                                 Reviewer = c.TBL_TEAM2,
                                 Tester = c.TBL_TEAM3,
                                 Analysis = c.Analysis,
                                 Coding = c.Coding,
                                 UnitTesting = c.UnitTesting,
                                 DeveloperEffort = c.DeveloperEffort,
                                 LeadEffort = c.LeadEffort,
                                 DevEstimatedEffort = c.DevEstimatedEffort,
                                 QAEstimatedEffort = c.QAEstimatedEffort,
                                 TotalEffort = c.TotalEffort
                             }).ToList();
                return Ok(items);
            }

        }

        [HttpGet]
        [Route("getQADetails/{jiraId}")]
        [ResponseType(typeof(List<TBL_JIRA_ITEMS>))]
        public IHttpActionResult GetQADetails(string jiraId)
        {
           // List<TBL_JIRA_ITEMS> items = null;

            var items = (from c in db.TBL_QA_DETAILS
                         join e in db.TBK_DEV_STATUS
                             on c.QAStatus equals e.StatusCode
                         where c.JiraID == jiraId
                         select new
                         {
                             JiraId = c.JiraID,
                             QAStatus = e.Status,
                             Validation = e.Status,
                             TestReadyDate = c.TestReadyDate,
                             TestStartedDate = c.TestStartedDate,
                             TestCompletedDate = c.TestCompletedDate,
                             TestedBy = c.TestedBy,
                             Rounds = c.Rounds,
                             Defects = c.Defects,
                             TestCasePassed = c.TestCasePassed,
                             TestCaseFailed = c.TestCaseFailed,
                             ActualHours = c.ActualHours,
                             Comments = c.Comments
                         }).ToList();

            if (items == null)
            {
                return NotFound();
            }

            return Ok(items);
        }

        [HttpGet]
        [Route("getTeamDetails")]
        [ResponseType(typeof(List<TBL_TEAM>))]
        public IHttpActionResult GetTeamDetails()
        {
            // List<TBL_JIRA_ITEMS> items = null;

            var items = (from c in db.TBL_TEAM
                         join e in db.TBL_TRACK
                             on c.TrackID equals e.TrackID
                         select new
                         {
                             EmployeeID = c.EmployeeID,
                             EmployeeName = c.EmployeeName,
                             Track = e.TrackName,
                             IsAdmin = c.IsAdmin
                         }).ToList();

            if (items == null)
            {
                return NotFound();
            }

            return Ok(items);
        }

        [HttpGet]
        [Route("getReleases")]
        public IQueryable<TBL_RELEASE> GetReleases()
        {
            return db.TBL_RELEASE;
        }

        [HttpGet]
        [Route("getTracks")]
        public IQueryable<TBL_TRACK> GetTracks()
        {
            return db.TBL_TRACK;
        }

        // GET: api/RetrieveItems/5
        [ResponseType(typeof(TBL_JIRA_ITEMS))]
        public IHttpActionResult GetTBL_JIRA_ITEMS(string id)
        {
            TBL_JIRA_ITEMS tBL_JIRA_ITEMS = db.TBL_JIRA_ITEMS.Find(id);
            if (tBL_JIRA_ITEMS == null)
            {
                return NotFound();
            }

            return Ok(tBL_JIRA_ITEMS);
        }

        // PUT: api/RetrieveItems/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTBL_JIRA_ITEMS(string id, TBL_JIRA_ITEMS tBL_JIRA_ITEMS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tBL_JIRA_ITEMS.JiraID)
            {
                return BadRequest();
            }

            db.Entry(tBL_JIRA_ITEMS).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TBL_JIRA_ITEMSExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/RetrieveItems
        [ResponseType(typeof(TBL_JIRA_ITEMS))]
        public IHttpActionResult PostTBL_JIRA_ITEMS(TBL_JIRA_ITEMS tBL_JIRA_ITEMS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TBL_JIRA_ITEMS.Add(tBL_JIRA_ITEMS);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TBL_JIRA_ITEMSExists(tBL_JIRA_ITEMS.JiraID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tBL_JIRA_ITEMS.JiraID }, tBL_JIRA_ITEMS);
        }

        // DELETE: api/RetrieveItems/5
        [ResponseType(typeof(TBL_JIRA_ITEMS))]
        public IHttpActionResult DeleteTBL_JIRA_ITEMS(string id)
        {
            TBL_JIRA_ITEMS tBL_JIRA_ITEMS = db.TBL_JIRA_ITEMS.Find(id);
            if (tBL_JIRA_ITEMS == null)
            {
                return NotFound();
            }

            db.TBL_JIRA_ITEMS.Remove(tBL_JIRA_ITEMS);
            db.SaveChanges();

            return Ok(tBL_JIRA_ITEMS);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TBL_JIRA_ITEMSExists(string id)
        {
            return db.TBL_JIRA_ITEMS.Count(e => e.JiraID == id) > 0;
        }
    }
}