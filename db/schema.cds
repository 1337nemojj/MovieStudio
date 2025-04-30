using {
  cuid,
  managed,
  Country,
  sap.common.CodeList
} from '@sap/cds/common';


namespace sap.capire.moviestudio;

type EmailAddress : String(100);

type TagList : many String; // arr type 1


entity Studios : cuid, managed {
  name     : String(100);
  founded  : Timestamp;
  country  : Country;
  movies   : Composition of many Movies on movies.studio = $self;
}

entity Movies : cuid, managed {
  title        : String(200);
  releaseDate  : Date;
  rating       : Decimal(3,1);
  genre        : String;
  tags         : TagList; // arr type 1
  audioLanguages : array of String; // arr type 2
  studio       : Association to Studios;
  sessions     : Composition of many Sessions on sessions.movie = $self;
  actors       : Association to many MovieActors on actors.movie = $self;
  categories   : Association to many MovieCategories on categories.movie = $self;
}

entity Actors : cuid, managed {
  firstName : String(50);
  lastName  : String(50);
  birthDate : Date;
  email     : EmailAddress;
  roles     : Association to many MovieActors on roles.actor = $self;
}

entity Sessions : cuid, managed {
  startTime      : Timestamp;
  availableSeats : Integer;
  movie          : Association to Movies;
}

entity Categories : CodeList, managed {
  key code : String(10);
  text     : localized String(100);
  description : String(255);
  links : Association to many MovieCategories on links.category = $self;
}

entity MovieActors {
  key movie : Association to Movies;
  key actor : Association to Actors;
  role      : String(100);
}

entity MovieCategories {
  key movie    : Association to Movies;
  key category : Association to Categories;
}

view MoviesOverview as select from Movies {
  ID,
  title,
  releaseDate,
  rating,
  genre
};

view RecentMovies as select from Movies {
  ID,
  title,
  releaseDate,
  rating,
  genre
} order by releaseDate desc;