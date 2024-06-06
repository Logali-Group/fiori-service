sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorixmlannotations/test/integration/FirstJourney',
		'fiorixmlannotations/test/integration/pages/ProductSetList',
		'fiorixmlannotations/test/integration/pages/ProductSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductSetList, ProductSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorixmlannotations') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductSetList: ProductSetList,
					onTheProductSetObjectPage: ProductSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);