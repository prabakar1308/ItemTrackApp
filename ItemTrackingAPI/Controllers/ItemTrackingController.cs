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
    public class ItemTrackingController : ApiController
    {
        private BackLogEntities db = new BackLogEntities();

        // GET: api/ItemTracking
        public IQueryable<TBL_JIRA_ITEMS> GetTBL_JIRA_ITEMS()
        {
            return db.TBL_JIRA_ITEMS;
        }

        // GET: api/ItemTracking/5
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

        // PUT: api/ItemTracking/5
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

        // POST: api/ItemTracking
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

        // DELETE: api/ItemTracking/5
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