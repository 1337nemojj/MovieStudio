using { sap.capire.moviestudio as db } from '../db/schema';

annotate db.Movies with @(
  UI: {
    SelectionFields: ['title', 'releaseDate', 'genre', 'rating'],
    LineItem: [
      { Value: title, Label: 'Title' },
      { Value: releaseDate, Label: 'Release Date' },
      { Value: genre, Label: 'Genre' },
      { Value: rating, Label: 'Rating' },
      { Value: studio.name, Label: 'Studio' }
    ],
    Identification: [
      { Value: title },
      { Value: genre },
      { Value: releaseDate }
    ],
    HeaderInfo: {
      TypeName: 'Movie',
      TypeNamePlural: 'Movies',
      Title: { Value: title },
      Description: { Value: genre }
    },
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate db.Studios with @(
  UI: {
    SelectionFields: ['name', 'founded'],
    LineItem: [
      { Value: name, Label: 'Studio Name' },
      { Value: founded, Label: 'Founded' }
    ],
    Identification: [
      { Value: name },
      { Value: founded }
    ],
    HeaderInfo: {
      TypeName: 'Studio',
      TypeNamePlural: 'Studios',
      Title: { Value: name }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);



annotate db.Actors with @(
  UI: {
    SelectionFields: ['firstName', 'lastName', 'birthDate'],
    LineItem: [
      { Value: firstName, Label: 'First Name' },
      { Value: lastName, Label: 'Last Name' },
      { Value: birthDate, Label: 'Birth Date' }
    ],
    Identification: [
      { Value: firstName },
      { Value: lastName },
      { Value: birthDate }
    ],
    HeaderInfo: {
      TypeName: 'Actor',
      TypeNamePlural: 'Actors',
      Title: { Value: lastName },
      Description: { Value: firstName }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate db.Categories with @(
  UI: {
    SelectionFields: ['name'],
    LineItem: [
      { Value: name, Label: 'Category Name' }
    ],
    Identification: [
      { Value: name }
    ],
    HeaderInfo: {
      TypeName: 'Category',
      TypeNamePlural: 'Categories',
      Title: { Value: name }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate db.Sessions with @(
  UI: {
    SelectionFields: ['startTime', 'availableSeats'],
    LineItem: [
      { Value: startTime, Label: 'Start Time' },
      { Value: availableSeats, Label: 'Available Seats' },
      { Value: criticality, Label: 'Criticality' }
    ],
    Identification: [
      { Value: startTime },
      { Value: availableSeats }
    ],
    HeaderInfo: {
      TypeName: 'Session',
      TypeNamePlural: 'Sessions',
      Title: { Value: startTime },
      Description: { Value: availableSeats }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate db.MovieActors with @(
  UI: {
    LineItem: [
      { Value: movie.title, Label: 'Movie' },
      { Value: actor.lastName, Label: 'Actor' }
    ],
    HeaderInfo: {
      TypeName: 'Movie-Actor Link',
      TypeNamePlural: 'Movie-Actor Links',
      Title: { Value: movie.title },
      Description: { Value: actor.lastName }
    }
  }
);

annotate db.RecentMovies with @(
  UI: {
    LineItem: [
      { Value: title, Label: 'Title' },
      { Value: releaseDate, Label: 'Release Date' },
      { Value: rating, Label: 'Rating' }
    ],
    HeaderInfo: {
      TypeName: 'Recent Movie',
      TypeNamePlural: 'Recent Movies',
      Title: { Value: title }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate db.MoviesOverview with @(
  UI: {
    LineItem: [
      { Value: title, Label: 'Title' },
      { Value: rating, Label: 'Rating' }
    ],
    HeaderInfo: {
      TypeName: 'Movie Overview',
      TypeNamePlural: 'Movies Overview',
      Title: { Value: title }
    }
  },
  Capabilities: {
    SearchRestrictions: {
      Searchable: true
    }
  }
);

annotate sap.capire.moviestudio.Studios with @Capabilities: {
  InsertRestrictions: { Insertable: true },
  UpdateRestrictions: { Updatable: true },
  DeleteRestrictions: { Deletable: true }
};

annotate sap.capire.moviestudio.Actors with @Capabilities: {
  InsertRestrictions: { Insertable: true },
  UpdateRestrictions: { Updatable: true },
  DeleteRestrictions: { Deletable: true }
};

annotate sap.capire.moviestudio.Categories with @Capabilities: {
  InsertRestrictions: { Insertable: true },
  UpdateRestrictions: { Updatable: true },
  DeleteRestrictions: { Deletable: true }
};

annotate sap.capire.moviestudio.MovieActors with @Capabilities: {
  InsertRestrictions: { Insertable: true },
  UpdateRestrictions: { Updatable: true },
  DeleteRestrictions: { Deletable: true }
};

annotate sap.capire.moviestudio.MovieCategories with @Capabilities: {
  InsertRestrictions: { Insertable: true },
  UpdateRestrictions: { Updatable: true },
  DeleteRestrictions: { Deletable: true }
};

annotate sap.capire.moviestudio.RecentMovies with @Capabilities: {
  InsertRestrictions: { Insertable: false },
  UpdateRestrictions: { Updatable: false },
  DeleteRestrictions: { Deletable: false }
};

annotate sap.capire.moviestudio.MoviesOverview with @Capabilities: {
  InsertRestrictions: { Insertable: false },
  UpdateRestrictions: { Updatable: false },
  DeleteRestrictions: { Deletable: false }
};



annotate sap.capire.moviestudio.Movies with @Capabilities: {
  InsertRestrictions: { Insertable: false },
  UpdateRestrictions: { Updatable: false },
  DeleteRestrictions: { Deletable: false }
};

annotate sap.capire.moviestudio.Sessions with @Capabilities: {
  InsertRestrictions: { Insertable: false },
  UpdateRestrictions: { Updatable: false },
  DeleteRestrictions: { Deletable: false }
};
