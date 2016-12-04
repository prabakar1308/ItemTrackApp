using System;
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
        private BackLogEntities db;
        public RetrieveItemsController()
        {
            db = new BackLogEntities();
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
            List<TBL_JIRA_ITEMS> items = null;
            if (releaseFilter && trackFilter)
            {
                items = db.TBL_JIRA_ITEMS.Where(a => (a.ReleaseID == releaseId) && (a.TrackID == trackId)).ToList();
            }
            else if (!releaseFilter && trackFilter) {
                items = db.TBL_JIRA_ITEMS.Where(a => a.TrackID == trackId).ToList();
            }
            else if (releaseFilter && !trackFilter)
            {
                items = db.TBL_JIRA_ITEMS.Where(a => a.ReleaseID == releaseId).ToList();
            }
            else
            {
                items = db.TBL_JIRA_ITEMS.ToList();
            }
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