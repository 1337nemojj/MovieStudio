using { sap.capire.moviestudio as my } from '../db/schema';

service CatalogService {

  @cds.redirection.target
  @title: 'Movies'
  @description: 'List of all movies in the catalog'
  entity Movies           as projection on my.Movies;
  

  @title: 'Studios'
  @description: 'Film production studios'
  entity Studios          as projection on my.Studios;
  annotate Studios with @odata.draft.enabled;
  
  @title: 'Actors'
  @description: 'People acting in movies'
  entity Actors           as projection on my.Actors;
  annotate Actors with @odata.draft.enabled;
  
  @title: 'Sessions'
  @description: 'Movie showtimes and seat availability'
  entity Sessions         as projection on my.Sessions;

  
  @title: 'Categories'
  @description: 'Genres or classifications for movies'
  entity Categories       as projection on my.Categories;
  annotate Categories with @odata.draft.enabled;
  
  @title: 'Movie-Actor Relations'
  @description: 'Links between movies and actors'
  entity MovieActors      as projection on my.MovieActors;
  annotate MovieActors with @odata.draft.enabled;
  
  @title: 'Movie-Category Relations'
  @description: 'Links between movies and categories'
  entity MovieCategories  as projection on my.MovieCategories;
  annotate MovieCategories with @odata.draft.enabled;
  
  @title: 'Movie Overview'
  @description: 'Simplified list of movies for display'
  entity MoviesOverview   as projection on my.MoviesOverview;
  annotate MoviesOverview with @odata.draft.enabled;
  
  @title: 'Recently Released Movies'
  @description: 'Sorted list of the latest movies'
  entity RecentMovies     as projection on my.RecentMovies;
  annotate RecentMovies with @odata.draft.enabled;
  
  @title: 'Movies by Studio'
  view MoviesByStudio (studioName: String)
    as select from my.Movies
    where studio.name = :studioName;

  @title: 'Get Movie Sessions'
  @description: 'Returns sessions for the specified movie'
  function getMovieSessions(movieID: UUID) returns array of Sessions;

  @title: 'Rate Movie'
  @description: 'Update and return new rating for a movie'
  action rateMovie(movieID: UUID, newRating: Decimal(3,1) ) returns Decimal(3,1);

  @title: 'Get Movies of a Studio'
  function getStudioMovies(studioID: UUID) returns array of Movies;

  //test
  action renameStudio(studioID: UUID, newName: String) returns Boolean;

}


//@cds.redirection.target	 какая проекция по умолчанию используется в навигации
//@title @description	локализуемые метаданные для юайки на потом