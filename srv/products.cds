using {com.logaligroup as call} from '../db/schema';

service ProductCatalog @(path:'ProductSRV') {
    entity ProductSet        as projection on call.Products order by product;
    entity DetailSet         as projection on call.Details;
    entity ReviewSet         as projection on call.Reviews;
    entity SupplierSet       as projection on call.Suppliers;
    entity ContactSet        as projection on call.Contacts;
    entity VH_CategorySet    as projection on call.VH_Categories;
    entity VH_SubCategorySet as projection on call.VH_SubCategories;
    entity VH_StatuSet       as projection on call.VH_Status;
    entity VH_ColorSet       as projection on call.VH_Colors;
};