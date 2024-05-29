sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorixmlannotations/test/integration/FirstJourney',
		'fiorixmlannotations/test/integration/pages/ProductSetList',
		'fiorixmlannotations/test/integration/pages/ProductSetObjectPage',
		'fiorixmlannotations/test/integration/pages/DetailSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductSetList, ProductSetObjectPage, DetailSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorixmlannotations') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductSetList: ProductSetList,
					onTheProductSetObjectPage: ProductSetObjectPage,
					onTheDetailSetObjectPage: DetailSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);