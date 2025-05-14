using CatalogService from './service';

annotate CatalogService.Sessions with {
    movie @title : 'Movie';
    startTime @title : 'Start Time';
    availableSeats @title : 'Available Seats';
    criticality @title : 'Status'
};

annotate CatalogService.Movies with {
    ID  @(
        UI.Hidden,
        Common: {Text : '',})
};
