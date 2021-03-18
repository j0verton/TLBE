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
    public class CollectionsController : ControllerBase
    {
        private readonly ICollectionRepository _collectionRepository;
        private readonly IUserProfileRepository _userRepository;

        public CollectionsController(ICollectionRepository collectionRepository, IUserProfileRepository userProfileRepository)
        {
            _collectionRepository = collectionRepository;
            _userRepository = userProfileRepository;
        }

        [HttpGet]
        public IActionResult GetUserCollections()
        {
            UserProfile user = GetCurrentUser();
            var collections = _collectionRepository.GetCollectionsByUserId(user.Id);
            var sortedCollection = collections.Select(coll => coll.TuneCollections.OrderBy(tc => tc.Tune.Name));
            //collections themselves arent sorted
            return Ok(sortedCollection);
        }

        private UserProfile GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }

    }
}
