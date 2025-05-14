using { sap.capire.moviestudio as db } from '../db/schema';

annotate db.Movies with @(
  UI.LineItem: [
    { Value: ID, Label: 'Movie ID' },
    { Value: title, Label: 'Title' },
    { Value: releaseDate, Label: 'Release Date' },
    { Value: genre, Label: 'Genre' },
    { Value: rating, Label: 'Rating', Criticality: ratingCriticality },
    { Value: studio.name, Label: 'Studio' }
  ],
  UI.SelectionFields: ['title', 'genre', 'releaseDate'],
  UI.Identification: [
    { Value: title },
    { Value: releaseDate },
    { Value: genre },
    { Value: rating }
  ],
  UI.HeaderInfo: {
    TypeName: 'Movie',
    TypeNamePlural: 'Movies',
    Title: { Value: title },
    Description: { Value: genre }
  }
);

annotate db.Sessions with @(
  UI.LineItem #SessionList : [
    { Value: startTime, Label: 'Start Time' },
    { Value: availableSeats, Label: 'Seats', Criticality: criticality }
  ]
);

annotate db.MovieActors with @UI.LineItem #ActorList: [
  { Value: actor.firstName, Label: 'First Name' },
  { Value: actor.lastName, Label: 'Last Name' },
  { Value: role, Label: 'Role' }
];

annotate db.Movies with @(
  UI.Facets : [
    {
      Label: 'Movie Details',
      $Type: 'UI.ReferenceFacet',
      Target: '@UI.Identification'
    },
    {
      Label: 'Studio Info',
      $Type: 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#MainInfo'
    },
    {
      Label: 'Sessions',
      $Type: 'UI.CollectionFacet',
      Facets: [
        {
          $Type: 'UI.ReferenceFacet',
          Label: 'Session List',
          Target: 'sessions/@UI.LineItem#SessionList'
        }
      ]
    },
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'Actors',
      Target: 'actors/@UI.LineItem#ActorList'
    }
  ]
);

annotate db.Movies with @UI.FieldGroup #MainInfo: {
  Label: 'Studio Details',
  Data: [
    { Value: studio.name, Label: 'Studio' },
    { Value: studio.founded, Label: 'Founded' }
  ]
};

annotate db.Studios with @(
  UI.LineItem: [
    { Value: ID, Label: 'Studio ID' },
    { Value: name, Label: 'Studio Name' },
    { Value: founded, Label: 'Founded' },
    { Value: country_code, Label: 'Country' }
  ],
  UI.Identification: [
    { Value: name },
    { Value: founded },
    { Value: country_code }
  ],
  UI.SelectionFields: ['name', 'founded'],
  UI.HeaderInfo: {
    TypeName: 'Studio',
    TypeNamePlural: 'Studios',
    Title: { Value: name },
    Description: { Value: country_code }
  }
);

annotate db.Actors with @(
  UI.LineItem: [
    { Value: ID, Label: 'Actor ID' },
    { Value: firstName, Label: 'First Name' },
    { Value: lastName, Label: 'Last Name' },
    { Value: birthDate, Label: 'Birth Date' },
    { Value: email, Label: 'Email' }
  ],
  UI.Identification: [
    { Value: firstName },
    { Value: lastName },
    { Value: birthDate },
    { Value: email }
  ],
  UI.SelectionFields: ['firstName', 'lastName'],
  UI.HeaderInfo: {
    TypeName: 'Actor',
    TypeNamePlural: 'Actors',
    Title: { Value: lastName },
    Description: { Value: email }
  }
);

annotate db.Categories with @(
  UI.LineItem: [
    { Value: code, Label: 'Code' },
    { Value: text, Label: 'Category Name' },
    { Value: description, Label: 'Description' }
  ],
  UI.Identification: [
    { Value: text },
    { Value: description }
  ],
  UI.SelectionFields: ['text'],
  UI.HeaderInfo: {
    TypeName: 'Category',
    TypeNamePlural: 'Categories',
    Title: { Value: text },
    Description: { Value: description }
  }
);