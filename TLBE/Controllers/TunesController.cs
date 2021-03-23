using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TLBE.Models;
using TLBE.Repositories;

namespace TLBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TunesController : ControllerBase
    {
        private readonly ICollectionRepository _collectionRepository;
        private readonly IUserProfileRepository _userRepository;
        private readonly ITuneRepository _tuneRepo;
        public TunesController(ITuneRepository tunesRepo, ICollectionRepository collectionRepository, IUserProfileRepository userProfileRepository)
        {
            _collectionRepository = collectionRepository;
            _tuneRepo = tunesRepo;
            _userRepository = userProfileRepository;

        }


        //need a get current user method, modify get tunes
        [HttpGet("{id}")]
        public IActionResult GetTunesByUserId(int id)
        {

            var tunes = _tuneRepo.GetTunesByUserId(id);
            return Ok(tunes);
        }

        [HttpGet("starred/{id}")]
        public IActionResult GetStarredTunesByUserId(int id)
        {
            var tunes = _tuneRepo.GetStarredTunesByUserId(id);
            return Ok(tunes);
        }


        [HttpPut("star/{id}")]
        public IActionResult StarTune(int id)
        {
            _tuneRepo.StarTune(id);
            return NoContent();
        }

        [HttpPut("unstar/{id}")]
        public IActionResult UnstarTune(int id)
        {
            _tuneRepo.UnstarTune(id);
            return NoContent();
        }

        [HttpPost]
        public IActionResult AddTune(Tune tune)
        {
            //get user collections
            var user = GetCurrentUser();
            var collections = _collectionRepository.GetCollectionsByUserId(user.Id);

            //Tunings are named either "key" or "key/tuning"
            //this checks for a matching collection with either of these naming conventions
            List<Collection> currentCollection = collections.Where(c => (c.Name == tune.Tuning) || (c.Name == $"{tune.Key}/{tune.Tuning}")).ToList();
            if (currentCollection.Count() == 0)
            {
                //collection doesn't exist 
                //add Collection
                string collName = "";
                if (tune.Tuning == "Standard") {
                    collName = tune.Key;
                }
                else
                {
                    collName = $"{tune.Key}/{tune.Tuning}";
                }

                var collToAdd = new Collection()
                {
                    UserProfileId = user.Id,
                    Name = collName
                };

                Collection newColl = _collectionRepository.saveCollection(collToAdd);

                Tune newTune = _tuneRepo.AddTune(tune);
                var tc = new TuneCollection(newColl.Id, newTune.Id);
                _tuneRepo.AddTuneCollection(tc);
                return NoContent();
            }
            else
            {
                //collection exists
                Tune newTune = _tuneRepo.AddTune(tune);                
                //add TC
                var tc = new TuneCollection(currentCollection[0].Id, newTune.Id);

                _tuneRepo.AddTuneCollection(tc);

                return NoContent();

            }
        }
        [HttpPut]
        public IActionResult EditTune(Tune tune)
        {
            return NoContent();


        }



        private UserProfile GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }
    }
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
