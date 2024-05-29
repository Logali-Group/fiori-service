sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'fiorixmlannotations',
            componentId: 'DetailSetObjectPage',
            contextPath: '/ProductSet/toDetails'
        },
        CustomPageDefinitions
    );
});