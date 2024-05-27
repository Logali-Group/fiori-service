namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


entity Products : cuid, managed {
    image         : LargeBinary             @UI.IsImage  @Core.MediaType: 'image/jpg';
    product       : String(8);
    productName   : String;
    description   : String;
    availability  : Int16;
    averageRating : Decimal(4, 2);
    price         : Decimal(10, 2)           @Measures.Unit: currency;
    currency      : String(3) default 'USD' @Common.IsUnit;
    category      : Association to VH_Categories;
    subCategory   : Association to VH_SubCategories;
    supplier      : Composition of Suppliers
                        on supplier.product = $self;
    statu         : Association to VH_Status;
    toDetails     : Composition of many Details
                        on toDetails.product = $self;
    toReviews     : Composition of many Reviews
                        on toReviews.product = $self;
};

entity Details : cuid {
    image      : LargeBinary            @UI.IsImage  @Core.MediaType: 'image/jpg';
    color      : Association to VH_Colors;
    height     : Decimal(4, 2)          @Measures.Unit: unitVolume;
    width      : Decimal(4, 2)          @Measures.Unit: unitVolume;
    depth      : Decimal(4, 2)          @Measures.Unit: unitVolume;
    unitVolume : String(2) default 'CM' @Common.IsUnit;
    weight     : Decimal(4, 2)          @Measures.Unit: unitMass;
    unitMass   : String(2) default 'KG' @Common.IsUnit;
    product    : Association to Products;
};

entity Reviews : cuid {
    user       : String;
    date       : Date;
    rating     : Decimal(4, 2);
    reviewText : String;
    product    : Association to Products;
};

entity Suppliers : cuid, managed {
    supplier     : String(9) ;
    supplierName : String ;
    webAddress   : String(120) ;
    product      : Association to Products;
    contact      : Composition of Contacts
                       on contact.supplier = $self;
};

entity Contacts : cuid {
    fullName    : String ;
    email       : String ;
    phoneNumber : String ;
    address     : String ;
    supplier    : Association to Suppliers;
};

entity VH_Categories : cuid, CodeList {
    toSubCategories : Composition of many VH_SubCategories
                          on toSubCategories.category = $self;
};

entity VH_SubCategories : cuid, CodeList {
    category : Association to VH_Categories;
};

entity VH_Status : CodeList {
    key code : String enum {
            InStock         = 'In Stock';
            LowAvailability = 'Low Availability';
            NotInStock      = 'Not In Stock';
        }
};

entity VH_Colors : cuid, CodeList {

};