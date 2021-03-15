using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Repositories;

namespace TLBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CollectionsController : Controller
    {

        private readonly ICollectionRepository _collectionRepository;

        public CollectionsController(ICollectionRepository collectionRepository)
        {
            _collectionRepository = collectionRepository;
        }

        [HttpGet]
        public IActionResult GetUserCollections()
        { 
        
        }

    }
}
