using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TLBE.Models;
using TLBE.Models.ViewModels;
using TLBE.Repositories;

namespace TLBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CollectionsController : ControllerBase
    {
        private readonly ICollectionRepository _collectionRepository;
        private readonly IUserProfileRepository _userRepository;
        private readonly ITuneRepository _tuneRepository;


        public CollectionsController(ICollectionRepository collectionRepository, IUserProfileRepository userProfileRepository, ITuneRepository tuneRepository)
        {
            _collectionRepository = collectionRepository;
            _userRepository = userProfileRepository;
            _tuneRepository = tuneRepository;
        }

        [HttpGet]
        public IActionResult GetUserCollections()
        {
            UserProfile user = GetCurrentUser();
            var collections = _collectionRepository.GetCollectionsByUserId(user.Id);
            //var sortedCollection = collections.Select(coll => coll.TuneCollections.OrderBy(tc =>tc.Tune.Name));
            //collections themselves arent sorted
            List<CollectionWithTunes> collectionsToReturn = new List<CollectionWithTunes>();
            foreach (Collection col in collections)
            {
                var newCollection = new CollectionWithTunes(col);
                foreach (TuneCollection tc in newCollection.Collection.TuneCollections)
                {
                    newCollection.Tunes.Add(_tuneRepository.GetTuneById(tc.TuneId));
                }
                collectionsToReturn.Add(newCollection);
            }
            return Ok(collectionsToReturn);
        }

        private UserProfile GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }

    }
}
