using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface ICollectionRepository
    {
        List<Collection> GetCollectionsByUserId(int id);
        Collection saveCollection(Collection collection);
    }
}