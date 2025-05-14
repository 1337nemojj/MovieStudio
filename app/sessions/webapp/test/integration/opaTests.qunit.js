sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/sessions/test/integration/FirstJourney',
		'ns/sessions/test/integration/pages/SessionsList',
		'ns/sessions/test/integration/pages/SessionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SessionsList, SessionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/sessions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSessionsList: SessionsList,
					onTheSessionsObjectPage: SessionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);