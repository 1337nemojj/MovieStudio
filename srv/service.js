const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  const { Movies, Sessions, Studios } = this.entities;

  /**
   * Устанавливаем значение рейтинга по умолчанию перед созданием фильма
   */
  this.before('CREATE', 'Movies', (req) => {
    if (!req.data.rating) {
      req.data.rating = 0.0;
    }
  });
  
  // email must be valid -> /Actors с email: "test.com" -> 400
  this.before('CREATE', 'Actors', req => {
    const email = req.data.email;
    if (email && !email.includes('@')) {
      req.error(400, 'Invalid email format. Must contain "@"');
    }
  });

  /**
   * сеансы для указанного фильма
   */
  this.on('getMovieSessions', async (req) => {
    const { movieID } = req.data;
    return await SELECT.from(Sessions).where({ movie_ID: movieID });
  });

  /**
   *  обновить рейтинг фильма и вернуть новое значение
   */
  this.on('rateMovie', async (req) => {
    const { movieID, newRating } = req.data;
    await UPDATE(Movies).set({ rating: newRating }).where({ ID: movieID });
    return newRating;
  });

  /**
   * количество связанных фильмов со студией
   */
  this.after('READ', 'Studios', async (each) => {
    const result = await SELECT.one
      .from(Movies)
      .columns('count(*) as count')
      .where({ studio_ID: each.ID });
    each.movieCount = result.count;
  });
    /**
   * фильмы студии
   */
  this.on('getStudioMovies', async (req) => {
    const { studioID } = req.data;
    return await SELECT.from(Movies).where({ studio_ID: studioID });
  });
  //test
  this.on('renameStudio', async (req) => {
    const { studioID, newName } = req.data;
    await UPDATE(Studios).set({ name: newName }).where({ ID: studioID });
    return true;
  });

  ////////////

  this.after('READ', 'Sessions', each => {
    if (each.availableSeats < 10) each.criticality = 1
    else if (each.availableSeats < 50) each.criticality = 2
    else each.criticality = 3
  })
//ratingCriticality
  this.after('READ', 'Movies', each => {
    if (each.rating >= 8.0) each.ratingCriticality = 3;
    else if (each.rating >= 5.0) each.ratingCriticality = 2;
    else each.ratingCriticality = 1;
  });

});
