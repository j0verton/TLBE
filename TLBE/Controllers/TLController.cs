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
        private readonly IUserRepository _userRepository;

        public TLController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        private User GetCurrentUser()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(firebaseUserId);
        }
    }
}
