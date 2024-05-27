const cds = require('@sap/cds');

module.exports = class Products extends cds.ApplicationService {

    init() {

        const {ProductSet} = this.entities;


        this.before('NEW', ProductSet.drafts, async req =>{
            console.log("Entro antes de crear un registro");

            console.log(req);

            req.data.supplier??= {
                                supplier: "",
                                supplierName: "",
                                webAddress: "",
                                contact: 
                                    {
                                        fullName: "",
                                        email: "",
                                        phoneNumber: "",
                                        address: ""
                                    }
                            }
        });

        return super.init();
    }

};