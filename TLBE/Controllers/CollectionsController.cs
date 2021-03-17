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
        private readonly IUserRepository _userRepository;

        public CollectionsController(ICollectionRepository collectionRepository, IUserRepository userRepository)
        {
            _collectionRepository = collectionRepository;
            _userRepository = userRepository;
        }

        [HttpGet]
        public IActionResult GetUserCollections()
        {
            User user = GetCurrentUser();
            var collections = _collectionRepository.GetCollectionsByUserId(user.Id);
            var sortedCollection = collections.Select(coll => coll.Tunes.OrderBy(t => t.Name));
            //should sort the tunes alphabetically here
            return Ok(sortedCollection);
        }

        private User GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }

    }
}
