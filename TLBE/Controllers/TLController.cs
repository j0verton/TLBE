using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TLBE.Models;

namespace TLBE.Repositories
{
    [Route("api/[controller]")]
    [ApiController]
    public class TLController : ControllerBase
    {
        private readonly IUserProfileRepository _userRepository;

        public TLController(IUserProfileRepository userRepository)
        {
            _userRepository = userRepository;
        }
        private UserProfile GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }
    }
}
