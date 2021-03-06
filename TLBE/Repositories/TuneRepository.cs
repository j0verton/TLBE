﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class TuneRepository : ITuneRepository
    {

        private readonly ApplicationDbContext _context;
        public TuneRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Tune> GetTunesByUserId(int id)
        {
            return _context.Tune
               .Where(t => t.UserProfileId == id)
               .ToList();
        }

        public List<Tune> GetStarredTunesByUserId(int id)
        {
            return _context.Tune
           .Where(t => t.UserProfileId == id)
           .Where(t => t.Starred == true)
           .ToList();
        }

        public Tune GetTuneById(int id)
        {
            return _context.Tune
                    .Where(t => t.Id == id)
                    .FirstOrDefault();
        }

        public void StarTune(int id)
        {
            //var tune = new Tune() { Id = id };
            //_context.Tune.Attach(tune);
            //_context.Entry(tune).Property(x => )

            //is this right?
            var tune = _context.Tune
                .Where(t => t.Id == id).FirstOrDefault();
            tune.Starred = true;
            _context.SaveChanges();
        }

        public void UnstarTune(int id)
        {
            //is this right?
            var tune = _context.Tune
                .Where(t => t.Id == id).FirstOrDefault();
            tune.Starred = false;
            _context.SaveChanges();
        }

        public Tune AddTune(Tune tune)
        {
            _context.Add(tune);
            _context.SaveChanges();
            return tune;
        }
        //get tunes by user (id)?

        //add tune 

        //add tune collection

        public void EditTune(Tune tune)
        {
            _context.Entry(tune).State = EntityState.Modified;
            _context.SaveChanges();
        }
        public void AddTuneCollection(TuneCollection tc)
        {
            _context.Add(tc);
            _context.SaveChanges();
        }
    }
}
