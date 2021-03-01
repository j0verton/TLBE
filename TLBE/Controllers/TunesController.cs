using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TunesController : ControllerBase
    {

        private readonly ITunesRepository _tunesRepo;
        public TunesController(ITunesRepository tunesRepo)
        {
            _tunesRepo = tunesRepo;
        }


        [HttpGet("{id}")]
        public IActionResult GetTunesByUserId()
        {
            var tunes = _tunesRepo.GetTunesByUserId();
            return Ok(tunes);
        }


        //get tunes by userid
        //get starred tunes by userId

        //save tune - includes add to collection or add collection

        //get last tune (not sure what i used this one for probably skip)
        //edit tune
        //star tune
        //remove star
        //add audio to tune

        //delete tune
        // delete tuneCollection

        //get tune by id with TC

        //get tune by id

    }
}
