--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: createcart(integer, integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createcart(IN c_userid integer, IN c_productid integer, IN c_quantity integer, IN c_createdat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cart(UserId, ProductId, Quantity, CreatedAt)
    VALUES (C_UserId, C_ProductId, C_Quantity, C_CreatedAt);
END;
$$;


ALTER PROCEDURE public.createcart(IN c_userid integer, IN c_productid integer, IN c_quantity integer, IN c_createdat timestamp without time zone) OWNER TO postgres;

--
-- Name: createcart(integer, integer, integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createcart(IN c_userid integer, IN c_productid integer, IN c_quantity integer, IN c_producttotal integer, IN c_createdat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cart(UserId, ProductId, Quantity, ProductTotal, CreatedAt)
    VALUES (C_UserId, C_ProductId, C_Quantity, C_ProductTotal, C_CreatedAt);
END;
$$;


ALTER PROCEDURE public.createcart(IN c_userid integer, IN c_productid integer, IN c_quantity integer, IN c_producttotal integer, IN c_createdat timestamp without time zone) OWNER TO postgres;

--
-- Name: createcategory(character varying, integer, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createcategory(IN c_categoryname character varying, IN c_active integer, IN c_createdat timestamp without time zone, IN c_createdby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Categories(CategoryName, Active, CreatedAt, CreatedBy)
	VALUES(C_CategoryName, C_Active, C_CreatedAt, C_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createcategory(IN c_categoryname character varying, IN c_active integer, IN c_createdat timestamp without time zone, IN c_createdby character varying) OWNER TO postgres;

--
-- Name: createpurchaseorder(integer, integer, date, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createpurchaseorder(IN c_purchaseordernumber integer, IN c_supplierid integer, IN c_purchaseorderdate date, IN c_createdat timestamp without time zone, IN c_createdby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO PurchaseOrder(PurchaseOrderNumber, SupplierId, PurchaseOrderDate, CreatedAt, CreatedBy)
	VALUES(C_PurchaseOrderNumber, C_SupplierId, C_PurchaseOrderDate, C_CreatedAt, C_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createpurchaseorder(IN c_purchaseordernumber integer, IN c_supplierid integer, IN c_purchaseorderdate date, IN c_createdat timestamp without time zone, IN c_createdby character varying) OWNER TO postgres;

--
-- Name: createpurchaseorderdetail(integer, integer, integer, character varying, integer, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createpurchaseorderdetail(IN c_purchaseorderid integer, IN c_productid integer, IN c_quantity integer, IN c_quantitytype character varying, IN c_purchaseprice integer, IN c_createdat timestamp without time zone, IN c_createdby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO PurchaseOrderDetail(PurchaseOrderId, ProductId, Quantity, QuantityType, PurchasePrice, CreatedAt, CreatedBy)
	VALUES(C_PurchaseOrderId, C_ProductId, C_Quantity, C_QuantityType, C_PurchasePrice, C_CreatedAt, C_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createpurchaseorderdetail(IN c_purchaseorderid integer, IN c_productid integer, IN c_quantity integer, IN c_quantitytype character varying, IN c_purchaseprice integer, IN c_createdat timestamp without time zone, IN c_createdby character varying) OWNER TO postgres;

--
-- Name: createrate(integer, integer, integer, integer, character varying, timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createrate(IN p_productid integer, IN p_mrp integer, IN p_discount integer, IN p_sellingprice integer, IN p_currency character varying, IN p_effectivedate timestamp without time zone, IN p_createdat timestamp without time zone, IN p_createdby timestamp without time zone, IN p_modifiedat timestamp without time zone, IN p_modifiedby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Rate
    SET EndDate = p_EffectiveDate
    WHERE ProductId = p_ProductId AND EndDate IS NULL;
	
    INSERT INTO Rate (ProductId, MRP, Discount, SellingPrice, Currency, EffectiveDate, CreatedAt, CreatedBy)
    VALUES (P_ProductId, P_MRP, P_Discount, P_SellingPrice, P_Currency, P_EffectiveDate, P_CreatedAt, CreatedBy);
END;
$$;


ALTER PROCEDURE public.createrate(IN p_productid integer, IN p_mrp integer, IN p_discount integer, IN p_sellingprice integer, IN p_currency character varying, IN p_effectivedate timestamp without time zone, IN p_createdat timestamp without time zone, IN p_createdby timestamp without time zone, IN p_modifiedat timestamp without time zone, IN p_modifiedby character varying) OWNER TO postgres;

--
-- Name: createrate(integer, integer, integer, integer, character varying, timestamp without time zone, timestamp without time zone, character varying, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createrate(IN p_productid integer, IN p_mrp integer, IN p_discount integer, IN p_sellingprice integer, IN p_currency character varying, IN p_effectivedate timestamp without time zone, IN p_createdat timestamp without time zone, IN p_createdby character varying, IN p_modifiedat timestamp without time zone, IN p_modifiedby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Rate
    SET EndDate = p_EffectiveDate
    WHERE ProductId = p_ProductId AND EndDate IS NULL;
	
    INSERT INTO Rate (ProductId, MRP, Discount, SellingPrice, Currency, EffectiveDate, CreatedAt, CreatedBy)
    VALUES (P_ProductId, P_MRP, P_Discount, P_SellingPrice, P_Currency, P_EffectiveDate, P_CreatedAt, P_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createrate(IN p_productid integer, IN p_mrp integer, IN p_discount integer, IN p_sellingprice integer, IN p_currency character varying, IN p_effectivedate timestamp without time zone, IN p_createdat timestamp without time zone, IN p_createdby character varying, IN p_modifiedat timestamp without time zone, IN p_modifiedby character varying) OWNER TO postgres;

--
-- Name: createstock(integer, integer, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createstock(IN c_productid integer, IN c_quantityinstock integer, IN c_createdat timestamp without time zone, IN c_createdby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Stock(ProductId, QuantityInStock, CreatedAt, CreatedBy)
	VALUES(C_ProductId, C_QuantityInStock, C_CreatedAt, C_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createstock(IN c_productid integer, IN c_quantityinstock integer, IN c_createdat timestamp without time zone, IN c_createdby character varying) OWNER TO postgres;

--
-- Name: createsupplier(character varying, character varying, character varying, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createsupplier(IN c_suppliername character varying, IN c_supplierphonenumber character varying, IN c_supplieraddress character varying, IN c_createdat timestamp without time zone, IN c_createdby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Supplier(SupplierName, SupplierPhoneNumber, SupplierAddress, CreatedAt, CreatedBy)
	VALUES(C_SupplierName, C_SupplierPhoneNumber, C_SupplierAddress, C_CreatedAt, C_CreatedBy);
END;
$$;


ALTER PROCEDURE public.createsupplier(IN c_suppliername character varying, IN c_supplierphonenumber character varying, IN c_supplieraddress character varying, IN c_createdat timestamp without time zone, IN c_createdby character varying) OWNER TO postgres;

--
-- Name: createusers(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.createusers(IN c_username character varying, IN c_useremail character varying, IN c_userpassword character varying, IN c_userphonenumber character varying, IN c_useraddress character varying, IN c_usercity character varying, IN c_userpincode character varying, IN c_userstate character varying, IN c_userroleid integer, IN c_createdat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Users(UserName, UserEmail, UserPassword, UserPhoneNumber, UserAddress, UserCity, UserPincode, UserState, UserRoleId, CreatedAt)
	VALUES(C_UserName, C_UserEmail, C_UserPassword, C_UserPhoneNumber, C_UserAddress, C_UserCity, C_UserPinCode, C_UserState, C_UserRoleId, C_CreatedAt);
END;
$$;


ALTER PROCEDURE public.createusers(IN c_username character varying, IN c_useremail character varying, IN c_userpassword character varying, IN c_userphonenumber character varying, IN c_useraddress character varying, IN c_usercity character varying, IN c_userpincode character varying, IN c_userstate character varying, IN c_userroleid integer, IN c_createdat timestamp without time zone) OWNER TO postgres;

--
-- Name: deletecartitem(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.deletecartitem(IN u_cartid integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Cart
    WHERE CartId = U_CartId;
END;
$$;


ALTER PROCEDURE public.deletecartitem(IN u_cartid integer) OWNER TO postgres;

--
-- Name: getallproductslist(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getallproductslist() RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
		p.CategoryId,
        P.ProductName,
        P.ImageLink,
		P.HealthInfo,
		P.NutritionalInfo,
		P.Weight,
		P.QuantityType,
		R.RateId,
		R.MRP,
		R.Discount,
        R.SellingPrice,
        S.QuantityInStock
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
    WHERE P.Active = 1;
END;
$$;


ALTER FUNCTION public.getallproductslist() OWNER TO postgres;

--
-- Name: getallproductslistadminpanel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getallproductslistadminpanel() RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer, active integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
		p.CategoryId,
        P.ProductName,
        P.ImageLink,
		P.HealthInfo,
		P.NutritionalInfo,
		P.Weight,
		P.QuantityType,
		R.RateId,
		R.MRP,
		R.Discount,
        R.SellingPrice,
        S.QuantityInStock,
		P.Active
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId;
END;
$$;


ALTER FUNCTION public.getallproductslistadminpanel() OWNER TO postgres;

--
-- Name: getallproductslistprocedure(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.getallproductslistprocedure(OUT productid integer, OUT productname character varying, OUT imagelink character varying, OUT healthinfo character varying, OUT nutritionalinfo character varying, OUT weight integer, OUT quantitytype character varying, OUT mrp integer, OUT discount integer, OUT sellingprice integer, OUT quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT
        P.ProductId,
        P.ProductName,
        P.ImageLink,
        P.HealthInfo,
        P.NutritionalInfo,
        P.Weight,
        P.QuantityType,
        R.MRP,
        R.Discount,
        R.SellingPrice,
        S.QuantityInStock
    INTO ProductId, ProductName, ImageLink, HealthInfo, NutritionalInfo, Weight, QuantityType, MRP, Discount, SellingPrice, QuantityInStock
    FROM Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
    WHERE P.Active = 1;
END;
$$;


ALTER PROCEDURE public.getallproductslistprocedure(OUT productid integer, OUT productname character varying, OUT imagelink character varying, OUT healthinfo character varying, OUT nutritionalinfo character varying, OUT weight integer, OUT quantitytype character varying, OUT mrp integer, OUT discount integer, OUT sellingprice integer, OUT quantityinstock integer) OWNER TO postgres;

--
-- Name: getallproductslists(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getallproductslists() RETURNS TABLE(productid integer, productname character varying, imagelink character varying, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
        P.ProductName,
        P.ImageLink,
        R.SellingPrice,
        S.QuantityInStock
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate
        WHERE ProductId = P.ProductId
            AND EffectiveDate <= CURRENT_DATE
            AND (EndDate IS NULL OR EndDate > CURRENT_DATE)
        ORDER BY EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
    WHERE P.Active = 1;
END;
$$;


ALTER FUNCTION public.getallproductslists() OWNER TO postgres;

--
-- Name: getbestdiscountproducts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbestdiscountproducts() RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer, active integer, bestseller integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
		p.CategoryId,
        P.ProductName,
        P.ImageLink,
		P.HealthInfo,
		P.NutritionalInfo,
		P.Weight,
		P.QuantityType,
		R.RateId,
		R.MRP,
		R.Discount,
        R.SellingPrice,
        S.QuantityInStock,
		P.Active,
		P.BestSeller
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
	WHERE P.Active = 1 
	ORDER BY R.Discount DESC
	LIMIT 10;
END;
$$;


ALTER FUNCTION public.getbestdiscountproducts() OWNER TO postgres;

--
-- Name: getbestsellerproducts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbestsellerproducts() RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer, active integer, bestseller integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
		p.CategoryId,
        P.ProductName,
        P.ImageLink,
		P.HealthInfo,
		P.NutritionalInfo,
		P.Weight,
		P.QuantityType,
		R.RateId,
		R.MRP,
		R.Discount,
        R.SellingPrice,
        S.QuantityInStock,
		P.Active,
		P.BestSeller
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
	WHERE P.Active = 1 and P.BestSeller = 1;
END;
$$;


ALTER FUNCTION public.getbestsellerproducts() OWNER TO postgres;

--
-- Name: getcart(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcart(g_userid integer) RETURNS TABLE(cartid integer, userid integer, productid integer, quantity integer, productname character varying, imagelink character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT
            c.CartId,
            c.UserId,
            c.ProductId,
            c.Quantity,
            p.ProductName,
            p.ImageLink
        FROM Cart c
        INNER JOIN Products p ON p.ProductId = c.ProductId
        WHERE c.UserId = G_UserId;
END;
$$;


ALTER FUNCTION public.getcart(g_userid integer) OWNER TO postgres;

--
-- Name: getcartlatestrate(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcartlatestrate(g_userid integer) RETURNS TABLE(cartid integer, userid integer, productid integer, quantity integer, productname character varying, imagelink character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT
            c.CartId,
            c.UserId,
            c.ProductId,
            c.Quantity,
            p.ProductName,
            p.ImageLink,
			p.Weight,
			p.QuantityType,
            r.RateId,
			r.MRP,
            r.SellingPrice,
            s.QuantityInStock
        FROM Cart c
        LEFT JOIN Products p ON p.ProductId = c.ProductId
        LEFT JOIN LATERAL (
            SELECT *
            FROM Rate
            WHERE Rate.ProductId = p.ProductId
                AND Rate.EffectiveDate <= CURRENT_TIMESTAMP
                AND (Rate.EndDate IS NULL OR Rate.EndDate > CURRENT_TIMESTAMP)
            ORDER BY EffectiveDate DESC
            LIMIT 1
        ) r ON true
        LEFT JOIN Stock s ON s.ProductId = p.ProductId
        WHERE c.UserId = G_UserId ORDER BY c.CartId;
END;
$$;


ALTER FUNCTION public.getcartlatestrate(g_userid integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(200),
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200),
    active integer,
    imagelink character varying(200)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: getcategories(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcategories() RETURNS SETOF public.categories
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Categories WHERE Active=1;
END;
$$;


ALTER FUNCTION public.getcategories() OWNER TO postgres;

--
-- Name: getcategoriesadminpanel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcategoriesadminpanel() RETURNS SETOF public.categories
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Categories;
END;
$$;


ALTER FUNCTION public.getcategoriesadminpanel() OWNER TO postgres;

--
-- Name: getcategoriesprocedure(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.getcategoriesprocedure(OUT g_categoryid integer, OUT g_categoryname text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT CategoryId, categoryName
    INTO G_CategoryId, G_CategoryName
    FROM Categories WHERE Active = 1;
END;
$$;


ALTER PROCEDURE public.getcategoriesprocedure(OUT g_categoryid integer, OUT g_categoryname text) OWNER TO postgres;

--
-- Name: deliverycharges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverycharges (
    deliverychargeid integer NOT NULL,
    pincode character varying(200),
    city character varying(200),
    deliveryamount integer,
    serviceavailability character varying(200)
);


ALTER TABLE public.deliverycharges OWNER TO postgres;

--
-- Name: getdeliverycharge(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getdeliverycharge(g_pincode character varying) RETURNS SETOF public.deliverycharges
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT * FROM DeliveryCharges
	WHERE Pincode = G_Pincode;
END;
$$;


ALTER FUNCTION public.getdeliverycharge(g_pincode character varying) OWNER TO postgres;

--
-- Name: getindividualcartlatestrate(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getindividualcartlatestrate(g_cartid integer) RETURNS TABLE(cartid integer, userid integer, productid integer, quantity integer, productname character varying, imagelink character varying, rateid integer, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT
            c.CartId,
            c.UserId,
            c.ProductId,
            c.Quantity,
            p.ProductName,
            p.ImageLink,
            r.RateId,
            r.SellingPrice,
            s.QuantityInStock
        FROM Cart c
        LEFT JOIN Products p ON p.ProductId = c.ProductId
        LEFT JOIN LATERAL (
            SELECT *
            FROM Rate
            WHERE Rate.ProductId = p.ProductId
                AND Rate.EffectiveDate <= CURRENT_TIMESTAMP
                AND (Rate.EndDate IS NULL OR Rate.EndDate > CURRENT_TIMESTAMP)
            ORDER BY EffectiveDate DESC
            LIMIT 1
        ) r ON true
        LEFT JOIN Stock s ON s.ProductId = p.ProductId
        WHERE c.CartId = G_CartId;
END;
$$;


ALTER FUNCTION public.getindividualcartlatestrate(g_cartid integer) OWNER TO postgres;

--
-- Name: getproductdetailslatestrate(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getproductdetailslatestrate(g_productid integer) RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        P.ProductId,
		p.CategoryId,
        P.ProductName,
        P.ImageLink,
		P.HealthInfo,
		P.NutritionalInfo,
		P.Weight,
		P.QuantityType,
		R.RateId,
		R.MRP,
		R.Discount,
        R.SellingPrice,
        S.QuantityInStock
    FROM
        Products P
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate R
        WHERE R.ProductId = P.ProductId
            AND R.EffectiveDate <= CURRENT_TIMESTAMP
            AND (R.EndDate IS NULL OR R.EndDate > CURRENT_TIMESTAMP)
        ORDER BY R.EffectiveDate DESC
        LIMIT 1
    ) R ON true
    INNER JOIN Stock S ON P.ProductId = S.ProductId
    WHERE P.Active = 1 and p.ProductId = G_ProductId;
END;
$$;


ALTER FUNCTION public.getproductdetailslatestrate(g_productid integer) OWNER TO postgres;

--
-- Name: purchaseorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchaseorder (
    purchaseorderid integer NOT NULL,
    purchaseordernumber integer,
    supplierid integer,
    purchaseorderdate date,
    totalpurchaseamount integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200),
    deliverynotes character varying(300)
);


ALTER TABLE public.purchaseorder OWNER TO postgres;

--
-- Name: getpurchaseorder(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getpurchaseorder() RETURNS SETOF public.purchaseorder
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT * FROM PurchaseOrder;
END;
$$;


ALTER FUNCTION public.getpurchaseorder() OWNER TO postgres;

--
-- Name: getpurchaseorderdetail(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getpurchaseorderdetail(p_purchase_order_id integer) RETURNS TABLE(po_purchase_order_id integer, po_purchase_order_number integer, po_supplier_id integer, po_purchase_order_date date, po_total_purchase_amount integer, po_created_at timestamp without time zone, po_modified_at timestamp without time zone, po_created_by character varying, po_modified_by character varying, po_delivery_notes character varying, pod_purchase_order_detail_id integer, pod_product_id integer, pod_quantity integer, pod_quantity_type character varying, pod_purchase_price integer, pod_operation_id integer, pod_created_at timestamp without time zone, pod_modified_at timestamp without time zone, pod_created_by character varying, pod_modified_by character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        po.PurchaseOrderId,
        po.PurchaseOrderNumber,
        po.SupplierId,
        po.PurchaseOrderDate,
        po.TotalPurchaseAmount,
        po.CreatedAt,
        po.ModifiedAt,
        po.CreatedBy,
        po.ModifiedBy,
        po.DeliveryNotes,
        pod.PurchaseOrderDetailId,
        pod.ProductId,
        pod.Quantity,
        pod.QuantityType,
        pod.PurchasePrice,
        pod.OperationId,
        pod.CreatedAt AS pod_CreatedAt,
        pod.ModifiedAt AS pod_ModifiedAt,
        pod.CreatedBy AS pod_CreatedBy,
        pod.ModifiedBy AS pod_ModifiedBy
    FROM
        PurchaseOrder po
    JOIN
        PurchaseOrderDetail pod ON po.PurchaseOrderId = pod.PurchaseOrderId
    WHERE
        po.PurchaseOrderId = p_purchase_order_id;
END;
$$;


ALTER FUNCTION public.getpurchaseorderdetail(p_purchase_order_id integer) OWNER TO postgres;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stockid integer NOT NULL,
    productid integer,
    quantityinstock integer,
    availabilitystatus integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200)
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: getstock(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getstock() RETURNS SETOF public.stock
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT * FROM Stock;
END;
$$;


ALTER FUNCTION public.getstock() OWNER TO postgres;

--
-- Name: getstockforindividualproduct(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getstockforindividualproduct(g_productid integer) RETURNS SETOF public.stock
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT * FROM Stock 
	WHERE ProductId = G_ProductId;
END;
$$;


ALTER FUNCTION public.getstockforindividualproduct(g_productid integer) OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    suppliername character varying(200),
    supplierphonenumber character varying(200),
    supplieraddress character varying(300),
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: getsuppliers(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getsuppliers() RETURNS SETOF public.supplier
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT * FROM Supplier;
END;
$$;


ALTER FUNCTION public.getsuppliers() OWNER TO postgres;

--
-- Name: getusers(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getusers(getuseremail character varying) RETURNS TABLE(userid integer, username character varying, useremail character varying, userpassword character varying, userphonenumber character varying, useraddress character varying, usercity character varying, userpincode character varying, userstate character varying, useralternateaddress character varying, useralternatecity character varying, useralternatepincode character varying, useralternatestate character varying, userroleid integer, userrolename character varying, createdat timestamp without time zone, modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
        SELECT 
            u.UserId,
            u.UserName,
            u.UserEmail,
            u.UserPassword,
            u.UserPhoneNumber,
            u.UserAddress,
            u.UserCity,
            u.UserPincode,
            u.UserState,
            u.UserAlternateAddress,
            u.UserAlternateCity,
            u.UserAlternatePincode,
            u.UserAlternateState,
            u.UserRoleId,
            ur.UserRoleName,
            u.CreatedAt,
            u.ModifiedAt
        FROM 
            Users u
        INNER JOIN 
            UserRole ur ON u.UserRoleId = ur.UserRoleId
        WHERE 
            u.UserEmail = GetUserEmail;
END;
$$;


ALTER FUNCTION public.getusers(getuseremail character varying) OWNER TO postgres;

--
-- Name: individualcategorylatestrate(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.individualcategorylatestrate(g_categoryid integer) RETURNS TABLE(productid integer, categoryid integer, productname character varying, imagelink character varying, healthinfo character varying, nutritionalinfo character varying, weight integer, quantitytype character varying, rateid integer, mrp integer, discount integer, sellingprice integer, quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT
            p.ProductId,
			p.CategoryId,
            p.ProductName,
			p.ImageLink,
			p.HealthInfo,
			p.NutritionalInfo,
			p.Weight,
			p.QuantityType,
            r.RateId,
			r.MRP,
			r.Discount,
            r.SellingPrice,
			s.QuantityInStock
        FROM Products p
        LEFT JOIN LATERAL (
            SELECT *
            FROM Rate
            WHERE Rate.ProductId = p.ProductId
                AND Rate.EffectiveDate <= CURRENT_TIMESTAMP
                AND (Rate.EndDate IS NULL OR Rate.EndDate > CURRENT_TIMESTAMP)
            ORDER BY EffectiveDate DESC
            LIMIT 1
        ) r ON true
		LEFT JOIN Stock s ON s.ProductId = p.ProductId
        WHERE p.CategoryId = G_CategoryId and p.Active = 1;
END;
$$;


ALTER FUNCTION public.individualcategorylatestrate(g_categoryid integer) OWNER TO postgres;

--
-- Name: individualcategorylatestrateprocedure(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.individualcategorylatestrateprocedure(IN g_categoryid integer, OUT productid integer, OUT productname character varying, OUT imagelink character varying, OUT rateid integer, OUT sellingprice integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT
        p.ProductId,
        p.ProductName,
        p.ImageLink,
        r.RateId,
        r.SellingPrice
    INTO ProductId, ProductName, ImageLink, RateId, SellingPrice
    FROM Products p
    LEFT JOIN LATERAL (
        SELECT *
        FROM Rate
        WHERE Rate.ProductId = p.ProductId
            AND Rate.EffectiveDate <= CURRENT_TIMESTAMP
            AND (Rate.EndDate IS NULL OR Rate.EndDate > CURRENT_TIMESTAMP)
        ORDER BY EffectiveDate DESC
        LIMIT 1
    ) r ON true
    WHERE p.CategoryId = G_CategoryId;
END;
$$;


ALTER PROCEDURE public.individualcategorylatestrateprocedure(IN g_categoryid integer, OUT productid integer, OUT productname character varying, OUT imagelink character varying, OUT rateid integer, OUT sellingprice integer) OWNER TO postgres;

--
-- Name: insertfailedorderanddetails(integer, date, integer, integer, jsonb); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertfailedorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_OrderId integer;
    v_OrderDetailId integer;
    v_ProductDetail jsonb;
BEGIN
    INSERT INTO Orders(UserId, OrderDate, OrderSubTotalAmount, OrderTotalAmount, CreatedAt, ModifiedAt)
    VALUES (p_UserId, p_OrderDate, p_OrderSubTotalAmount, p_OrderTotalAmount, NOW(), NOW())
    RETURNING OrderId INTO v_OrderId;

    FOR v_ProductDetail IN SELECT * FROM jsonb_array_elements(p_ProductDetails)
    LOOP
        INSERT INTO OrderDetails(OrderId, ProductId, Quantity, ProductTotal, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_OrderId, (v_ProductDetail->>'ProductId')::integer, (v_ProductDetail->>'Quantity')::integer, 
                (v_ProductDetail->>'ProductTotal')::integer, (v_ProductDetail->>'OperationId')::integer, 
                NOW(), NOW())
        RETURNING OrderDetailId INTO v_OrderDetailId;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertfailedorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb) OWNER TO postgres;

--
-- Name: insertorderanddetails(integer, date, integer, integer, jsonb); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_OrderId integer;
    v_OrderDetailId integer;
    v_ProductDetail jsonb;
	v_StockId integer;
    v_OldValue integer;
    v_NewValue integer;
BEGIN
    -- Insert into orders
    INSERT INTO Orders(UserId, OrderDate, OrderSubTotalAmount, OrderTotalAmount, CreatedAt, ModifiedAt)
    VALUES (p_UserId, p_OrderDate, p_OrderSubTotalAmount, p_OrderTotalAmount, NOW(), NOW())
    RETURNING OrderId INTO v_OrderId;
    -- Insert into OrderDetails
    FOR v_ProductDetail IN SELECT * FROM jsonb_array_elements(p_ProductDetails)
    LOOP
        INSERT INTO OrderDetails(OrderId, ProductId, Quantity, ProductTotal, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_OrderId, (v_ProductDetail->>'ProductId')::integer, (v_ProductDetail->>'Quantity')::integer, 
                (v_ProductDetail->>'ProductTotal')::integer, (v_ProductDetail->>'OperationId')::integer, 
                NOW(), NOW())
        RETURNING OrderDetailId INTO v_OrderDetailId;
		--stock update
		SELECT StockId, QuantityInStock
        INTO v_StockId, v_OldValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

		UPDATE Stock
        SET QuantityInStock = QuantityInStock - (v_ProductDetail->>'Quantity')::integer,
            ModifiedAt = NOW(),
            ModifiedBy = 'User' 
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;
		-- Get the new value of QuantityInStock
		SELECT QuantityInStock
        INTO v_NewValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;
		-- Insert into stock history
		INSERT INTO StockHistory(StockOldValue, StockNewValue, OperationId, StockId, CreatedAt, ModifiedAt)
        VALUES (v_OldValue, v_NewValue, (v_ProductDetail->>'OperationId')::integer, v_StockId, NOW(), NOW());
		--Delete from Cart
		DELETE FROM Cart
		WHERE CartId = (v_ProductDetail->>'CartId')::integer;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb) OWNER TO postgres;

--
-- Name: insertorderanddetails(integer, date, integer, integer, jsonb, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_OrderId integer;
    v_OrderDetailId integer;
    v_ProductDetail jsonb;
    v_StockId integer;
    v_OldValue integer;
    v_NewValue integer;
    v_PaymentId integer;
BEGIN
    -- Insert into orders
    INSERT INTO Orders(UserId, OrderDate, OrderSubTotalAmount, OrderTotalAmount, CreatedAt, ModifiedAt)
    VALUES (p_UserId, p_OrderDate, p_OrderSubTotalAmount, p_OrderTotalAmount, NOW(), NOW())
    RETURNING OrderId INTO v_OrderId;

    -- Insert into Payment
    INSERT INTO Payment(RazorpayPaymentId, OrderId, RazorpayOrderId, PaymentStatus, CreatedAt)
    VALUES (p_RazorpayPaymentId, v_OrderId, p_RazorpayOrderId, 1, NOW())
    RETURNING PaymentId INTO v_PaymentId;

    -- Insert into OrderDetails
    FOR v_ProductDetail IN SELECT * FROM jsonb_array_elements(p_ProductDetails)
    LOOP
        INSERT INTO OrderDetails(OrderId, ProductId, Quantity, ProductTotal, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_OrderId, (v_ProductDetail->>'ProductId')::integer, (v_ProductDetail->>'Quantity')::integer, 
                (v_ProductDetail->>'ProductTotal')::integer, (v_ProductDetail->>'OperationId')::integer, 
                NOW(), NOW())
        RETURNING OrderDetailId INTO v_OrderDetailId;

        -- Stock update
        SELECT StockId, QuantityInStock
        INTO v_StockId, v_OldValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        UPDATE Stock
        SET QuantityInStock = QuantityInStock - (v_ProductDetail->>'Quantity')::integer,
            ModifiedAt = NOW(),
            ModifiedBy = 'User' 
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        -- Get the new value of QuantityInStock
        SELECT QuantityInStock
        INTO v_NewValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        -- Insert into stock history
        INSERT INTO StockHistory(StockOldValue, StockNewValue, OperationId, StockId, CreatedAt, ModifiedAt)
        VALUES (v_OldValue, v_NewValue, (v_ProductDetail->>'OperationId')::integer, v_StockId, NOW(), NOW());

        -- Delete from Cart
        DELETE FROM Cart
        WHERE CartId = (v_ProductDetail->>'CartId')::integer;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying) OWNER TO postgres;

--
-- Name: insertorderanddetails(integer, date, integer, integer, jsonb, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying, IN p_paymentstatus character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_OrderId integer;
    v_OrderDetailId integer;
    v_ProductDetail jsonb;
    v_StockId integer;
    v_OldValue integer;
    v_NewValue integer;
    v_PaymentId integer;
BEGIN
    -- Insert into orders
    INSERT INTO Orders(UserId, OrderDate, OrderSubTotalAmount, OrderTotalAmount, CreatedAt, ModifiedAt)
    VALUES (p_UserId, p_OrderDate, p_OrderSubTotalAmount, p_OrderTotalAmount, NOW(), NOW())
    RETURNING OrderId INTO v_OrderId;

    -- Insert into Payment
    INSERT INTO Payment(RazorpayPaymentId, OrderId, RazorpayOrderId, PaymentStatus, CreatedAt)
    VALUES (p_RazorpayPaymentId, v_OrderId, p_RazorpayOrderId, p_PaymentStatus, NOW())
    RETURNING PaymentId INTO v_PaymentId;

    -- Insert into OrderDetails
    FOR v_ProductDetail IN SELECT * FROM jsonb_array_elements(p_ProductDetails)
    LOOP
        INSERT INTO OrderDetails(OrderId, ProductId, Quantity, ProductTotal, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_OrderId, (v_ProductDetail->>'ProductId')::integer, (v_ProductDetail->>'Quantity')::integer, 
                (v_ProductDetail->>'ProductTotal')::integer, (v_ProductDetail->>'OperationId')::integer, 
                NOW(), NOW())
        RETURNING OrderDetailId INTO v_OrderDetailId; 

        -- Stock update
        SELECT StockId, QuantityInStock
        INTO v_StockId, v_OldValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        UPDATE Stock
        SET QuantityInStock = QuantityInStock - (v_ProductDetail->>'Quantity')::integer,
            ModifiedAt = NOW(),
            ModifiedBy = 'User' 
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        -- Get the new value of QuantityInStock
        SELECT QuantityInStock
        INTO v_NewValue
        FROM Stock
        WHERE ProductId = (v_ProductDetail->>'ProductId')::integer;

        -- Insert into stock history
        INSERT INTO StockHistory(StockOldValue, StockNewValue, OperationId, StockId, CreatedAt, ModifiedAt)
        VALUES (v_OldValue, v_NewValue, (v_ProductDetail->>'OperationId')::integer, v_StockId, NOW(), NOW());

        -- Delete from Cart
        DELETE FROM Cart
        WHERE CartId = (v_ProductDetail->>'CartId')::integer;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertorderanddetails(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying, IN p_paymentstatus character varying) OWNER TO postgres;

--
-- Name: insertorderanddetailsafterfailedpayment(integer, date, integer, integer, jsonb, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertorderanddetailsafterfailedpayment(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying, IN p_paymentstatus character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_OrderId integer;
    v_OrderDetailId integer;
    v_ProductDetail jsonb;
	v_PaymentId integer;
	
BEGIN
    INSERT INTO Orders(UserId, OrderDate, OrderSubTotalAmount, OrderTotalAmount, CreatedAt, ModifiedAt)
    VALUES (p_UserId, p_OrderDate, p_OrderSubTotalAmount, p_OrderTotalAmount, NOW(), NOW())
    RETURNING OrderId INTO v_OrderId;
	
    INSERT INTO Payment(RazorpayPaymentId, OrderId, RazorpayOrderId, PaymentStatus, CreatedAt)
    VALUES (p_RazorpayPaymentId, v_OrderId, p_RazorpayOrderId, p_PaymentStatus, NOW())
    RETURNING PaymentId INTO v_PaymentId;

    FOR v_ProductDetail IN SELECT * FROM jsonb_array_elements(p_ProductDetails)
    LOOP
        INSERT INTO OrderDetails(OrderId, ProductId, Quantity, ProductTotal, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_OrderId, (v_ProductDetail->>'ProductId')::integer, (v_ProductDetail->>'Quantity')::integer, 
                (v_ProductDetail->>'ProductTotal')::integer, (v_ProductDetail->>'OperationId')::integer, 
                NOW(), NOW())
        RETURNING OrderDetailId INTO v_OrderDetailId;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertorderanddetailsafterfailedpayment(IN p_userid integer, IN p_orderdate date, IN p_ordersubtotalamount integer, IN p_ordertotalamount integer, IN p_productdetails jsonb, IN p_razorpaypaymentid character varying, IN p_razorpayorderid character varying, IN p_paymentstatus character varying) OWNER TO postgres;

--
-- Name: insertpurchaseorderanddetails(integer, integer, date, integer, jsonb); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertpurchaseorderanddetails(IN p_purchaseordernumber integer, IN p_supplierid integer, IN p_purchaseorderdate date, IN p_totalpurchaseamount integer, IN p_details jsonb)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_PurchaseOrderId integer;
    v_DetailRecord jsonb;
    v_ProductId integer;
    v_Quantity integer;
    v_PurchasePrice integer;
    v_OperationId integer;
    v_StockId integer;
    v_OldValue integer;
    v_NewValue integer;
BEGIN
    -- Insert into PurchaseOrder
    INSERT INTO PurchaseOrder(PurchaseOrderNumber, SupplierId, PurchaseOrderDate, TotalPurchaseAmount, CreatedAt, ModifiedAt)
    VALUES (p_PurchaseOrderNumber, p_SupplierId, p_PurchaseOrderDate, p_TotalPurchaseAmount, NOW(), NOW())
    RETURNING PurchaseOrderId INTO v_PurchaseOrderId;

    -- Loop through details and update Stock and StockHistory
    FOR v_DetailRecord IN SELECT * FROM jsonb_array_elements(p_Details)
    LOOP
        v_ProductId := (v_DetailRecord->>'ProductId')::integer;
        v_Quantity := (v_DetailRecord->>'Quantity')::integer;
        v_PurchasePrice := (v_DetailRecord->>'PurchasePrice')::integer;
        v_OperationId := (v_DetailRecord->>'OperationId')::integer;
		-- Insert into PurchaseOrderDetail
        INSERT INTO PurchaseOrderDetail(PurchaseOrderId, ProductId, Quantity, QuantityType, PurchasePrice, OperationId, CreatedAt, ModifiedAt)
        VALUES (v_PurchaseOrderId, v_ProductId, v_Quantity, '', v_PurchasePrice, v_OperationId, NOW(), NOW());        
		-- Update Stock
        SELECT StockId, QuantityInStock
        INTO v_StockId, v_OldValue
        FROM Stock
        WHERE ProductId = v_ProductId;

        UPDATE Stock
        SET QuantityInStock = QuantityInStock + v_Quantity,
            ModifiedAt = NOW(),
            ModifiedBy = 'Admin'
        WHERE ProductId = v_ProductId;

        -- Get the new value of QuantityInStock
        SELECT QuantityInStock
        INTO v_NewValue
        FROM Stock
        WHERE ProductId = v_ProductId;

        -- Insert into StockHistory
        INSERT INTO StockHistory(StockOldValue, StockNewValue, OperationId, StockId, CreatedAt, ModifiedAt)
        VALUES (v_OldValue, v_NewValue, v_OperationId, v_StockId, NOW(), NOW());
    END LOOP;
END;
$$;


ALTER PROCEDURE public.insertpurchaseorderanddetails(IN p_purchaseordernumber integer, IN p_supplierid integer, IN p_purchaseorderdate date, IN p_totalpurchaseamount integer, IN p_details jsonb) OWNER TO postgres;

--
-- Name: myorderdetails(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.myorderdetails(p_orderid integer) RETURNS TABLE(orderdetailid integer, orderid integer, productid integer, quantity integer, producttotal integer, productname character varying, imagelink character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        od.OrderDetailId,
        od.OrderId,
        od.ProductId,
        od.Quantity,
        od.ProductTotal,
        p.ProductName,
        p.ImageLink
    FROM OrderDetails od
    JOIN Products p ON od.ProductId = p.ProductId
    WHERE od.OrderId = P_OrderId;
END;
$$;


ALTER FUNCTION public.myorderdetails(p_orderid integer) OWNER TO postgres;

--
-- Name: myorders(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.myorders(p_userid integer) RETURNS TABLE(g_orderid integer, g_userid integer, g_orderdate date, g_ordersubtotalamount integer, g_ordertotalamount integer, g_paymentstatus character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        O.OrderId AS G_OrderId,
        O.UserId AS G_UserId,
        O.OrderDate AS G_OrderDate,
        O.OrderSubTotalAmount AS G_OrderSubTotalAmount,
        O.OrderTotalAmount AS G_OrderTotalAmount,
		P.PaymentStatus AS G_PaymentStatus
    FROM
        Orders O
    INNER JOIN
        Payment P ON O.OrderId = P.OrderId
    WHERE
        O.UserId = P_UserId
        AND P.PaymentStatus = 'Success';
END;
$$;


ALTER FUNCTION public.myorders(p_userid integer) OWNER TO postgres;

--
-- Name: updatecart(integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatecart(IN u_cartid integer, IN u_quantity integer, IN u_modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE CART 
	SET Quantity = U_Quantity, ModifiedAt = U_ModifiedAt
	WHERE CartId = U_CartId;
END;
$$;


ALTER PROCEDURE public.updatecart(IN u_cartid integer, IN u_quantity integer, IN u_modifiedat timestamp without time zone) OWNER TO postgres;

--
-- Name: updatecart(integer, integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatecart(IN u_cartid integer, IN u_quantity integer, IN u_producttotal integer, IN u_modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE CART 
	SET Quantity = U_Quantity, ProductTotal = U_ProductTotal
	WHERE CartId = U_CartId;
END;
$$;


ALTER PROCEDURE public.updatecart(IN u_cartid integer, IN u_quantity integer, IN u_producttotal integer, IN u_modifiedat timestamp without time zone) OWNER TO postgres;

--
-- Name: updatecart(integer, integer, integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatecart(IN u_userid integer, IN u_productid integer, IN u_quantity integer, IN u_producttotal integer, IN u_modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE CART 
	SET Quantity = U_Quantity, ProductTotal = U_ProductTotal
	WHERE ProductId = U_ProductId AND UserId = U_UserId;
END;
$$;


ALTER PROCEDURE public.updatecart(IN u_userid integer, IN u_productid integer, IN u_quantity integer, IN u_producttotal integer, IN u_modifiedat timestamp without time zone) OWNER TO postgres;

--
-- Name: updatecategory(integer, character varying, integer, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatecategory(IN u_categoryid integer, IN u_categoryname character varying, IN u_active integer, IN u_modifiedat timestamp without time zone, IN u_modifiedby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Categories 
	SET CategoryName = U_CategoryName, Active = U_Active, ModifiedAt = U_ModifiedAt, ModifiedBy = U_ModifiedBy
	WHERE CategoryId = U_categoryId;
END;
$$;


ALTER PROCEDURE public.updatecategory(IN u_categoryid integer, IN u_categoryname character varying, IN u_active integer, IN u_modifiedat timestamp without time zone, IN u_modifiedby character varying) OWNER TO postgres;

--
-- Name: updatestock(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatestock(IN u_productid integer, IN u_quantityinstock integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Stock
	SET QuantityInStock = U_QuantityInStock
	WHERE ProductId = U_ProductId;
END;
$$;


ALTER PROCEDURE public.updatestock(IN u_productid integer, IN u_quantityinstock integer) OWNER TO postgres;

--
-- Name: updatestock(integer, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatestock(IN u_productid integer, IN u_quantityinstock integer, IN u_modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Stock
	SET QuantityInStock = U_QuantityInStock, ModifiedAt = U_ModifiedAt
	WHERE ProductId = U_ProductId;
END;
$$;


ALTER PROCEDURE public.updatestock(IN u_productid integer, IN u_quantityinstock integer, IN u_modifiedat timestamp without time zone) OWNER TO postgres;

--
-- Name: updatesupplier(integer, character varying, character varying, character varying, timestamp without time zone, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatesupplier(IN c_supplierid integer, IN c_suppliername character varying, IN c_supplierphonenumber character varying, IN c_supplieraddress character varying, IN c_modifiedat timestamp without time zone, IN c_modifiedby character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Supplier
	SET SupplierName = C_SupplierName, 
		SupplierPhoneNumber = C_SupplierPhoneNumber, 
		SupplierAddress = C_SupplierAddress, 
		ModifiedAt = C_ModifiedAt, 
		ModifiedBy = C_ModifiedBy
	WHERE SupplierId = C_SupplierId;
END;
$$;


ALTER PROCEDURE public.updatesupplier(IN c_supplierid integer, IN c_suppliername character varying, IN c_supplierphonenumber character varying, IN c_supplieraddress character varying, IN c_modifiedat timestamp without time zone, IN c_modifiedby character varying) OWNER TO postgres;

--
-- Name: updateuser(integer, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updateuser(IN u_userid integer, IN u_username character varying, IN u_userphonenumber character varying, IN u_useraddress character varying, IN u_usercity character varying, IN u_userpincode character varying, IN u_userstate character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Users
	SET UserName = U_UserName, UserPhoneNumber = U_UserPhoneNumber, UserAddress = U_UserAddress, UserCity = U_UserCity, UserPincode = U_UserPincode, UserState = U_UserState
	WHERE UserId = U_UserId;
END;
$$;


ALTER PROCEDURE public.updateuser(IN u_userid integer, IN u_username character varying, IN u_userphonenumber character varying, IN u_useraddress character varying, IN u_usercity character varying, IN u_userpincode character varying, IN u_userstate character varying) OWNER TO postgres;

--
-- Name: updateuseraddress(integer, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updateuseraddress(IN u_userid integer, IN u_useralternateaddress character varying, IN u_useralternatecity character varying, IN u_useralternatepincode character varying, IN u_useralternatestate character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Users
	SET UserAlternateAddress = U_UserAlternateAddress, UserAlternateCity = U_UserAlternateCity, UserAlternatePincode = U_UserAlternatePincode, UserAlternateState = U_UserAlternateState
	WHERE UserId = U_UserId;
END;
$$;


ALTER PROCEDURE public.updateuseraddress(IN u_userid integer, IN u_useralternateaddress character varying, IN u_useralternatecity character varying, IN u_useralternatepincode character varying, IN u_useralternatestate character varying) OWNER TO postgres;

--
-- Name: updateuserprimaryaddress(integer, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updateuserprimaryaddress(IN u_userid integer, IN u_useraddress character varying, IN u_usercity character varying, IN u_userpincode character varying, IN u_userstate character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Users
	SET UserAddress = U_UserAddress, UserCity = U_UserCity, UserPincode = U_UserPincode, UserState = U_UserState
	WHERE UserId = U_UserId;
END;
$$;


ALTER PROCEDURE public.updateuserprimaryaddress(IN u_userid integer, IN u_useraddress character varying, IN u_usercity character varying, IN u_userpincode character varying, IN u_userstate character varying) OWNER TO postgres;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cartid integer NOT NULL,
    userid integer,
    productid integer,
    quantity integer,
    producttotal integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cartid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_cartid_seq OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;


--
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_categoryid_seq OWNER TO postgres;

--
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- Name: deliverycharges_deliverychargeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliverycharges_deliverychargeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deliverycharges_deliverychargeid_seq OWNER TO postgres;

--
-- Name: deliverycharges_deliverychargeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliverycharges_deliverychargeid_seq OWNED BY public.deliverycharges.deliverychargeid;


--
-- Name: operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operations (
    operationid integer NOT NULL,
    operationname character varying(200)
);


ALTER TABLE public.operations OWNER TO postgres;

--
-- Name: operations_operationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operations_operationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.operations_operationid_seq OWNER TO postgres;

--
-- Name: operations_operationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operations_operationid_seq OWNED BY public.operations.operationid;


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    START WITH 10000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO postgres;

--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    orderdetailid integer NOT NULL,
    orderid integer,
    productid integer,
    quantity integer,
    producttotal integer,
    operationid integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_orderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetails_orderdetailid_seq OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_orderdetailid_seq OWNED BY public.orderdetails.orderdetailid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer DEFAULT nextval('public.order_id_seq'::regclass) NOT NULL,
    userid integer,
    orderdate date,
    ordersubtotalamount integer,
    ordertotalamount integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    paymentid integer NOT NULL,
    razorpaypaymentid character varying(200),
    orderid integer,
    razorpayorderid character varying(200),
    paymentstatus character varying(200),
    createdat timestamp without time zone
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_paymentid_seq OWNER TO postgres;

--
-- Name: payment_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_paymentid_seq OWNED BY public.payment.paymentid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    categoryid integer,
    productname character varying(100),
    imagelink character varying(200),
    healthinfo character varying(500),
    nutritionalinfo character varying(200),
    sku integer,
    bestseller integer,
    weight integer,
    quantitytype character varying(200),
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200),
    active integer,
    productnotes character varying(1000)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: purchaseorder_purchaseorderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchaseorder_purchaseorderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchaseorder_purchaseorderid_seq OWNER TO postgres;

--
-- Name: purchaseorder_purchaseorderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchaseorder_purchaseorderid_seq OWNED BY public.purchaseorder.purchaseorderid;


--
-- Name: purchaseorderdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchaseorderdetail (
    purchaseorderdetailid integer NOT NULL,
    purchaseorderid integer,
    productid integer,
    quantity integer,
    quantitytype character varying(200),
    purchaseprice integer,
    operationid integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200)
);


ALTER TABLE public.purchaseorderdetail OWNER TO postgres;

--
-- Name: purchaseorderdetail_purchaseorderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchaseorderdetail_purchaseorderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchaseorderdetail_purchaseorderdetailid_seq OWNER TO postgres;

--
-- Name: purchaseorderdetail_purchaseorderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchaseorderdetail_purchaseorderdetailid_seq OWNED BY public.purchaseorderdetail.purchaseorderdetailid;


--
-- Name: rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate (
    rateid integer NOT NULL,
    productid integer,
    mrp integer,
    discount integer,
    sellingprice integer,
    currency character varying(200),
    effectivedate timestamp without time zone,
    enddate timestamp without time zone,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200)
);


ALTER TABLE public.rate OWNER TO postgres;

--
-- Name: rate_rateid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rate_rateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rate_rateid_seq OWNER TO postgres;

--
-- Name: rate_rateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rate_rateid_seq OWNED BY public.rate.rateid;


--
-- Name: stock_stockid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stockid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_stockid_seq OWNER TO postgres;

--
-- Name: stock_stockid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stockid_seq OWNED BY public.stock.stockid;


--
-- Name: stockhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockhistory (
    stockhistoryid integer NOT NULL,
    stockoldvalue integer,
    stocknewvalue integer,
    operationid integer,
    stockid integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone,
    createdby character varying(200),
    modifiedby character varying(200)
);


ALTER TABLE public.stockhistory OWNER TO postgres;

--
-- Name: stockhistory_stockhistoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stockhistory_stockhistoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stockhistory_stockhistoryid_seq OWNER TO postgres;

--
-- Name: stockhistory_stockhistoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stockhistory_stockhistoryid_seq OWNED BY public.stockhistory.stockhistoryid;


--
-- Name: supplier_supplierid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_supplierid_seq OWNER TO postgres;

--
-- Name: supplier_supplierid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplierid_seq OWNED BY public.supplier.supplierid;


--
-- Name: userrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userrole (
    userroleid integer NOT NULL,
    userrolename character varying(200)
);


ALTER TABLE public.userrole OWNER TO postgres;

--
-- Name: userrole_userroleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userrole_userroleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userrole_userroleid_seq OWNER TO postgres;

--
-- Name: userrole_userroleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userrole_userroleid_seq OWNED BY public.userrole.userroleid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(200),
    useremail character varying(200),
    userpassword character varying(200),
    userphonenumber character varying(200),
    useraddress character varying(200),
    usercity character varying(200),
    userpincode character varying(200),
    userstate character varying(200),
    useralternateaddress character varying(200),
    useralternatecity character varying(200),
    useralternatepincode character varying(200),
    useralternatestate character varying(200),
    userroleid integer,
    createdat timestamp without time zone,
    modifiedat timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: cart cartid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);


--
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- Name: deliverycharges deliverychargeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverycharges ALTER COLUMN deliverychargeid SET DEFAULT nextval('public.deliverycharges_deliverychargeid_seq'::regclass);


--
-- Name: operations operationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations ALTER COLUMN operationid SET DEFAULT nextval('public.operations_operationid_seq'::regclass);


--
-- Name: orderdetails orderdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN orderdetailid SET DEFAULT nextval('public.orderdetails_orderdetailid_seq'::regclass);


--
-- Name: payment paymentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN paymentid SET DEFAULT nextval('public.payment_paymentid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Name: purchaseorder purchaseorderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchaseorder ALTER COLUMN purchaseorderid SET DEFAULT nextval('public.purchaseorder_purchaseorderid_seq'::regclass);


--
-- Name: purchaseorderdetail purchaseorderdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchaseorderdetail ALTER COLUMN purchaseorderdetailid SET DEFAULT nextval('public.purchaseorderdetail_purchaseorderdetailid_seq'::regclass);


--
-- Name: rate rateid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate ALTER COLUMN rateid SET DEFAULT nextval('public.rate_rateid_seq'::regclass);


--
-- Name: stock stockid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stockid SET DEFAULT nextval('public.stock_stockid_seq'::regclass);


--
-- Name: stockhistory stockhistoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockhistory ALTER COLUMN stockhistoryid SET DEFAULT nextval('public.stockhistory_stockhistoryid_seq'::regclass);


--
-- Name: supplier supplierid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplierid SET DEFAULT nextval('public.supplier_supplierid_seq'::regclass);


--
-- Name: userrole userroleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrole ALTER COLUMN userroleid SET DEFAULT nextval('public.userrole_userroleid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cartid, userid, productid, quantity, producttotal, createdat, modifiedat) FROM stdin;
411	12	14	1	\N	2024-02-01 12:14:04.641154	\N
421	12	6	1	\N	2024-02-01 18:32:16.011851	\N
422	12	31	1	\N	2024-02-01 18:33:51.483574	\N
419	12	11	2	\N	2024-02-01 17:35:26.607979	2024-02-01 18:34:09.317317
430	1	34	2	\N	2024-02-02 12:02:29.152607	\N
431	1	17	2	\N	2024-02-02 12:50:55.809455	\N
333	21	1	2	\N	2024-01-30 11:04:31.081409	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (categoryid, categoryname, createdat, modifiedat, createdby, modifiedby, active, imagelink) FROM stdin;
1	Millets	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
2	Millets Noodles	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
3	Millets Pasta	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
4	Millets Sevai	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
5	Millets Cookies	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
6	Organi Rice	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
7	Natural Sweetners	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
8	Dal	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
9	Marachekku Oil	2024-01-10 16:53:55.697178	2024-01-10 16:53:55.697178	Jithendran	Jithendran	1	oil.jpg
11	vegetables	2024-01-22 18:36:54.660003	2024-01-23 10:49:18.151814	admin@milletsmarket.in	admin@milletsmarket.in	0	oil.jpg
10	fruits	2024-01-22 18:34:54.7917	2024-01-23 10:49:53.156616	admin@milletsmarket.in	admin@milletsmarket.in	0	oil.jpg
\.


--
-- Data for Name: deliverycharges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverycharges (deliverychargeid, pincode, city, deliveryamount, serviceavailability) FROM stdin;
1	600001	CHENNAI	40	SERVICE
2	600002	CHENNAI	50	SERVICE
3	600003	CHENNAI	60	SERVICE
4	600004	CHENNAI	70	SERVICE
5	600005	CHENNAI	40	SERVICE
6	600006	CHENNAI	50	SERVICE
7	600007	CHENNAI	60	SERVICE
8	600008	CHENNAI	70	SERVICE
9	600009	CHENNAI	40	SERVICE
10	600010	CHENNAI	50	SERVICE
11	600011	CHENNAI	60	SERVICE
12	600012	CHENNAI	70	SERVICE
13	600013	CHENNAI	40	SERVICE
14	600014	CHENNAI	50	SERVICE
15	600015	CHENNAI	60	SERVICE
16	600016	CHENNAI	70	SERVICE
17	600017	CHENNAI	40	SERVICE
18	600018	CHENNAI	50	SERVICE
19	600019	CHENNAI	60	SERVICE
20	600020	CHENNAI	70	SERVICE
21	600021	CHENNAI	40	SERVICE
22	600022	CHENNAI	50	SERVICE
23	600023	CHENNAI	60	SERVICE
24	600024	CHENNAI	70	SERVICE
25	600025	CHENNAI	40	SERVICE
26	600026	CHENNAI	50	SERVICE
27	600027	CHENNAI	60	SERVICE
28	600028	CHENNAI	70	SERVICE
29	600029	CHENNAI	80	SERVICE
30	600030	CHENNAI	40	SERVICE
31	600031	CHENNAI	50	SERVICE
32	600032	CHENNAI	60	SERVICE
33	600033	CHENNAI	70	SERVICE
34	600034	CHENNAI	80	SERVICE
35	600035	CHENNAI	40	SERVICE
36	600036	CHENNAI	50	SERVICE
37	600037	CHENNAI	60	SERVICE
38	600038	CHENNAI	70	SERVICE
39	600039	CHENNAI	80	SERVICE
40	600040	CHENNAI	40	SERVICE
41	600041	CHENNAI	50	SERVICE
42	600042	CHENNAI	60	SERVICE
43	600043	CHENNAI	70	SERVICE
44	600044	CHENNAI	80	SERVICE
45	600045	CHENNAI	40	SERVICE
46	600046	CHENNAI	50	SERVICE
47	600047	CHENNAI	60	SERVICE
48	600048	CHENNAI	70	SERVICE
49	600049	CHENNAI	80	SERVICE
50	600050	CHENNAI	40	SERVICE
51	600102	CHENNAI	50	SERVICE
52	600103	CHENNAI	60	ODA
53	600104	CHENNAI	70	SERVICE
54	600106	CHENNAI	80	SERVICE
55	600107	CHENNAI	40	SERVICE
56	600108	CHENNAI	50	SERVICE
57	600109	CHENNAI	60	SERVICE
58	600110	CHENNAI	70	SERVICE
59	600112	CHENNAI	80	SERVICE
60	600113	CHENNAI	40	SERVICE
61	600114	CHENNAI	50	SERVICE
62	600115	CHENNAI	60	SERVICE
63	600116	CHENNAI	70	SERVICE
64	600117	CHENNAI	80	SERVICE
65	600118	CHENNAI	40	SERVICE
66	600119	CHENNAI	50	SERVICE
67	600122	CHENNAI	60	SERVICE
68	600123	CHENNAI	70	SERVICE
69	600124	CHENNAI	80	SERVICE
70	600125	CHENNAI	40	SERVICE
71	600126	CHENNAI	50	SERVICE
72	600127	CHENNAI	60	ODA
73	600128	CHENNAI	70	SERVICE
74	600129	CHENNAI	80	SERVICE
75	600130	CHENNAI	40	SERVICE
76	600131	CHENNAI	50	SERVICE
77	601103	CHENNAI	60	ODA
78	601201	CHENNAI	70	ODA
79	601202	CHENNAI	80	ODA
80	601203	CHENNAI	40	ODA
81	601204	CHENNAI	50	ODA
82	601206	CHENNAI	60	ODA
83	601301	CHENNAI	70	SERVICE
84	602001	CHENNAI	80	SERVICE
85	602002	CHENNAI	40	ODA
86	602003	CHENNAI	50	ODA
87	602023	CHENNAI	60	ODA
88	602024	CHENNAI	70	SERVICE
89	602025	CHENNAI	80	ODA
90	602026	CHENNAI	40	ODA
91	602101	CHENNAI	50	ODA
92	602105	CHENNAI	60	SERVICE
93	602106	CHENNAI	70	ODA
94	602107	CHENNAI	80	SERVICE
95	602117	CHENNAI	40	SERVICE
96	603001	CHENNAI	50	ODA
97	603002	CHENNAI	60	SERVICE
98	603003	CHENNAI	70	ODA
99	603004	CHENNAI	80	ODA
100	603101	CHENNAI	40	ODA
101	604501	TIRUVANNAMALAI	50	ODA
102	604502	TIRUVANNAMALAI	60	ODA
103	604503	TIRUVANNAMALAI	70	ODA
104	604505	TIRUVANNAMALAI	80	ODA
105	604601	TIRUVANNAMALAI	40	ODA
106	605001	PONDICHERRY	50	SERVICE
107	605002	PONDICHERRY	60	SERVICE
108	605003	PONDICHERRY	70	SERVICE
109	605004	PONDICHERRY	80	SERVICE
110	605005	PONDICHERRY	40	SERVICE
111	605006	PONDICHERRY	50	SERVICE
112	605007	PONDICHERRY	60	SERVICE
113	605008	PONDICHERRY	70	SERVICE
114	605009	PONDICHERRY	80	SERVICE
115	605010	PONDICHERRY	40	SERVICE
116	605011	PONDICHERRY	50	SERVICE
117	605013	PONDICHERRY	60	SERVICE
118	605014	PONDICHERRY	70	SERVICE
119	605101	PONDICHERRY	80	SERVICE
120	605102	PONDICHERRY	40	SERVICE
121	605103	VILUPPURAM	50	SERVICE
122	605104	PONDICHERRY	60	SERVICE
123	605105	VILUPPURAM	70	ODA
124	605106	VILUPPURAM	80	ODA
125	605107	PONDICHERRY	40	SERVICE
126	605108	VILUPPURAM	50	SERVICE
127	605109	VILUPPURAM	60	SERVICE
128	605110	PONDICHERRY	70	SERVICE
129	605111	PONDICHERRY	80	SERVICE
130	605201	VILUPPURAM	40	ODA
131	605203	VILUPPURAM	50	ODA
132	605301	VILUPPURAM	60	SERVICE
133	605302	VILUPPURAM	70	SERVICE
134	605401	VILUPPURAM	80	SERVICE
135	605402	VILUPPURAM	40	ODA
136	605501	VILUPPURAM	50	ODA
137	605502	PONDICHERRY	60	ODA
138	605601	VILUPPURAM	70	SERVICE
139	605602	VILUPPURAM	80	SERVICE
140	605652	VILUPPURAM	40	ODA
141	605701	VILUPPURAM	50	ODA
142	605702	VILUPPURAM	60	ODA
143	605751	VILUPPURAM	70	ODA
144	605752	VILUPPURAM	80	ODA
145	605754	VILUPPURAM	40	ODA
146	605755	VILUPPURAM	50	ODA
147	605757	VILUPPURAM	60	ODA
148	605766	VILUPPURAM	70	ODA
149	605801	VILUPPURAM	80	ODA
150	605803	VILUPPURAM	40	ODA
151	606907	TIRUVANNAMALAI	50	ODA
152	606908	TIRUVANNAMALAI	60	ODA
153	607001	CUDDALORE	70	SERVICE
154	607002	CUDDALORE	80	SERVICE
155	607003	CUDDALORE	40	SERVICE
156	607004	CUDDALORE	50	SERVICE
157	607005	CUDDALORE	60	SERVICE
158	607006	CUDDALORE	70	SERVICE
159	607101	VILUPPURAM	80	ODA
160	607102	CUDDALORE	40	ODA
161	607103	VILUPPURAM	50	ODA
162	607104	CUDDALORE	60	ODA
163	607105	CUDDALORE	70	SERVICE
164	607106	CUDDALORE	80	ODA
165	607107	VILUPPURAM	40	ODA
166	607108	VILUPPURAM	50	ODA
167	607109	CUDDALORE	60	SERVICE
168	607112	VILUPPURAM	70	ODA
169	607201	VILUPPURAM	80	ODA
170	607202	VILUPPURAM	40	ODA
171	607203	VILUPPURAM	50	ODA
172	607204	VILUPPURAM	60	SERVICE
173	607205	CUDDALORE	70	ODA
174	607301	CUDDALORE	80	SERVICE
175	607302	CUDDALORE	40	ODA
176	607303	CUDDALORE	50	SERVICE
177	607307	CUDDALORE	60	ODA
178	607308	CUDDALORE	70	ODA
179	607401	CUDDALORE	80	SERVICE
180	607402	PONDICHERRY	40	SERVICE
181	607403	PONDICHERRY	50	SERVICE
182	607801	VILUPPURAM	60	ODA
183	607802	CUDDALORE	70	SERVICE
184	607803	CUDDALORE	80	ODA
185	607805	VILUPPURAM	40	ODA
186	607807	VILUPPURAM	50	ODA
187	608001	CUDDALORE	60	ODA
188	608002	CUDDALORE	70	SERVICE
189	608201	CUDDALORE	80	ODA
190	608301	CUDDALORE	40	ODA
191	608302	CUDDALORE	50	ODA
192	608303	CUDDALORE	60	ODA
193	608305	CUDDALORE	70	ODA
194	608306	CUDDALORE	80	ODA
195	608501	CUDDALORE	40	ODA
196	608502	CUDDALORE	50	SERVICE
197	608601	CUDDALORE	60	ODA
198	608602	CUDDALORE	70	ODA
199	608701	CUDDALORE	80	ODA
200	608702	CUDDALORE	40	ODA
201	610203	KUMBAKONAM	50	SERVICE
202	610204	KUMBAKONAM	60	ODA
203	610206	KUMBAKONAM	70	ODA
204	611001	KUMBAKONAM	80	SERVICE
205	611002	KUMBAKONAM	40	SERVICE
206	611003	KUMBAKONAM	50	SERVICE
207	611101	KUMBAKONAM	60	ODA
208	611104	KUMBAKONAM	70	ODA
209	611105	KUMBAKONAM	80	ODA
210	611108	KUMBAKONAM	40	ODA
211	611109	KUMBAKONAM	50	ODA
212	611110	KUMBAKONAM	60	ODA
213	611111	KUMBAKONAM	70	SERVICE
214	611112	KUMBAKONAM	80	ODA
215	612001	KUMBAKONAM	40	SERVICE
216	612002	KUMBAKONAM	50	SERVICE
217	612007	TANJORE	60	ODA
218	612101	KUMBAKONAM	70	SERVICE
219	612102	KUMBAKONAM	80	ODA
220	612103	KUMBAKONAM	40	SERVICE
221	612104	KUMBAKONAM	50	SERVICE
222	612105	KUMBAKONAM	60	SERVICE
223	612106	KUMBAKONAM	70	SERVICE
224	612202	KUMBAKONAM	80	ODA
225	612203	KUMBAKONAM	40	ODA
226	612204	KUMBAKONAM	50	SERVICE
227	612301	KUMBAKONAM	60	ODA
228	612302	KUMBAKONAM	70	SERVICE
229	612303	KUMBAKONAM	80	SERVICE
230	612401	KUMBAKONAM	40	SERVICE
231	612402	KUMBAKONAM	50	ODA
232	612501	KUMBAKONAM	60	SERVICE
233	612502	KUMBAKONAM	70	ODA
234	612503	KUMBAKONAM	80	SERVICE
235	612504	KUMBAKONAM	40	SERVICE
236	612601	KUMBAKONAM	50	SERVICE
237	612602	KUMBAKONAM	60	SERVICE
238	612603	KUMBAKONAM	70	SERVICE
239	612605	TANJORE	80	SERVICE
240	612610	KUMBAKONAM	40	ODA
241	612701	TANJORE	50	ODA
242	612702	KUMBAKONAM	60	SERVICE
243	612703	KUMBAKONAM	70	SERVICE
244	612802	KUMBAKONAM	80	ODA
245	612804	KUMBAKONAM	40	SERVICE
246	612901	TIRUCHIRAPPALLI	50	ODA
247	612903	TIRUCHIRAPPALLI	60	ODA
248	612904	TIRUCHIRAPPALLI	70	ODA
249	613001	TANJORE	80	SERVICE
250	613002	TANJORE	40	SERVICE
251	614621	TIRUCHIRAPPALLI	50	ODA
252	614622	TIRUCHIRAPPALLI	60	ODA
253	614624	TIRUCHIRAPPALLI	70	ODA
254	614625	KUMBAKONAM	80	ODA
255	614626	TANJORE	40	ODA
256	614628	TANJORE	50	ODA
257	614629	TIRUCHIRAPPALLI	60	ODA
258	614630	TIRUCHIRAPPALLI	70	ODA
259	614701	KUMBAKONAM	80	ODA
260	614703	TANJORE	40	ODA
261	614704	TANJORE	50	ODA
262	614705	TANJORE	60	ODA
263	614706	TANJORE	70	ODA
264	614707	KUMBAKONAM	80	ODA
265	614708	TANJORE	40	ODA
266	614711	KUMBAKONAM	50	ODA
267	614712	KUMBAKONAM	60	ODA
268	614713	KUMBAKONAM	70	ODA
269	614714	KUMBAKONAM	80	ODA
270	614803	TANJORE	40	ODA
271	614804	KUMBAKONAM	50	ODA
272	614806	TANJORE	60	ODA
273	614807	KUMBAKONAM	70	SERVICE
274	614808	KUMBAKONAM	80	ODA
275	614809	KUMBAKONAM	40	ODA
276	614810	KUMBAKONAM	50	SERVICE
277	614903	TANJORE	60	SERVICE
278	614904	TANJORE	70	ODA
279	614905	TANJORE	80	ODA
280	620001	TIRUCHIRAPPALLI	40	SERVICE
281	620002	TIRUCHIRAPPALLI	50	SERVICE
282	620003	TIRUCHIRAPPALLI	60	SERVICE
283	620004	TIRUCHIRAPPALLI	70	SERVICE
284	620005	TIRUCHIRAPPALLI	80	SERVICE
285	620006	TIRUCHIRAPPALLI	40	SERVICE
286	620007	TIRUCHIRAPPALLI	50	SERVICE
287	620008	TIRUCHIRAPPALLI	60	SERVICE
288	620009	TIRUCHIRAPPALLI	70	SERVICE
289	620010	TIRUCHIRAPPALLI	80	SERVICE
290	620011	TIRUCHIRAPPALLI	40	SERVICE
291	620012	TIRUCHIRAPPALLI	50	ODA
292	620013	TIRUCHIRAPPALLI	60	SERVICE
293	620014	TIRUCHIRAPPALLI	70	SERVICE
294	620015	TIRUCHIRAPPALLI	80	ODA
295	620016	TIRUCHIRAPPALLI	40	ODA
296	620017	TIRUCHIRAPPALLI	50	SERVICE
297	620018	TIRUCHIRAPPALLI	60	SERVICE
298	620019	TIRUCHIRAPPALLI	70	SERVICE
299	620020	TIRUCHIRAPPALLI	80	SERVICE
300	620021	TIRUCHIRAPPALLI	40	SERVICE
301	621308	TIRUCHIRAPPALLI	50	ODA
302	621310	TIRUCHIRAPPALLI	60	ODA
303	621311	KARUR	70	ODA
304	621312	TIRUCHIRAPPALLI	80	ODA
305	621313	KARUR	40	ODA
306	621314	TIRUCHIRAPPALLI	50	ODA
307	621315	TIRUCHIRAPPALLI	60	ODA
308	621316	TIRUCHIRAPPALLI	70	SERVICE
309	621601	TIRUCHIRAPPALLI	80	SERVICE
310	621652	TIRUCHIRAPPALLI	40	ODA
311	621701	TIRUCHIRAPPALLI	50	ODA
312	621703	TIRUCHIRAPPALLI	60	ODA
313	621704	TIRUCHIRAPPALLI	70	SERVICE
314	621707	TIRUCHIRAPPALLI	80	ODA
315	621708	TIRUCHIRAPPALLI	40	ODA
316	621710	TIRUCHIRAPPALLI	50	ODA
317	621711	TIRUCHIRAPPALLI	60	ODA
318	621713	TIRUCHIRAPPALLI	70	ODA
319	621714	TIRUCHIRAPPALLI	80	ODA
320	621715	TIRUCHIRAPPALLI	40	ODA
321	621716	TIRUCHIRAPPALLI	50	ODA
322	621717	TIRUCHIRAPPALLI	60	SERVICE
323	621729	TIRUCHIRAPPALLI	70	SERVICE
324	621731	TIRUCHIRAPPALLI	80	SERVICE
325	621801	TIRUCHIRAPPALLI	40	ODA
326	621802	TIRUCHIRAPPALLI	50	SERVICE
327	621803	TIRUCHIRAPPALLI	60	ODA
328	621804	TIRUCHIRAPPALLI	70	ODA
329	621805	TIRUCHIRAPPALLI	80	ODA
330	621806	TIRUCHIRAPPALLI	40	ODA
331	621851	TIRUCHIRAPPALLI	50	ODA
332	622001	PUDUKKOTTAI	60	SERVICE
333	622002	PUDUKKOTTAI	70	ODA
334	622003	PUDUKKOTTAI	80	SERVICE
335	622004	PUDUKKOTTAI	40	SERVICE
336	622005	PUDUKKOTTAI	50	SERVICE
337	622101	TIRUCHIRAPPALLI	60	ODA
338	622102	TIRUCHIRAPPALLI	70	ODA
339	622103	TIRUCHIRAPPALLI	80	ODA
340	622104	TIRUCHIRAPPALLI	40	SERVICE
341	622201	TIRUCHIRAPPALLI	50	ODA
342	622202	TIRUCHIRAPPALLI	60	ODA
343	622209	TIRUCHIRAPPALLI	70	ODA
344	622301	PUDUKKOTTAI	80	SERVICE
345	622302	TIRUCHIRAPPALLI	40	ODA
346	622304	TIRUCHIRAPPALLI	50	ODA
347	622401	TIRUCHIRAPPALLI	60	ODA
348	622402	TIRUCHIRAPPALLI	70	ODA
349	622407	TIRUCHIRAPPALLI	80	ODA
350	622411	TIRUCHIRAPPALLI	40	ODA
351	623701	PARAMKUDI	50	ODA
352	623701	RAMNAD	60	ODA
353	623703	RAMNAD	70	SERVICE
354	623704	RAMNAD	80	ODA
355	623706	RAMNAD	40	ODA
356	623707	RAMNAD	50	ODA
357	623711	RAMNAD	60	ODA
358	623712	RAMNAD	70	ODA
359	623806	RAMNAD	80	ODA
360	624001	DINDIGUL	40	SERVICE
361	624002	DINDIGUL	50	SERVICE
362	624003	DINDIGUL	60	SERVICE
363	624004	DINDIGUL	70	SERVICE
364	624005	DINDIGUL	80	SERVICE
365	624101	DINDIGUL	40	ODA
366	624103	DINDIGUL	50	ODA
367	624201	DINDIGUL	60	ODA
368	624202	THENI	70	SERVICE
369	624204	DINDIGUL	80	ODA
370	624206	DINDIGUL	40	ODA
371	624208	KAPPALUR - MADURAI	50	SERVICE
372	624211	DINDIGUL	60	ODA
373	624220	DINDIGUL	70	ODA
374	624301	KAPPALUR - MADURAI	80	SERVICE
375	624302	KAPPALUR - MADURAI	40	SERVICE
376	624303	DINDIGUL	50	ODA
377	624304	DINDIGUL	60	ODA
378	624306	DINDIGUL	70	ODA
379	624307	DINDIGUL	80	ODA
380	624308	DINDIGUL	40	ODA
381	624401	DINDIGUL	50	ODA
382	624403	DINDIGUL	60	ODA
383	624601	DINDIGUL	70	ODA
384	624613	DINDIGUL	40	ODA
385	624614	DINDIGUL	50	ODA
386	624615	DINDIGUL	60	ODA
387	624616	DINDIGUL	70	ODA
388	624617	DINDIGUL	40	ODA
389	624618	DINDIGUL	50	ODA
390	624619	DINDIGUL	60	SERVICE
391	624620	DINDIGUL	70	ODA
392	624621	DINDIGUL	40	ODA
393	624622	DINDIGUL	50	ODA
394	624701	DINDIGUL	60	ODA
395	624702	DINDIGUL	70	ODA
396	624703	DINDIGUL	40	ODA
397	624705	DINDIGUL	50	ODA
398	624706	DINDIGUL	60	ODA
399	624707	DINDIGUL	70	ODA
400	624708	DINDIGUL	40	ODA
401	625516	THENI	50	SERVICE
402	625517	THENI	60	ODA
403	625520	THENI	70	ODA
404	625523	THENI	40	SERVICE
405	625528	THENI	50	ODA
406	625529	MADURAI	60	ODA
407	625530	THENI	70	ODA
408	625531	THENI	80	SERVICE
409	625532	KAPPALUR - MADURAI	40	SERVICE
410	625533	THENI	50	SERVICE
411	625534	THENI	60	SERVICE
412	625535	MADURAI	70	ODA
413	625579	THENI	80	ODA
414	625601	THENI	40	SERVICE
415	625602	THENI	50	ODA
416	625603	THENI	60	ODA
417	625604	THENI	70	ODA
418	625605	THENI	80	ODA
419	625701	KAPPALUR - MADURAI	40	ODA
420	625702	KAPPALUR - MADURAI	50	ODA
421	625703	MADURAI	60	ODA
422	625705	THENI	70	ODA
423	625706	KAPPALUR - MADURAI	80	SERVICE
424	625708	MADURAI	40	ODA
425	626001	VIRUDHUNAGAR	50	SERVICE
426	626002	VIRUDHUNAGAR	60	SERVICE
427	626003	VIRUDHUNAGAR	70	SERVICE
428	626004	VIRUDHUNAGAR	80	SERVICE
429	626005	VIRUDHUNAGAR	40	ODA
430	626101	VIRUDHUNAGAR	50	SERVICE
431	626102	RAJAPALAYAM	60	SERVICE
432	626103	VIRUDHUNAGAR	70	ODA
433	626104	VIRUDHUNAGAR	80	ODA
434	626105	VIRUDHUNAGAR	40	ODA
435	626106	VIRUDHUNAGAR	50	ODA
436	626108	SATTUR	60	SERVICE
437	626111	RAJAPALAYAM	70	ODA
438	626112	VIRUDHUNAGAR	80	ODA
439	626113	VIRUDHUNAGAR	40	ODA
440	626114	VIRUDHUNAGAR	50	ODA
441	626117	RAJAPALAYAM	60	SERVICE
442	626118	VIRUDHUNAGAR	70	ODA
443	626121	RAJAPALAYAM	80	ODA
444	626122	RAJAPALAYAM	40	SERVICE
445	626123	SIVAKASI	50	SERVICE
446	626124	SIVAKASI	60	SERVICE
447	626125	RAJAPALAYAM	70	SERVICE
448	626126	RAJAPALAYAM	80	ODA
449	626127	RAJAPALAYAM	40	ODA
450	626128	SIVAKASI	50	ODA
451	627152	TIRUNELVELI	60	ODA
452	627201	TIRUNELVELI	70	ODA
453	627202	TIRUNELVELI	80	ODA
454	627351	TIRUNELVELI	40	SERVICE
455	627352	TIRUNELVELI	50	ODA
456	627353	TIRUNELVELI	60	SERVICE
457	627354	TIRUNELVELI	70	ODA
458	627355	TIRUNELVELI	80	ODA
459	627356	TIRUNELVELI	40	ODA
460	627357	TIRUNELVELI	50	SERVICE
461	627358	TIRUNELVELI	60	SERVICE
462	627359	TIRUNELVELI	70	SERVICE
463	627401	TIRUNELVELI	80	ODA
464	627412	TIRUNELVELI	40	ODA
465	627414	TIRUNELVELI	50	ODA
466	627415	TIRUNELVELI	60	ODA
467	627416	TIRUNELVELI	70	ODA
468	627417	TIRUNELVELI	80	ODA
469	627421	TIRUNELVELI	40	ODA
470	627422	TIRUNELVELI	50	SERVICE
471	627423	TIRUNELVELI	60	ODA
472	627425	TIRUNELVELI	70	ODA
473	627426	TIRUNELVELI	80	ODA
474	627428	TIRUNELVELI	40	ODA
475	627451	TIRUNELVELI	50	ODA
476	627452	TIRUNELVELI	60	ODA
477	627453	TIRUNELVELI	70	ODA
478	627501	TIRUNELVELI	80	ODA
479	627502	TIRUNELVELI	40	ODA
480	627601	TIRUNELVELI	50	ODA
481	627602	TIRUNELVELI	60	ODA
482	627652	TIRUNELVELI	70	ODA
483	627654	TIRUNELVELI	80	ODA
484	627657	TIRUNELVELI	40	SERVICE
485	627713	KOVILPATTI	50	SERVICE
486	627718	KOVILPATTI	60	ODA
487	627719	KOVILPATTI	70	ODA
488	627751	TIRUNELVELI	80	ODA
489	627753	RAJAPALAYAM	40	ODA
490	627755	TIRUNELVELI	50	ODA
491	627756	TIRUNELVELI	60	SERVICE
492	627757	RAJAPALAYAM	70	ODA
493	627759	TIRUNELVELI	80	ODA
494	627760	TIRUNELVELI	40	ODA
495	627764	TIRUNELVELI	50	ODA
496	627802	TIRUNELVELI	60	ODA
497	627803	TIRUNELVELI	70	SERVICE
498	627804	TIRUNELVELI	80	ODA
499	627805	TIRUNELVELI	40	ODA
500	627807	TIRUNELVELI	50	ODA
501	628552	KOVILPATTI	60	SERVICE
502	628601	TIRUNELVELI	70	ODA
503	628612	TIRUNELVELI	80	ODA
504	628613	TIRUNELVELI	40	ODA
505	628615	TIRUNELVELI	50	ODA
506	628617	TIRUNELVELI	60	ODA
507	628620	THOOTHUKUDI	70	ODA
508	628622	TIRUNELVELI	80	ODA
509	628653	THOOTHUKUDI	40	ODA
510	628656	THOOTHUKUDI	50	ODA
511	628701	THOOTHUKUDI	60	ODA
512	628704	TIRUNELVELI	70	SERVICE
513	628714	KOVILPATTI	80	ODA
514	628716	KOVILPATTI	40	SERVICE
515	628718	KOVILPATTI	50	ODA
516	628720	KOVILPATTI	60	ODA
517	628722	THOOTHUKUDI	70	ODA
518	628801	THOOTHUKUDI	80	ODA
519	628802	THOOTHUKUDI	40	SERVICE
520	628809	TIRUNELVELI	50	SERVICE
521	628851	TIRUNELVELI	60	ODA
522	628901	KOVILPATTI	70	ODA
523	628902	KOVILPATTI	80	ODA
524	628903	THOOTHUKUDI	40	ODA
525	628904	SATTUR	50	ODA
526	628905	SATTUR	60	ODA
527	628906	THOOTHUKUDI	70	ODA
528	628907	KOVILPATTI	80	SERVICE
529	628952	KOVILPATTI	40	SERVICE
530	629001	NAGARKOVIL	50	SERVICE
531	629002	NAGARKOVIL	60	SERVICE
532	629003	NAGARKOVIL	70	SERVICE
533	629004	NAGARKOVIL	80	SERVICE
534	629101	NAGARKOVIL	40	ODA
535	629151	NAGARKOVIL	50	SERVICE
536	629152	NAGARKOVIL	60	ODA
537	629153	NAGARKOVIL	70	SERVICE
538	629154	NAGARKOVIL	80	ODA
539	629155	NAGARKOVIL	40	SERVICE
540	629157	NAGARKOVIL	50	SERVICE
541	629158	NAGARKOVIL	60	SERVICE
542	629159	NAGARKOVIL	70	ODA
543	629160	NAGARKOVIL	80	ODA
544	629161	NAGARKOVIL	40	SERVICE
545	629162	NAGARKOVIL	50	ODA
546	629163	NAGARKOVIL	60	ODA
547	629164	NAGARKOVIL	70	ODA
548	629165	NAGARKOVIL	80	SERVICE
549	629166	NAGARKOVIL	40	SERVICE
550	629167	NAGARKOVIL	50	SERVICE
551	630108	TIRUCHIRAPPALLI	60	ODA
552	630202	TIRUCHIRAPPALLI	70	SERVICE
553	630203	MADURAI	80	ODA
554	630204	MADURAI	40	ODA
555	630205	TIRUCHIRAPPALLI	50	ODA
556	630206	MADURAI	60	ODA
557	630211	MADURAI	70	SERVICE
558	630212	TIRUCHIRAPPALLI	80	ODA
559	630301	TIRUCHIRAPPALLI	40	SERVICE
560	630302	TIRUCHIRAPPALLI	50	SERVICE
561	630303	TIRUCHIRAPPALLI	60	SERVICE
562	630305	TIRUCHIRAPPALLI	70	ODA
563	630307	TIRUCHIRAPPALLI	80	ODA
564	630312	MADURAI	40	ODA
565	630313	MADURAI	50	ODA
566	630410	MADURAI	60	ODA
567	630411	MADURAI	70	ODA
568	630501	MADURAI	80	ODA
569	630502	MADURAI	40	ODA
570	630551	MADURAI	50	SERVICE
571	630553	MADURAI	60	ODA
572	630554	RAMNAD	70	ODA
573	630556	MADURAI	80	ODA
574	630561	MADURAI	40	SERVICE
575	630562	MADURAI	50	SERVICE
576	630602	MADURAI	60	ODA
577	630606	PARAMKUDI	70	SERVICE
578	630606	RAMNAD	80	ODA
579	630609	RAMNAD	40	ODA
580	630610	MADURAI	50	ODA
581	630611	PARAMKUDI	60	ODA
582	630611	RAMNAD	70	ODA
583	630612	MADURAI	80	SERVICE
584	630702	RAMNAD	40	ODA
585	630709	MADURAI	50	ODA
586	630710	RAMNAD	60	ODA
587	630713	MADURAI	70	ODA
588	630713	RAMNAD	80	ODA
589	631001	CHENNAI	40	ODA
590	631002	CHENNAI	50	ODA
591	631003	CHENNAI	60	ODA
592	631004	CHENNAI	70	ODA
593	631005	CHENNAI	80	ODA
594	631006	CHENNAI	40	ODA
595	631051	CHENNAI	50	ODA
596	631052	CHENNAI	60	ODA
597	631101	CHENNAI	70	ODA
598	631102	CHENNAI	80	ODA
599	631151	CHENNAI	40	ODA
600	631152	CHENNAI	50	ODA
601	632311	VELLORE	60	ODA
602	632313	TIRUVANNAMALAI	70	ODA
603	632314	TIRUVANNAMALAI	80	ODA
604	632316	VELLORE	40	ODA
605	632317	TIRUVANNAMALAI	50	ODA
606	632401	VELLORE	60	SERVICE
607	632403	VELLORE	70	SERVICE
608	632404	VELLORE	80	SERVICE
609	632405	VELLORE	40	SERVICE
610	632406	VELLORE	50	SERVICE
611	632501	VELLORE	60	ODA
612	632502	CHENNAI	70	ODA
613	632503	VELLORE	80	SERVICE
614	632505	CHENNAI	40	ODA
615	632506	VELLORE	50	ODA
616	632507	VELLORE	60	ODA
617	632508	VELLORE	70	ODA
618	632509	VELLORE	80	SERVICE
619	632510	CHENNAI	40	ODA
620	632511	CHENNAI	50	ODA
621	632512	VELLORE	60	ODA
622	632513	VELLORE	70	SERVICE
623	632514	VELLORE	80	ODA
624	632515	VELLORE	40	ODA
625	632517	VELLORE	50	ODA
626	632518	CHENNAI	60	ODA
627	632519	VELLORE	70	ODA
628	632521	VELLORE	80	SERVICE
629	632531	CHENNAI	40	ODA
630	632602	VELLORE	50	SERVICE
631	632603	VELLORE	60	ODA
632	635001	KRISHNAGIRI	70	SERVICE
633	635002	KRISHNAGIRI	80	SERVICE
634	635101	KRISHNAGIRI	40	ODA
635	635102	HOSUR	50	ODA
636	635103	HOSUR	60	ODA
637	635104	KRISHNAGIRI	70	ODA
638	635105	HOSUR	80	ODA
639	635107	HOSUR	40	ODA
640	635109	HOSUR	50	SERVICE
641	635110	HOSUR	60	SERVICE
642	635111	DHARMAPURI	70	ODA
643	635112	KRISHNAGIRI	80	ODA
644	635113	HOSUR	40	ODA
645	635114	HOSUR	50	ODA
646	635115	KRISHNAGIRI	60	SERVICE
647	635116	HOSUR	70	ODA
648	635117	HOSUR	80	ODA
649	635118	HOSUR	40	ODA
650	635119	HOSUR	50	ODA
651	636005	SALEM	60	SERVICE
653	636007	SALEM	80	SERVICE
654	636008	SALEM	40	SERVICE
655	636009	SALEM	50	SERVICE
656	636010	SALEM	60	SERVICE
657	636011	SALEM	70	SERVICE
658	636012	SALEM	80	ODA
659	636013	SALEM	40	SERVICE
660	636014	SALEM	50	SERVICE
661	636015	SALEM	60	SERVICE
662	636016	SALEM	70	SERVICE
663	636017	SALEM	80	SERVICE
664	636030	SALEM	40	ODA
665	636102	SALEM	50	SERVICE
666	636103	SALEM	60	SERVICE
667	636104	SALEM	70	ODA
668	636105	SALEM	80	ODA
669	636106	SALEM	40	ODA
670	636108	SALEM	50	ODA
671	636109	SALEM	60	ODA
672	636111	SALEM	70	ODA
673	636112	SALEM	80	ODA
674	636113	SALEM	40	ODA
675	636114	SALEM	50	ODA
676	636115	SALEM	60	ODA
677	636116	SALEM	70	ODA
678	636117	SALEM	80	ODA
679	636118	NAMAKKAL	40	ODA
680	636119	SALEM	50	ODA
681	636121	SALEM	60	ODA
682	636122	SALEM	70	ODA
683	636138	SALEM	80	ODA
684	636139	SALEM	40	ODA
685	636140	SALEM	50	ODA
686	636141	SALEM	60	ODA
687	636142	SALEM	70	ODA
688	636201	SALEM	80	SERVICE
689	636202	NAMAKKAL	40	ODA
690	636203	SALEM	50	ODA
691	636301	SALEM	60	ODA
692	636302	SALEM	70	SERVICE
693	636303	SALEM	80	ODA
694	636304	SALEM	40	ODA
696	636306	SALEM	60	ODA
697	636307	SALEM	70	SERVICE
698	636308	SALEM	80	ODA
699	636309	SALEM	40	ODA
700	636351	SALEM	50	ODA
701	637207	NAMAKKAL	60	SERVICE
702	637208	NAMAKKAL	70	ODA
703	637210	ERODE	80	ODA
704	637211	ERODE	40	SERVICE
705	637214	ERODE	50	ODA
706	637215	ERODE	60	SERVICE
707	637301	ERODE	70	ODA
708	637302	ERODE	80	SERVICE
709	637303	ERODE	40	SERVICE
710	637304	ERODE	50	ODA
711	637401	NAMAKKAL	60	ODA
712	637403	NAMAKKAL	70	ODA
713	637405	NAMAKKAL	80	SERVICE
714	637406	NAMAKKAL	40	ODA
715	637408	SALEM	50	ODA
716	637409	NAMAKKAL	60	SERVICE
717	637501	SALEM	70	ODA
718	637502	SALEM	80	ODA
719	637503	SALEM	40	ODA
720	637505	NAMAKKAL	50	ODA
721	638001	ERODE	60	SERVICE
722	638002	ERODE	70	SERVICE
723	638003	ERODE	80	SERVICE
724	638004	ERODE	40	SERVICE
725	638005	ERODE	50	SERVICE
726	638006	ERODE	60	SERVICE
727	638007	ERODE	70	SERVICE
728	638008	ERODE	80	SERVICE
729	638009	ERODE	40	SERVICE
730	638010	ERODE	50	SERVICE
731	638011	ERODE	60	SERVICE
732	638012	ERODE	70	SERVICE
733	638051	ERODE	80	ODA
734	638052	ERODE	40	ODA
735	638053	ERODE	50	SERVICE
736	638056	ERODE	60	ODA
737	638060	ERODE	70	SERVICE
738	638102	ERODE	80	SERVICE
739	638106	KARUR	40	ODA
740	638107	ERODE	50	SERVICE
741	638110	ERODE	60	ODA
742	638111	KARUR	70	ODA
743	638115	ERODE	80	SERVICE
744	638151	ERODE	40	SERVICE
745	638152	ERODE	50	ODA
746	638153	ERODE	60	ODA
747	638154	ERODE	70	ODA
748	638182	NAMAKKAL	80	ODA
749	638183	ERODE	40	ODA
750	638301	ERODE	50	ODA
751	639207	KARUR	60	ODA
752	641001	COIMBATORE	70	SERVICE
753	641002	COIMBATORE	80	SERVICE
754	641003	COIMBATORE	40	SERVICE
755	641004	COIMBATORE	50	SERVICE
756	641005	COIMBATORE	60	SERVICE
757	641006	COIMBATORE	70	SERVICE
758	641007	COIMBATORE	80	SERVICE
759	641008	COIMBATORE	40	SERVICE
760	641009	COIMBATORE	50	SERVICE
761	641010	COIMBATORE	60	SERVICE
762	641011	COIMBATORE	70	SERVICE
763	641012	COIMBATORE	40	SERVICE
764	641013	COIMBATORE	50	SERVICE
765	641014	COIMBATORE	60	SERVICE
766	641015	COIMBATORE	70	SERVICE
767	641016	COIMBATORE	40	SERVICE
768	641017	COIMBATORE	50	SERVICE
769	641018	COIMBATORE	60	SERVICE
770	641019	COIMBATORE	70	ODA
771	641020	COIMBATORE	40	SERVICE
772	641021	COIMBATORE	50	SERVICE
773	641022	COIMBATORE	60	SERVICE
774	641023	COIMBATORE	70	SERVICE
775	641024	COIMBATORE	40	SERVICE
776	641025	COIMBATORE	50	SERVICE
777	641026	COIMBATORE	60	ODA
778	641027	COIMBATORE	70	SERVICE
779	641028	COIMBATORE	40	SERVICE
780	641029	COIMBATORE	50	SERVICE
781	641030	COIMBATORE	60	SERVICE
695	636305	SALEM	50	SERVICE
782	641031	COIMBATORE	70	SERVICE
783	641032	COIMBATORE	40	SERVICE
784	641033	COIMBATORE	50	SERVICE
785	641034	COIMBATORE	60	SERVICE
786	641035	COIMBATORE	70	SERVICE
787	641036	COIMBATORE	80	SERVICE
788	641037	COIMBATORE	40	SERVICE
789	641038	COIMBATORE	50	SERVICE
790	641039	COIMBATORE	60	SERVICE
791	641041	COIMBATORE	70	SERVICE
792	641042	COIMBATORE	80	SERVICE
793	641043	COIMBATORE	40	SERVICE
794	641044	COIMBATORE	50	SERVICE
795	641045	COIMBATORE	60	SERVICE
796	641046	COIMBATORE	70	SERVICE
797	641047	COIMBATORE	80	ODA
798	641048	COIMBATORE	40	SERVICE
799	641049	COIMBATORE	50	SERVICE
800	641050	COIMBATORE	60	SERVICE
801	642205	TIRUPPUR	70	ODA
802	643001	COONOR	80	SERVICE
803	643006	COIMBATORE	40	SERVICE
804	643101	COONOR	50	ODA
805	643102	COONOR	60	ODA
806	643103	COONOR	70	ODA
807	643105	COIMBATORE	80	ODA
808	643202	COIMBATORE	40	ODA
809	643212	COONOR	50	ODA
810	643215	COIMBATORE	60	ODA
811	643231	COIMBATORE	70	ODA
812	643243	COIMBATORE	80	ODA
813	560001	BANGALORE	40	SERVICE
814	560002	BANGALORE	50	SERVICE
815	560003	BANGALORE	60	SERVICE
816	560004	BANGALORE	70	SERVICE
817	560005	BANGALORE	80	SERVICE
818	560006	BANGALORE	40	SERVICE
819	560007	BANGALORE	50	SERVICE
820	560008	BANGALORE	60	SERVICE
821	560009	BANGALORE	70	SERVICE
822	560010	BANGALORE	80	SERVICE
823	560011	BANGALORE	40	SERVICE
824	560012	BANGALORE	50	SERVICE
825	560013	BANGALORE	60	SERVICE
826	560014	BANGALORE	70	SERVICE
827	560015	BANGALORE	80	SERVICE
828	560016	BANGALORE	40	SERVICE
829	560017	BANGALORE	50	SERVICE
830	560018	BANGALORE	60	SERVICE
831	560019	BANGALORE	70	SERVICE
832	560020	BANGALORE	80	SERVICE
833	560021	BANGALORE	40	SERVICE
834	560022	BANGALORE	50	SERVICE
835	560023	BANGALORE	60	SERVICE
836	560024	BANGALORE	70	SERVICE
837	560025	BANGALORE	80	SERVICE
838	560026	BANGALORE	40	SERVICE
839	560027	BANGALORE	50	SERVICE
840	560028	BANGALORE	60	SERVICE
841	560029	BANGALORE	70	SERVICE
842	560030	BANGALORE	80	SERVICE
843	560031	BANGALORE	40	SERVICE
844	560032	BANGALORE	50	SERVICE
845	560033	BANGALORE	60	SERVICE
846	560034	BANGALORE	70	SERVICE
847	560035	BANGALORE	80	SERVICE
848	560036	BANGALORE	40	SERVICE
849	560037	BANGALORE	50	SERVICE
850	560038	BANGALORE	60	SERVICE
851	560089	BANGALORE	70	SERVICE
852	560090	BANGALORE	80	SERVICE
853	560091	BANGALORE	40	SERVICE
854	560092	BANGALORE	50	SERVICE
855	560093	BANGALORE	60	SERVICE
856	560094	BANGALORE	70	SERVICE
857	560095	BANGALORE	80	SERVICE
858	560096	BANGALORE	40	SERVICE
859	560097	BANGALORE	50	SERVICE
860	560098	BANGALORE	60	SERVICE
861	560099	BANGALORE	70	SERVICE
862	560100	BANGALORE	80	SERVICE
863	560102	BANGALORE	40	SERVICE
864	560103	BANGALORE	50	SERVICE
865	560104	BANGALORE	60	SERVICE
866	560105	BANGALORE	70	SERVICE
867	560106	BANGALORE	80	SERVICE
868	562101	BANGALORE	40	SERVICE
869	562106	BANGALORE	50	SERVICE
870	562107	BANGALORE	60	SERVICE
871	562109	BANGALORE	70	ODA
872	562111	BANGALORE	80	ODA
873	562114	BANGALORE	40	ODA
874	562123	BANGALORE	50	SERVICE
875	562132	BANGALORE	60	ODA
876	562162	BANGALORE	70	ODA
877	600051	CHENNAI	80	SERVICE
878	600052	CHENNAI	40	SERVICE
879	600053	CHENNAI	50	SERVICE
880	600054	CHENNAI	60	SERVICE
881	600055	CHENNAI	70	SERVICE
882	600056	CHENNAI	80	SERVICE
883	600058	CHENNAI	40	SERVICE
884	600059	CHENNAI	50	SERVICE
885	600060	CHENNAI	60	SERVICE
886	600061	CHENNAI	70	SERVICE
887	600062	CHENNAI	80	SERVICE
888	600063	CHENNAI	40	SERVICE
889	600064	CHENNAI	50	SERVICE
890	600065	CHENNAI	60	SERVICE
891	600066	CHENNAI	70	SERVICE
892	600067	CHENNAI	80	SERVICE
893	600068	CHENNAI	40	SERVICE
894	600069	CHENNAI	50	SERVICE
895	600070	CHENNAI	60	SERVICE
896	600071	CHENNAI	70	SERVICE
897	600072	CHENNAI	80	SERVICE
898	600073	CHENNAI	40	SERVICE
899	600074	CHENNAI	50	SERVICE
900	600075	CHENNAI	60	SERVICE
901	600076	CHENNAI	70	SERVICE
902	600077	CHENNAI	80	SERVICE
903	600078	CHENNAI	40	SERVICE
904	600079	CHENNAI	50	SERVICE
905	600080	CHENNAI	60	SERVICE
906	600081	CHENNAI	70	SERVICE
907	600082	CHENNAI	80	SERVICE
908	600083	CHENNAI	40	SERVICE
909	600084	CHENNAI	50	SERVICE
910	600085	CHENNAI	60	SERVICE
911	600086	CHENNAI	70	SERVICE
912	600087	CHENNAI	80	SERVICE
913	600088	CHENNAI	40	SERVICE
914	600089	CHENNAI	50	SERVICE
915	600090	CHENNAI	60	SERVICE
916	600091	CHENNAI	70	SERVICE
917	600092	CHENNAI	80	SERVICE
918	600093	CHENNAI	40	SERVICE
919	600094	CHENNAI	50	SERVICE
920	600095	CHENNAI	60	SERVICE
921	600096	CHENNAI	70	SERVICE
922	600097	CHENNAI	80	SERVICE
923	600098	CHENNAI	40	SERVICE
924	600099	CHENNAI	50	SERVICE
925	600100	CHENNAI	60	SERVICE
926	600101	CHENNAI	70	SERVICE
927	603102	CHENNAI	80	ODA
928	603103	CHENNAI	40	ODA
929	603104	CHENNAI	50	ODA
930	603106	CHENNAI	60	ODA
931	603107	CHENNAI	70	ODA
932	603108	CHENNAI	80	ODA
933	603109	CHENNAI	40	ODA
934	603110	CHENNAI	50	ODA
935	603111	CHENNAI	60	ODA
936	603201	CHENNAI	70	ODA
937	603202	CHENNAI	80	SERVICE
938	603203	CHENNAI	40	SERVICE
939	603204	CHENNAI	50	ODA
940	603209	CHENNAI	60	ODA
941	603210	CHENNAI	70	SERVICE
942	603211	CHENNAI	80	SERVICE
943	603301	CHENNAI	40	ODA
944	603302	CHENNAI	50	ODA
945	603303	CHENNAI	60	ODA
946	603304	CHENNAI	70	ODA
947	603305	CHENNAI	80	ODA
948	603306	CHENNAI	40	ODA
949	603308	CHENNAI	50	ODA
950	603310	CHENNAI	60	ODA
951	603312	CHENNAI	70	ODA
952	603313	CHENNAI	80	ODA
953	603319	CHENNAI	40	ODA
954	603401	CHENNAI	50	ODA
955	603403	CHENNAI	60	ODA
956	603406	CHENNAI	70	ODA
957	604001	VILUPPURAM	80	ODA
958	604102	VILUPPURAM	40	ODA
959	604151	VILUPPURAM	50	ODA
960	604201	VILUPPURAM	60	ODA
961	604202	VILUPPURAM	70	SERVICE
962	604204	VILUPPURAM	80	ODA
963	604205	VILUPPURAM	40	ODA
964	604206	VILUPPURAM	50	ODA
965	604207	VILUPPURAM	60	ODA
966	604208	VILUPPURAM	70	ODA
967	604301	VILUPPURAM	80	ODA
968	604302	VILUPPURAM	40	ODA
969	604303	PONDICHERRY	50	ODA
970	604304	VILUPPURAM	60	ODA
971	604307	VILUPPURAM	70	ODA
972	604403	TIRUVANNAMALAI	80	ODA
973	604406	TIRUVANNAMALAI	40	ODA
974	604407	TIRUVANNAMALAI	50	ODA
975	604408	TIRUVANNAMALAI	60	ODA
976	604410	CHENNAI	70	ODA
977	606001	VILUPPURAM	80	ODA
978	606003	VILUPPURAM	40	SERVICE
979	606102	VILUPPURAM	50	ODA
980	606104	VILUPPURAM	60	ODA
981	606105	VILUPPURAM	70	ODA
982	606106	VILUPPURAM	80	ODA
983	606107	VILUPPURAM	40	ODA
984	606109	VILUPPURAM	50	ODA
985	606111	VILUPPURAM	60	ODA
986	606115	VILUPPURAM	70	ODA
987	606201	VILUPPURAM	80	ODA
988	606202	VILUPPURAM	40	SERVICE
989	606205	VILUPPURAM	50	ODA
990	606206	VILUPPURAM	60	ODA
991	606207	VILUPPURAM	70	ODA
992	606208	VILUPPURAM	80	ODA
993	606213	VILUPPURAM	40	SERVICE
994	606301	VILUPPURAM	50	ODA
995	606303	VILUPPURAM	60	ODA
996	606304	VILUPPURAM	70	ODA
997	606401	VILUPPURAM	80	SERVICE
998	606402	VILUPPURAM	40	ODA
999	606601	TIRUVANNAMALAI	50	SERVICE
1000	606603	TIRUVANNAMALAI	60	SERVICE
1001	606604	TIRUVANNAMALAI	70	SERVICE
1002	606611	TIRUVANNAMALAI	80	SERVICE
1003	606701	TIRUVANNAMALAI	40	SERVICE
1004	606702	TIRUVANNAMALAI	50	ODA
1005	606703	TIRUVANNAMALAI	60	SERVICE
1006	606704	TIRUVANNAMALAI	70	ODA
1007	606705	TIRUVANNAMALAI	80	ODA
1008	606706	TIRUVANNAMALAI	40	ODA
1009	606707	TIRUVANNAMALAI	50	ODA
1010	606708	TIRUVANNAMALAI	60	ODA
1011	606709	TIRUVANNAMALAI	70	ODA
1012	606751	TIRUVANNAMALAI	80	ODA
1013	606752	TIRUVANNAMALAI	40	ODA
1014	606754	TIRUVANNAMALAI	50	ODA
1015	606755	TIRUVANNAMALAI	60	SERVICE
1016	606801	TIRUVANNAMALAI	70	SERVICE
1017	606802	TIRUVANNAMALAI	80	ODA
1018	606803	TIRUVANNAMALAI	40	SERVICE
1019	606804	TIRUVANNAMALAI	50	ODA
1020	606806	TIRUVANNAMALAI	60	ODA
1021	606807	TIRUVANNAMALAI	70	ODA
1022	606808	TIRUVANNAMALAI	80	SERVICE
1023	606811	TIRUVANNAMALAI	40	ODA
1024	606902	TIRUVANNAMALAI	50	ODA
1025	606903	TIRUVANNAMALAI	60	ODA
1026	606905	TIRUVANNAMALAI	70	ODA
1027	608703	CUDDALORE	80	ODA
1028	608704	CUDDALORE	40	ODA
1029	608801	CUDDALORE	50	SERVICE
1030	609001	KUMBAKONAM	60	SERVICE
1031	609003	KUMBAKONAM	70	SERVICE
1032	609101	KUMBAKONAM	80	ODA
1033	609102	KUMBAKONAM	40	ODA
1034	609105	KUMBAKONAM	50	ODA
1035	609106	KUMBAKONAM	60	ODA
1036	609110	CUDDALORE	70	ODA
1037	609111	KUMBAKONAM	80	ODA
1038	609113	KUMBAKONAM	40	ODA
1039	609114	KUMBAKONAM	50	ODA
1040	609117	KUMBAKONAM	60	ODA
1041	609202	KUMBAKONAM	70	ODA
1042	609301	KUMBAKONAM	80	ODA
1043	609303	KUMBAKONAM	40	ODA
1044	609307	KUMBAKONAM	50	ODA
1045	609309	KUMBAKONAM	60	ODA
1046	609313	KUMBAKONAM	70	ODA
1047	609403	KUMBAKONAM	80	ODA
1048	609404	KUMBAKONAM	40	ODA
1049	609405	KUMBAKONAM	50	ODA
1050	609501	KUMBAKONAM	60	ODA
1051	609503	KUMBAKONAM	70	ODA
1052	609601	KUMBAKONAM	80	ODA
1053	609602	KUMBAKONAM	40	SERVICE
1054	609605	KUMBAKONAM	50	SERVICE
1055	609606	KUMBAKONAM	60	ODA
1056	609607	KUMBAKONAM	70	ODA
1057	609608	KUMBAKONAM	80	ODA
1058	609609	KUMBAKONAM	40	ODA
1059	609703	KUMBAKONAM	50	ODA
1060	609801	KUMBAKONAM	60	SERVICE
1061	609803	KUMBAKONAM	70	SERVICE
1062	609804	KUMBAKONAM	80	ODA
1063	609806	KUMBAKONAM	40	SERVICE
1064	609807	KUMBAKONAM	50	ODA
1065	609808	KUMBAKONAM	60	ODA
1066	609810	KUMBAKONAM	70	SERVICE
1067	610001	KUMBAKONAM	80	ODA
1068	610003	KUMBAKONAM	40	ODA
1069	610004	KUMBAKONAM	50	SERVICE
1070	610005	KUMBAKONAM	60	ODA
1071	610104	KUMBAKONAM	70	ODA
1072	610105	KUMBAKONAM	80	ODA
1073	610106	KUMBAKONAM	40	ODA
1074	610109	KUMBAKONAM	50	ODA
1075	610201	KUMBAKONAM	60	ODA
1076	610202	KUMBAKONAM	70	ODA
1077	613003	TANJORE	80	SERVICE
1078	613004	TANJORE	40	SERVICE
1079	613005	TANJORE	50	SERVICE
1080	613006	TANJORE	60	SERVICE
1081	613007	TANJORE	70	SERVICE
1082	613008	TANJORE	80	SERVICE
1083	613009	TANJORE	40	SERVICE
1084	613010	TANJORE	50	SERVICE
1085	613104	TANJORE	60	SERVICE
1086	613201	TANJORE	70	ODA
1087	613202	TANJORE	80	ODA
1088	613204	TANJORE	40	SERVICE
1089	613205	TANJORE	50	SERVICE
1090	613301	TIRUCHIRAPPALLI	60	ODA
1091	613303	TANJORE	70	ODA
1092	613401	TANJORE	80	ODA
1093	613402	TANJORE	40	ODA
1094	613403	TANJORE	50	ODA
1095	613501	TANJORE	60	SERVICE
1096	613504	TANJORE	70	ODA
1097	613601	TANJORE	80	SERVICE
1098	613602	TANJORE	40	ODA
1099	613701	KUMBAKONAM	50	SERVICE
1100	613703	KUMBAKONAM	60	ODA
1101	614001	KUMBAKONAM	70	ODA
1102	614016	TANJORE	80	SERVICE
1103	614018	TANJORE	40	ODA
1104	614019	TANJORE	50	ODA
1105	614102	TANJORE	60	SERVICE
1106	614103	KUMBAKONAM	70	ODA
1107	614201	TANJORE	80	SERVICE
1108	614204	TANJORE	40	ODA
1109	614205	KUMBAKONAM	50	SERVICE
1110	614206	TANJORE	60	SERVICE
1111	614207	KUMBAKONAM	70	SERVICE
1112	614208	KUMBAKONAM	80	SERVICE
1113	614210	TANJORE	40	ODA
1114	614211	TANJORE	50	SERVICE
1115	614401	TANJORE	60	ODA
1116	614402	TANJORE	70	ODA
1117	614404	KUMBAKONAM	80	ODA
1118	614601	KUMBAKONAM	40	ODA
1119	614602	KUMBAKONAM	50	ODA
1120	614613	TANJORE	60	ODA
1121	614614	TANJORE	70	ODA
1122	614615	TANJORE	80	ODA
1123	614616	TIRUCHIRAPPALLI	40	SERVICE
1124	614618	TIRUCHIRAPPALLI	50	ODA
1125	614619	TIRUCHIRAPPALLI	60	ODA
1126	614620	TIRUCHIRAPPALLI	70	ODA
1127	620022	TIRUCHIRAPPALLI	80	SERVICE
1128	620023	TIRUCHIRAPPALLI	40	SERVICE
1129	620024	TIRUCHIRAPPALLI	50	SERVICE
1130	620025	TIRUCHIRAPPALLI	60	ODA
1131	620026	TIRUCHIRAPPALLI	70	SERVICE
1132	620101	TIRUCHIRAPPALLI	80	ODA
1133	620102	TIRUCHIRAPPALLI	40	ODA
1134	621001	TIRUCHIRAPPALLI	50	ODA
1135	621003	TIRUCHIRAPPALLI	60	ODA
1136	621005	TIRUCHIRAPPALLI	70	SERVICE
1137	621006	TIRUCHIRAPPALLI	80	ODA
1138	621009	TIRUCHIRAPPALLI	40	ODA
1139	621010	TIRUCHIRAPPALLI	50	SERVICE
1140	621011	TIRUCHIRAPPALLI	60	ODA
1141	621012	TIRUCHIRAPPALLI	70	ODA
1142	621103	TIRUCHIRAPPALLI	40	ODA
1143	621104	TIRUCHIRAPPALLI	50	ODA
1144	621105	TIRUCHIRAPPALLI	60	ODA
1145	621106	TIRUCHIRAPPALLI	70	ODA
1146	621107	TIRUCHIRAPPALLI	40	ODA
1147	621108	TIRUCHIRAPPALLI	50	ODA
1148	621109	TIRUCHIRAPPALLI	60	ODA
1149	621111	TIRUCHIRAPPALLI	70	ODA
1150	621112	TIRUCHIRAPPALLI	40	SERVICE
1151	621113	TIRUCHIRAPPALLI	50	ODA
1152	621114	TIRUCHIRAPPALLI	60	ODA
1153	621115	TIRUCHIRAPPALLI	70	ODA
1154	621116	TIRUCHIRAPPALLI	40	ODA
1155	621117	TIRUCHIRAPPALLI	50	ODA
1156	621118	TIRUCHIRAPPALLI	60	ODA
1157	621132	TIRUCHIRAPPALLI	70	ODA
1158	621203	TIRUCHIRAPPALLI	40	ODA
1159	621205	TIRUCHIRAPPALLI	50	ODA
1160	621206	TIRUCHIRAPPALLI	60	ODA
1161	621207	NAMAKKAL	70	ODA
1162	621208	TIRUCHIRAPPALLI	40	ODA
1163	621210	TIRUCHIRAPPALLI	50	ODA
1164	621211	TIRUCHIRAPPALLI	60	SERVICE
1165	621212	TIRUCHIRAPPALLI	70	ODA
1166	621213	TIRUCHIRAPPALLI	80	ODA
1167	621214	TIRUCHIRAPPALLI	40	ODA
1168	621215	NAMAKKAL	50	ODA
1169	621216	TIRUCHIRAPPALLI	60	SERVICE
1170	621217	TIRUCHIRAPPALLI	70	ODA
1171	621218	TIRUCHIRAPPALLI	80	ODA
1172	621220	TIRUCHIRAPPALLI	40	ODA
1173	621301	KARUR	50	ODA
1174	621302	TIRUCHIRAPPALLI	60	ODA
1175	621305	KARUR	70	ODA
1176	621306	TIRUCHIRAPPALLI	80	SERVICE
1177	622422	TIRUCHIRAPPALLI	40	ODA
1178	622501	TIRUCHIRAPPALLI	50	ODA
1179	622502	TIRUCHIRAPPALLI	60	ODA
1180	622504	TIRUCHIRAPPALLI	70	ODA
1181	622505	TIRUCHIRAPPALLI	80	ODA
1182	622507	TIRUCHIRAPPALLI	40	ODA
1183	622515	TIRUCHIRAPPALLI	50	ODA
1184	623115	RAMNAD	60	ODA
1185	623120	RAMNAD	70	ODA
1186	623135	RAMNAD	80	ODA
1187	623308	RAMNAD	40	ODA
1188	623315	RAMNAD	50	ODA
1189	623401	RAMNAD	60	ODA
1190	623402	RAMNAD	70	ODA
1191	623403	RAMNAD	80	ODA
1192	623406	RAMNAD	40	ODA
1193	623407	RAMNAD	50	SERVICE
1194	623409	RAMNAD	60	SERVICE
1195	623501	RAMNAD	70	SERVICE
1196	623502	RAMNAD	80	SERVICE
1197	623502	PARAMKUDI	40	SERVICE
1198	623503	PARAMKUDI	50	SERVICE
1199	623503	RAMNAD	60	ODA
1200	623504	PARAMKUDI	70	SERVICE
1201	623512	RAMNAD	80	ODA
1202	623513	RAMNAD	40	ODA
1203	623514	RAMNAD	50	ODA
1204	623516	RAMNAD	60	ODA
1205	623517	RAMNAD	70	SERVICE
1206	623518	RAMNAD	80	SERVICE
1207	623519	RAMNAD	40	SERVICE
1208	623520	RAMNAD	50	SERVICE
1209	623521	RAMNAD	60	ODA
1210	623523	RAMNAD	70	ODA
1211	623524	RAMNAD	80	ODA
1212	623525	RAMNAD	40	ODA
1213	623526	RAMNAD	50	SERVICE
1214	623527	RAMNAD	60	ODA
1215	623528	RAMNAD	70	ODA
1216	623529	RAMNAD	80	ODA
1217	623530	RAMNAD	40	ODA
1218	623531	RAMNAD	50	ODA
1219	623532	RAMNAD	60	SERVICE
1220	623534	RAMNAD	70	SERVICE
1221	623536	RAMNAD	80	ODA
1222	623537	RAMNAD	40	ODA
1223	623601	RAMNAD	50	ODA
1224	623603	RAMNAD	60	SERVICE
1225	623605	RAMNAD	70	ODA
1226	623608	RAMNAD	80	ODA
1227	624709	DINDIGUL	40	ODA
1228	624710	DINDIGUL	50	SERVICE
1229	624712	DINDIGUL	60	ODA
1230	624802	DINDIGUL	70	ODA
1231	625001	MADURAI	80	SERVICE
1232	625002	MADURAI	40	SERVICE
1233	625003	MADURAI	50	SERVICE
1234	625004	MADURAI	60	SERVICE
1235	625005	KAPPALUR - MADURAI	70	SERVICE
1236	625006	KAPPALUR - MADURAI	80	SERVICE
1237	625007	MADURAI	40	SERVICE
1238	625008	KAPPALUR - MADURAI	50	SERVICE
1239	625009	MADURAI	60	SERVICE
1240	625010	MADURAI	70	SERVICE
1241	625011	MADURAI	80	SERVICE
1242	625012	MADURAI	40	SERVICE
1243	625014	MADURAI	50	SERVICE
1244	625015	MADURAI	60	SERVICE
1245	625016	MADURAI	70	SERVICE
1246	625017	MADURAI	80	SERVICE
1247	625018	MADURAI	40	SERVICE
1248	625019	MADURAI	50	SERVICE
1249	625020	MADURAI	60	SERVICE
1250	625021	MADURAI	70	SERVICE
1251	625022	MADURAI	80	SERVICE
1252	625023	MADURAI	40	SERVICE
1253	625101	MADURAI	50	ODA
1254	625102	MADURAI	60	ODA
1255	625103	MADURAI	70	ODA
1256	625104	MADURAI	80	SERVICE
1257	625105	MADURAI	40	ODA
1258	625106	MADURAI	50	SERVICE
1259	625107	MADURAI	60	SERVICE
1260	625109	MADURAI	70	ODA
1261	625118	KAPPALUR - MADURAI	80	ODA
1262	625122	MADURAI	40	SERVICE
1263	625201	MADURAI	50	ODA
1264	625207	MADURAI	60	ODA
1265	625214	MADURAI	70	SERVICE
1266	625218	MADURAI	80	SERVICE
1267	625221	MADURAI	40	ODA
1268	625234	MADURAI	50	ODA
1269	625301	MADURAI	60	SERVICE
1270	625402	MADURAI	70	SERVICE
1271	625501	MADURAI	80	SERVICE
1272	625503	MADURAI	40	ODA
1273	625512	THENI	50	SERVICE
1274	625513	THENI	60	SERVICE
1275	625514	MADURAI	70	SERVICE
1276	625515	THENI	80	ODA
1277	626129	VIRUDHUNAGAR	40	ODA
1278	626130	SIVAKASI	50	SERVICE
1279	626131	SIVAKASI	60	ODA
1280	626132	RAJAPALAYAM	70	ODA
1281	626135	RAJAPALAYAM	80	SERVICE
1282	626137	VIRUDHUNAGAR	40	ODA
1283	626138	VIRUDHUNAGAR	50	ODA
1284	626139	RAJAPALAYAM	60	SERVICE
1285	626141	VIRUDHUNAGAR	70	ODA
1286	626142	RAJAPALAYAM	80	SERVICE
1287	626149	RAJAPALAYAM	40	ODA
1288	626188	RAJAPALAYAM	50	SERVICE
1289	626189	SIVAKASI	60	SERVICE
1290	626201	SATTUR	70	ODA
1291	626201	SATTUR	80	ODA
1292	626203	SATTUR	40	SERVICE
1293	626204	VIRUDHUNAGAR	50	SERVICE
1294	626612	VIRUDHUNAGAR	60	ODA
1295	627001	TIRUNELVELI	70	SERVICE
1296	627002	TIRUNELVELI	80	SERVICE
1297	627003	TIRUNELVELI	40	SERVICE
1298	627004	TIRUNELVELI	50	SERVICE
1299	627005	TIRUNELVELI	60	SERVICE
1300	627006	TIRUNELVELI	70	SERVICE
1301	627007	TIRUNELVELI	80	SERVICE
1302	627008	TIRUNELVELI	40	ODA
1303	627009	TIRUNELVELI	50	SERVICE
1304	627010	TIRUNELVELI	60	ODA
1305	627011	TIRUNELVELI	70	SERVICE
1306	627012	TIRUNELVELI	80	SERVICE
1307	627101	TIRUNELVELI	40	ODA
1308	627103	TIRUNELVELI	50	ODA
1309	627105	TIRUNELVELI	60	ODA
1310	627106	TIRUNELVELI	70	ODA
1311	627107	TIRUNELVELI	80	ODA
1312	627108	TIRUNELVELI	40	ODA
1313	627109	TIRUNELVELI	50	ODA
1314	627110	TIRUNELVELI	60	ODA
1315	627111	TIRUNELVELI	70	ODA
1316	627112	TIRUNELVELI	80	ODA
1317	627113	TIRUNELVELI	40	ODA
1318	627114	TIRUNELVELI	50	ODA
1319	627116	TIRUNELVELI	60	ODA
1320	627117	TIRUNELVELI	70	ODA
1321	627119	TIRUNELVELI	80	ODA
1322	627120	TIRUNELVELI	40	ODA
1323	627124	TIRUNELVELI	50	ODA
1324	627127	TIRUNELVELI	60	ODA
1325	627133	TIRUNELVELI	70	ODA
1326	627151	TIRUNELVELI	80	ODA
1327	627808	TIRUNELVELI	40	ODA
1328	627809	TIRUNELVELI	50	SERVICE
1329	627811	TIRUNELVELI	60	SERVICE
1330	627812	TIRUNELVELI	70	ODA
1331	627814	TIRUNELVELI	80	SERVICE
1332	627818	TIRUNELVELI	40	ODA
1333	627851	TIRUNELVELI	50	SERVICE
1334	627852	TIRUNELVELI	60	SERVICE
1335	627853	TIRUNELVELI	70	ODA
1336	627854	TIRUNELVELI	80	ODA
1337	627855	TIRUNELVELI	40	SERVICE
1338	627856	TIRUNELVELI	50	ODA
1339	627857	TIRUNELVELI	60	ODA
1340	627859	TIRUNELVELI	70	ODA
1341	627860	TIRUNELVELI	80	ODA
1342	627862	TIRUNELVELI	40	ODA
1343	627951	TIRUNELVELI	50	ODA
1344	627953	TIRUNELVELI	60	ODA
1345	628001	THOOTHUKUDI	70	SERVICE
1346	628002	THOOTHUKUDI	80	SERVICE
1347	628003	THOOTHUKUDI	40	SERVICE
1348	628004	THOOTHUKUDI	50	SERVICE
1349	628005	THOOTHUKUDI	60	SERVICE
1350	628006	THOOTHUKUDI	70	SERVICE
1351	628007	THOOTHUKUDI	80	SERVICE
1352	628008	THOOTHUKUDI	40	SERVICE
1353	628101	THOOTHUKUDI	50	SERVICE
1354	628102	THOOTHUKUDI	60	SERVICE
1355	628103	THOOTHUKUDI	70	ODA
1356	628104	THOOTHUKUDI	80	ODA
1357	628151	THOOTHUKUDI	40	ODA
1358	628152	THOOTHUKUDI	50	ODA
1359	628202	THOOTHUKUDI	60	ODA
1360	628203	THOOTHUKUDI	70	ODA
1361	628204	THOOTHUKUDI	80	ODA
1362	628208	THOOTHUKUDI	40	ODA
1363	628210	THOOTHUKUDI	50	ODA
1364	628213	THOOTHUKUDI	60	ODA
1365	628215	THOOTHUKUDI	70	SERVICE
1366	628216	KOVILPATTI	80	ODA
1367	628217	THOOTHUKUDI	40	ODA
1368	628229	THOOTHUKUDI	50	ODA
1369	628251	THOOTHUKUDI	60	ODA
1370	628252	TIRUNELVELI	70	ODA
1371	628303	TIRUNELVELI	80	ODA
1372	628401	THOOTHUKUDI	40	ODA
1373	628402	THOOTHUKUDI	50	ODA
1374	628501	KOVILPATTI	60	SERVICE
1375	628502	KOVILPATTI	70	SERVICE
1376	628503	KOVILPATTI	80	SERVICE
1377	629168	NAGARKOVIL	40	SERVICE
1378	629169	NAGARKOVIL	50	SERVICE
1379	629170	NAGARKOVIL	60	SERVICE
1380	629171	NAGARKOVIL	70	SERVICE
1381	629172	NAGARKOVIL	80	SERVICE
1382	629173	NAGARKOVIL	40	ODA
1383	629174	NAGARKOVIL	50	SERVICE
1384	629175	NAGARKOVIL	60	SERVICE
1385	629176	NAGARKOVIL	70	ODA
1386	629177	NAGARKOVIL	80	SERVICE
1387	629179	NAGARKOVIL	40	SERVICE
1388	629180	NAGARKOVIL	50	ODA
1389	629191	NAGARKOVIL	60	ODA
1390	629193	NAGARKOVIL	70	ODA
1391	629201	NAGARKOVIL	80	SERVICE
1392	629202	NAGARKOVIL	40	ODA
1393	629203	NAGARKOVIL	50	SERVICE
1394	629204	NAGARKOVIL	60	ODA
1395	629251	NAGARKOVIL	70	ODA
1396	629252	NAGARKOVIL	80	ODA
1397	629301	NAGARKOVIL	40	SERVICE
1398	629302	NAGARKOVIL	50	SERVICE
1399	629401	NAGARKOVIL	60	SERVICE
1400	629402	NAGARKOVIL	70	ODA
1401	629403	NAGARKOVIL	80	SERVICE
1402	629501	NAGARKOVIL	40	SERVICE
1403	629502	NAGARKOVIL	50	SERVICE
1404	629601	NAGARKOVIL	60	SERVICE
1405	629602	NAGARKOVIL	70	ODA
1406	629701	NAGARKOVIL	80	SERVICE
1407	629702	NAGARKOVIL	40	SERVICE
1408	629703	NAGARKOVIL	50	ODA
1409	629704	NAGARKOVIL	60	SERVICE
1410	629801	NAGARKOVIL	70	SERVICE
1411	629802	NAGARKOVIL	80	SERVICE
1412	629804	NAGARKOVIL	40	ODA
1413	629809	NAGARKOVIL	50	ODA
1414	629810	NAGARKOVIL	60	SERVICE
1415	629851	NAGARKOVIL	70	ODA
1416	629852	NAGARKOVIL	80	SERVICE
1417	629901	NAGARKOVIL	40	SERVICE
1418	630001	KARAIKUDI	50	SERVICE
1419	630002	KARAIKUDI	60	SERVICE
1420	630003	KARAIKUDI	70	SERVICE
1421	630004	KARAIKUDI	80	SERVICE
1422	630005	KARAIKUDI	40	ODA
1423	630103	TIRUCHIRAPPALLI	50	ODA
1424	630104	TIRUCHIRAPPALLI	60	ODA
1425	630106	TIRUCHIRAPPALLI	70	ODA
1426	630107	TIRUCHIRAPPALLI	80	ODA
1427	631203	CHENNAI	40	ODA
1428	631204	CHENNAI	50	ODA
1429	631205	CHENNAI	60	ODA
1430	631207	CHENNAI	70	ODA
1431	631208	CHENNAI	80	ODA
1432	631209	CHENNAI	40	ODA
1433	631210	CHENNAI	50	ODA
1434	631301	CHENNAI	60	ODA
1435	631302	CHENNAI	70	ODA
1436	631303	CHENNAI	80	ODA
1437	631402	CHENNAI	40	ODA
1438	631501	CHENNAI	50	ODA
1439	631502	CHENNAI	60	SERVICE
1440	631551	CHENNAI	70	ODA
1441	631552	CHENNAI	80	ODA
1442	631561	CHENNAI	40	ODA
1443	631601	CHENNAI	50	ODA
1444	631604	CHENNAI	60	ODA
1445	631605	CHENNAI	70	ODA
1446	631701	TIRUVANNAMALAI	80	ODA
1447	631702	TIRUVANNAMALAI	40	ODA
1448	632001	VELLORE	50	SERVICE
1449	632002	VELLORE	60	SERVICE
1450	632004	VELLORE	70	SERVICE
1451	632006	VELLORE	80	SERVICE
1452	632007	VELLORE	40	SERVICE
1453	632008	VELLORE	50	SERVICE
1454	632009	VELLORE	60	SERVICE
1455	632010	VELLORE	70	SERVICE
1456	632011	VELLORE	80	ODA
1457	632012	VELLORE	40	SERVICE
1458	632013	VELLORE	50	SERVICE
1459	632014	VELLORE	60	SERVICE
1460	632055	VELLORE	70	SERVICE
1461	632057	VELLORE	80	SERVICE
1462	632058	VELLORE	40	SERVICE
1463	632059	VELLORE	50	ODA
1464	632101	VELLORE	60	ODA
1465	632102	VELLORE	70	ODA
1466	632103	VELLORE	80	ODA
1467	632104	VELLORE	40	ODA
1468	632105	VELLORE	50	ODA
1469	632106	VELLORE	60	ODA
1470	632107	VELLORE	70	ODA
1471	632114	VELLORE	80	SERVICE
1472	632115	VELLORE	40	ODA
1473	632201	VELLORE	50	ODA
1474	632202	VELLORE	60	ODA
1475	632204	VELLORE	70	ODA
1476	632301	VELLORE	80	SERVICE
1477	635120	KRISHNAGIRI	40	SERVICE
1478	635121	KRISHNAGIRI	50	ODA
1479	635122	KRISHNAGIRI	60	ODA
1480	635123	KRISHNAGIRI	70	ODA
1481	635126	HOSUR	80	SERVICE
1482	635201	KRISHNAGIRI	40	ODA
1483	635202	DHARMAPURI	50	ODA
1484	635203	KRISHNAGIRI	60	ODA
1485	635204	KRISHNAGIRI	70	ODA
1486	635205	DHARMAPURI	80	ODA
1487	635206	DHARMAPURI	40	ODA
1488	635207	DHARMAPURI	50	ODA
1489	635301	DHARMAPURI	60	ODA
1490	635303	DHARMAPURI	70	ODA
1491	635304	KRISHNAGIRI	80	ODA
1492	635305	DHARMAPURI	40	ODA
1493	635307	TIRUVANNAMALAI	50	ODA
1494	635601	VELLORE	60	ODA
1495	635602	VELLORE	70	SERVICE
1496	635651	VELLORE	80	ODA
1497	635652	VELLORE	40	ODA
1498	635653	VELLORE	50	ODA
1499	635654	VELLORE	60	ODA
1500	635701	VELLORE	70	ODA
1501	635702	VELLORE	80	ODA
1502	635703	TIRUVANNAMALAI	40	ODA
1503	635710	VELLORE	50	ODA
1504	635751	VELLORE	60	ODA
1505	635752	VELLORE	70	ODA
1506	635754	VELLORE	80	ODA
1507	635801	VELLORE	40	ODA
1508	635802	VELLORE	50	ODA
1509	635803	VELLORE	60	SERVICE
1510	635804	VELLORE	70	ODA
1511	635805	VELLORE	80	ODA
1512	635806	VELLORE	40	ODA
1513	635807	VELLORE	50	ODA
1514	635808	VELLORE	60	ODA
1515	635809	VELLORE	70	ODA
1516	635810	VELLORE	80	ODA
1517	635812	VELLORE	40	ODA
1518	635814	VELLORE	50	ODA
1519	635851	VELLORE	60	ODA
1520	635852	VELLORE	70	ODA
1521	635853	VELLORE	40	ODA
1522	635901	VELLORE	50	ODA
1523	636001	SALEM	60	SERVICE
1524	636002	SALEM	70	SERVICE
1525	636003	SALEM	40	SERVICE
1526	636004	SALEM	50	SERVICE
1527	636352	DHARMAPURI	60	ODA
1528	636401	SALEM	70	SERVICE
1529	636402	SALEM	40	SERVICE
1530	636403	SALEM	50	ODA
1531	636404	SALEM	60	ODA
1532	636406	SALEM	70	SERVICE
1533	636451	SALEM	40	ODA
1534	636453	SALEM	50	ODA
1535	636455	SALEM	60	ODA
1536	636456	SALEM	70	SERVICE
1537	636457	SALEM	40	ODA
1538	636501	SALEM	50	ODA
1539	636502	SALEM	60	ODA
1540	636601	SALEM	70	ODA
1541	636701	DHARMAPURI	40	SERVICE
1542	636702	DHARMAPURI	50	SERVICE
1543	636704	DHARMAPURI	60	ODA
1544	636705	DHARMAPURI	70	SERVICE
1545	636803	DHARMAPURI	80	ODA
1546	636804	DHARMAPURI	40	ODA
1547	636806	DHARMAPURI	50	ODA
1548	636807	DHARMAPURI	60	ODA
1549	636808	DHARMAPURI	70	ODA
1550	636809	DHARMAPURI	80	ODA
1551	636810	DHARMAPURI	40	ODA
1552	636811	DHARMAPURI	50	ODA
1553	636812	DHARMAPURI	60	ODA
1554	636902	DHARMAPURI	70	ODA
1555	636903	DHARMAPURI	80	ODA
1556	636905	DHARMAPURI	40	ODA
1557	636906	DHARMAPURI	50	ODA
1558	637001	NAMAKKAL	60	SERVICE
1559	637002	NAMAKKAL	70	SERVICE
1560	637003	NAMAKKAL	80	SERVICE
1561	637013	NAMAKKAL	40	ODA
1562	637014	NAMAKKAL	50	ODA
1563	637015	NAMAKKAL	60	ODA
1564	637017	NAMAKKAL	70	ODA
1565	637018	NAMAKKAL	80	ODA
1566	637019	NAMAKKAL	40	ODA
1567	637020	NAMAKKAL	50	ODA
1568	637021	NAMAKKAL	60	ODA
1569	637101	SALEM	70	SERVICE
1570	637102	SALEM	80	ODA
1571	637103	SALEM	40	ODA
1572	637104	SALEM	50	ODA
1573	637107	SALEM	60	ODA
1574	637201	NAMAKKAL	70	ODA
1575	637202	NAMAKKAL	80	ODA
1576	637203	NAMAKKAL	40	ODA
1577	638311	ERODE	50	ODA
1578	638313	ERODE	60	ODA
1579	638316	ERODE	70	SERVICE
1580	638401	ERODE	80	SERVICE
1581	638402	ERODE	40	ODA
1582	638451	ERODE	50	ODA
1583	638452	ERODE	60	SERVICE
1584	638455	ERODE	70	ODA
1585	638458	ERODE	80	ODA
1586	638459	ERODE	40	ODA
1587	638461	ERODE	50	ODA
1588	638476	ERODE	60	SERVICE
1589	638501	ERODE	70	ODA
1590	638504	ERODE	80	ODA
1591	638506	ERODE	40	ODA
1592	638656	TIRUPPUR	50	ODA
1593	638657	TIRUPPUR	60	ODA
1594	638660	TIRUPPUR	70	ODA
1595	638673	TIRUPPUR	80	ODA
1596	638701	TIRUPPUR	40	SERVICE
1597	638702	TIRUPPUR	50	ODA
1598	638752	TIRUPPUR	60	SERVICE
1599	639001	KARUR	70	SERVICE
1600	639002	KARUR	80	SERVICE
1601	639003	KARUR - TPT HUB	40	SERVICE
1602	639004	KARUR	50	SERVICE
1603	639005	KARUR	60	SERVICE
1604	639006	KARUR	70	SERVICE
1605	639007	KARUR	80	SERVICE
1606	639008	KARUR	40	SERVICE
1607	639102	KARUR	50	SERVICE
1608	639104	KARUR	60	SERVICE
1609	639105	KARUR	70	ODA
1610	639108	KARUR	80	SERVICE
1611	639109	KARUR	40	ODA
1612	639110	KARUR	50	ODA
1613	639111	KARUR	60	SERVICE
1614	639112	TIRUCHIRAPPALLI	70	ODA
1615	639113	KARUR	80	SERVICE
1616	639114	KARUR	40	ODA
1617	639116	KARUR	50	SERVICE
1618	639117	KARUR	60	SERVICE
1619	639118	KARUR	70	ODA
1620	639119	KARUR	80	ODA
1621	639120	KARUR	40	ODA
1622	639136	KARUR	50	SERVICE
1623	639201	KARUR	60	SERVICE
1624	639202	TIRUPPUR	70	ODA
1625	639205	KARUR	80	ODA
1626	639206	KARUR	40	ODA
1627	641062	COIMBATORE	50	SERVICE
1628	641101	COIMBATORE	60	ODA
1629	641103	COIMBATORE	70	SERVICE
1630	641104	COIMBATORE	80	SERVICE
1631	641105	COIMBATORE	40	SERVICE
1632	641106	COIMBATORE	50	ODA
1633	641107	COIMBATORE	60	SERVICE
1634	641108	COIMBATORE	70	ODA
1635	641110	COIMBATORE	80	SERVICE
1636	641113	COIMBATORE	40	ODA
1637	641201	COIMBATORE	50	SERVICE
1638	641301	COIMBATORE	60	SERVICE
1639	641302	COIMBATORE	70	ODA
1640	641305	COIMBATORE	80	ODA
1641	641401	COIMBATORE	40	SERVICE
1642	641402	COIMBATORE	50	SERVICE
1643	641601	TIRUPPUR	60	SERVICE
1644	641602	TIRUPPUR	70	SERVICE
1645	641603	TIRUPPUR	80	SERVICE
1646	641604	TIRUPPUR	40	SERVICE
1647	641605	TIRUPPUR	50	SERVICE
1648	641606	TIRUPPUR	60	SERVICE
1649	641607	TIRUPPUR	70	SERVICE
1650	641608	TIRUPPUR	80	SERVICE
1651	641652	TIRUPPUR	40	SERVICE
1652	641653	COIMBATORE	50	SERVICE
1653	641654	TIRUPPUR	60	SERVICE
1654	641659	COIMBATORE	70	ODA
1655	641662	TIRUPPUR	80	ODA
1656	641663	TIRUPPUR	40	SERVICE
1657	641664	TIRUPPUR	50	SERVICE
1658	641666	TIRUPPUR	60	SERVICE
1659	641667	TIRUPPUR	70	ODA
1660	641668	COIMBATORE	80	SERVICE
1661	641687	TIRUPPUR	40	SERVICE
1662	641697	TIRUPPUR	50	ODA
1663	642001	COIMBATORE	60	SERVICE
1664	642002	COIMBATORE	70	SERVICE
1665	642003	COIMBATORE	80	SERVICE
1666	642004	COIMBATORE	40	ODA
1667	642005	COIMBATORE	50	ODA
1668	642006	COIMBATORE	60	SERVICE
1669	642107	COIMBATORE	70	ODA
1670	642109	COIMBATORE	80	ODA
1671	642110	COIMBATORE	40	SERVICE
1672	642126	COIMBATORE	50	ODA
1673	642126	TIRUPPUR	60	ODA
1674	642128	COIMBATORE	70	SERVICE
1675	642129	COIMBATORE	80	ODA
1676	642130	COIMBATORE	40	ODA
1677	560039	BANGALORE	50	SERVICE
1678	560040	BANGALORE	60	SERVICE
1679	560041	BANGALORE	70	SERVICE
1680	560042	BANGALORE	80	SERVICE
1681	560043	BANGALORE	40	SERVICE
1682	560044	BANGALORE	50	SERVICE
1683	560045	BANGALORE	60	SERVICE
1684	560046	BANGALORE	70	SERVICE
1685	560047	BANGALORE	80	SERVICE
1686	560048	BANGALORE	40	SERVICE
1687	560049	BANGALORE	50	SERVICE
1688	560050	BANGALORE	60	SERVICE
1689	560051	BANGALORE	70	SERVICE
1690	560052	BANGALORE	80	SERVICE
1691	560053	BANGALORE	40	SERVICE
1692	560054	BANGALORE	50	SERVICE
1693	560055	BANGALORE	60	SERVICE
1694	560056	BANGALORE	70	SERVICE
1695	560057	BANGALORE	80	SERVICE
1696	560058	BANGALORE	40	SERVICE
1697	560059	BANGALORE	50	SERVICE
1698	560060	BANGALORE	60	SERVICE
1699	560061	BANGALORE	70	SERVICE
1700	560062	BANGALORE	80	SERVICE
1701	560063	BANGALORE	40	SERVICE
1702	560064	BANGALORE	50	SERVICE
1703	560065	BANGALORE	60	SERVICE
1704	560066	BANGALORE	70	SERVICE
1705	560067	BANGALORE	80	SERVICE
1706	560068	BANGALORE	40	SERVICE
1707	560069	BANGALORE	50	SERVICE
1708	560070	BANGALORE	60	SERVICE
1709	560071	BANGALORE	70	SERVICE
1710	560072	BANGALORE	80	SERVICE
1711	560073	BANGALORE	40	SERVICE
1712	560074	BANGALORE	50	ODA
1713	560075	BANGALORE	60	SERVICE
1714	560076	BANGALORE	70	SERVICE
1715	560077	BANGALORE	80	SERVICE
1716	560078	BANGALORE	40	SERVICE
1717	560079	BANGALORE	50	SERVICE
1718	560080	BANGALORE	60	SERVICE
1719	560081	BANGALORE	70	SERVICE
1720	560082	BANGALORE	80	SERVICE
1721	560083	BANGALORE	40	SERVICE
1722	560084	BANGALORE	50	SERVICE
1723	560085	BANGALORE	60	SERVICE
1724	560086	BANGALORE	70	SERVICE
1725	560087	BANGALORE	80	SERVICE
1726	560088	BANGALORE	40	SERVICE
652	636006	SALEM	70	SERVICE
\.


--
-- Data for Name: operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operations (operationid, operationname) FROM stdin;
1	Sales
2	PurchaseOrder
3	StockAdjustment
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (orderdetailid, orderid, productid, quantity, producttotal, operationid, createdat, modifiedat) FROM stdin;
44	36	5	1	60	1	2024-01-31 13:25:25.044752	2024-01-31 13:25:25.044752
45	37	14	1	60	1	2024-01-31 13:34:35.180167	2024-01-31 13:34:35.180167
46	38	9	2	120	1	2024-01-31 13:41:54.338636	2024-01-31 13:41:54.338636
47	39	15	1	60	1	2024-01-31 13:43:06.543408	2024-01-31 13:43:06.543408
48	40	13	1	60	1	2024-01-31 13:51:25.064021	2024-01-31 13:51:25.064021
49	41	10	1	60	1	2024-01-31 14:03:31.546866	2024-01-31 14:03:31.546866
50	42	22	1	40	1	2024-01-31 14:07:26.460025	2024-01-31 14:07:26.460025
51	43	7	1	60	1	2024-01-31 14:17:32.034586	2024-01-31 14:17:32.034586
52	44	15	1	60	1	2024-01-31 14:21:08.398757	2024-01-31 14:21:08.398757
53	45	12	1	60	1	2024-01-31 14:22:46.625329	2024-01-31 14:22:46.625329
54	46	12	1	60	1	2024-01-31 14:38:55.8313	2024-01-31 14:38:55.8313
55	47	15	1	60	1	2024-01-31 15:39:51.22417	2024-01-31 15:39:51.22417
56	48	15	1	60	1	2024-01-31 16:15:56.92842	2024-01-31 16:15:56.92842
57	49	10	2	150	1	2024-01-31 16:16:28.997152	2024-01-31 16:16:28.997152
58	49	12	1	100	1	2024-01-31 16:16:28.997152	2024-01-31 16:16:28.997152
59	50	8	1	60	1	2024-01-31 16:17:24.621152	2024-01-31 16:17:24.621152
60	51	14	5	300	1	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233
61	51	12	1	60	1	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233
62	51	16	1	60	1	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233
63	52	38	2	580	1	2024-01-31 16:24:22.449124	2024-01-31 16:24:22.449124
64	53	3	3	390	1	2024-01-31 16:27:33.917751	2024-01-31 16:27:33.917751
65	54	36	2	312	1	2024-01-31 16:30:29.855378	2024-01-31 16:30:29.855378
66	55	29	2	188	1	2024-01-31 16:32:30.286716	2024-01-31 16:32:30.286716
67	56	12	3	180	1	2024-01-31 16:39:01.912742	2024-01-31 16:39:01.912742
68	57	18	1	40	1	2024-01-31 16:41:17.87006	2024-01-31 16:41:17.87006
69	58	6	1	60	1	2024-01-31 17:18:06.92296	2024-01-31 17:18:06.92296
70	58	7	5	300	1	2024-01-31 17:18:06.92296	2024-01-31 17:18:06.92296
71	59	11	2	150	1	2024-01-31 18:00:51.866227	2024-01-31 18:00:51.866227
72	59	13	1	100	1	2024-01-31 18:00:51.866227	2024-01-31 18:00:51.866227
73	61	11	2	150	1	2024-01-31 18:04:50.438945	2024-01-31 18:04:50.438945
74	61	13	1	100	1	2024-01-31 18:04:50.438945	2024-01-31 18:04:50.438945
75	62	32	2	232	1	2024-01-31 18:10:32.968422	2024-01-31 18:10:32.968422
76	62	14	3	180	1	2024-01-31 18:10:32.968422	2024-01-31 18:10:32.968422
77	63	11	2	150	1	2024-01-31 18:11:00.837453	2024-01-31 18:11:00.837453
78	63	13	1	100	1	2024-01-31 18:11:00.837453	2024-01-31 18:11:00.837453
79	64	11	2	150	1	2024-01-31 18:11:45.754499	2024-01-31 18:11:45.754499
80	64	13	1	100	1	2024-01-31 18:11:45.754499	2024-01-31 18:11:45.754499
81	65	11	2	150	1	2024-01-31 18:18:14.670897	2024-01-31 18:18:14.670897
82	65	13	1	100	1	2024-01-31 18:18:14.670897	2024-01-31 18:18:14.670897
83	66	15	1	60	1	2024-01-31 18:19:56.438735	2024-01-31 18:19:56.438735
84	67	10	2	150	1	2024-01-31 18:23:44.994567	2024-01-31 18:23:44.994567
85	67	12	1	100	1	2024-01-31 18:23:44.994567	2024-01-31 18:23:44.994567
86	68	10	2	150	1	2024-01-31 18:28:32.214013	2024-01-31 18:28:32.214013
87	68	12	1	100	1	2024-01-31 18:28:32.214013	2024-01-31 18:28:32.214013
88	69	10	2	150	1	2024-01-31 18:49:02.148503	2024-01-31 18:49:02.148503
89	69	12	1	100	1	2024-01-31 18:49:02.148503	2024-01-31 18:49:02.148503
90	70	14	1	60	1	2024-01-31 18:54:57.389272	2024-01-31 18:54:57.389272
91	70	37	1	178	1	2024-01-31 18:54:57.389272	2024-01-31 18:54:57.389272
92	71	14	1	60	1	2024-01-31 18:56:27.676308	2024-01-31 18:56:27.676308
93	71	37	1	178	1	2024-01-31 18:56:27.676308	2024-01-31 18:56:27.676308
94	72	14	1	60	1	2024-01-31 19:01:30.393518	2024-01-31 19:01:30.393518
95	72	37	1	178	1	2024-01-31 19:01:30.393518	2024-01-31 19:01:30.393518
96	73	14	1	60	1	2024-01-31 19:03:54.565679	2024-01-31 19:03:54.565679
97	73	37	1	178	1	2024-01-31 19:03:54.565679	2024-01-31 19:03:54.565679
98	74	14	1	60	1	2024-01-31 19:07:31.256575	2024-01-31 19:07:31.256575
99	74	37	1	178	1	2024-01-31 19:07:31.256575	2024-01-31 19:07:31.256575
100	75	14	1	60	1	2024-01-31 19:08:51.000588	2024-01-31 19:08:51.000588
101	75	37	1	178	1	2024-01-31 19:08:51.000588	2024-01-31 19:08:51.000588
102	76	6	3	180	1	2024-01-31 19:10:14.316005	2024-01-31 19:10:14.316005
103	77	6	3	180	1	2024-01-31 19:13:00.775758	2024-01-31 19:13:00.775758
104	78	6	3	180	1	2024-01-31 19:15:01.938709	2024-01-31 19:15:01.938709
105	79	10	1	60	1	2024-01-31 19:16:49.959315	2024-01-31 19:16:49.959315
106	80	10	1	60	1	2024-01-31 19:19:32.057068	2024-01-31 19:19:32.057068
107	81	5	1	60	1	2024-01-31 19:21:57.683634	2024-01-31 19:21:57.683634
108	82	5	1	60	1	2024-01-31 19:27:44.135391	2024-01-31 19:27:44.135391
109	83	5	1	60	1	2024-01-31 19:28:10.64127	2024-01-31 19:28:10.64127
110	84	40	2	400	1	2024-01-31 19:31:12.89215	2024-01-31 19:31:12.89215
111	85	14	1	60	1	2024-01-31 19:40:27.68758	2024-01-31 19:40:27.68758
112	85	37	1	178	1	2024-01-31 19:40:27.68758	2024-01-31 19:40:27.68758
113	86	14	1	60	1	2024-01-31 19:40:55.422916	2024-01-31 19:40:55.422916
114	86	37	1	178	1	2024-01-31 19:40:55.422916	2024-01-31 19:40:55.422916
115	87	14	1	60	1	2024-01-31 19:41:28.080287	2024-01-31 19:41:28.080287
116	87	37	1	178	1	2024-01-31 19:41:28.080287	2024-01-31 19:41:28.080287
117	88	14	1	60	1	2024-01-31 19:42:00.862695	2024-01-31 19:42:00.862695
118	88	37	1	178	1	2024-01-31 19:42:00.862695	2024-01-31 19:42:00.862695
119	89	14	1	60	1	2024-01-31 19:42:21.634509	2024-01-31 19:42:21.634509
120	89	37	1	178	1	2024-01-31 19:42:21.634509	2024-01-31 19:42:21.634509
121	90	12	1	60	1	2024-01-31 19:45:08.326484	2024-01-31 19:45:08.326484
122	91	14	1	60	1	2024-01-31 19:51:13.721349	2024-01-31 19:51:13.721349
123	91	37	1	178	1	2024-01-31 19:51:13.721349	2024-01-31 19:51:13.721349
124	92	14	1	60	1	2024-01-31 19:51:23.844129	2024-01-31 19:51:23.844129
125	92	37	1	178	1	2024-01-31 19:51:23.844129	2024-01-31 19:51:23.844129
126	93	40	3	600	1	2024-01-31 20:10:24.551665	2024-01-31 20:10:24.551665
127	94	5	2	120	1	2024-01-31 20:16:23.463082	2024-01-31 20:16:23.463082
128	95	1	2	210	1	2024-01-31 20:26:23.301334	2024-01-31 20:26:23.301334
129	96	2	2	226	1	2024-01-31 20:28:27.709685	2024-01-31 20:28:27.709685
130	10000001	11	2	150	1	2024-02-01 10:36:21.872417	2024-02-01 10:36:21.872417
131	10000001	13	1	100	1	2024-02-01 10:36:21.872417	2024-02-01 10:36:21.872417
132	10000002	31	2	150	1	2024-02-01 10:38:03.394495	2024-02-01 10:38:03.394495
133	10000002	32	1	100	1	2024-02-01 10:38:03.394495	2024-02-01 10:38:03.394495
134	10000003	14	1	60	1	2024-02-01 10:41:16.085515	2024-02-01 10:41:16.085515
135	10000003	37	1	178	1	2024-02-01 10:41:16.085515	2024-02-01 10:41:16.085515
136	10000004	14	1	60	1	2024-02-01 10:43:03.405273	2024-02-01 10:43:03.405273
137	10000004	37	1	178	1	2024-02-01 10:43:03.405273	2024-02-01 10:43:03.405273
138	10000005	3	97	12610	1	2024-02-01 10:50:38.78977	2024-02-01 10:50:38.78977
139	10000006	4	2	266	1	2024-02-01 11:44:23.129906	2024-02-01 11:44:23.129906
140	10000007	16	1	60	1	2024-02-01 11:58:15.424062	2024-02-01 11:58:15.424062
141	10000008	7	2	120	1	2024-02-01 14:50:47.004082	2024-02-01 14:50:47.004082
142	10000009	7	2	120	1	2024-02-01 14:51:42.541416	2024-02-01 14:51:42.541416
143	10000010	7	2	120	1	2024-02-01 15:37:10.90547	2024-02-01 15:37:10.90547
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, userid, orderdate, ordersubtotalamount, ordertotalamount, createdat, modifiedat) FROM stdin;
10000001	1	2024-05-25	250	300	2024-02-01 10:36:21.872417	2024-02-01 10:36:21.872417
10000002	1	2024-05-25	250	300	2024-02-01 10:38:03.394495	2024-02-01 10:38:03.394495
10000003	1	2024-02-01	300	400	2024-02-01 10:41:16.085515	2024-02-01 10:41:16.085515
10000004	1	2024-02-01	300	400	2024-02-01 10:43:03.405273	2024-02-01 10:43:03.405273
10000005	1	2024-02-01	12610	12650	2024-02-01 10:50:38.78977	2024-02-01 10:50:38.78977
10000006	1	2024-02-01	266	306	2024-02-01 11:44:23.129906	2024-02-01 11:44:23.129906
10000007	12	2024-02-01	60	110	2024-02-01 11:58:15.424062	2024-02-01 11:58:15.424062
10000008	1	2024-02-01	120	160	2024-02-01 14:50:47.004082	2024-02-01 14:50:47.004082
10000009	1	2024-02-01	120	160	2024-02-01 14:51:42.541416	2024-02-01 14:51:42.541416
10000010	1	2024-02-01	120	160	2024-02-01 15:37:10.90547	2024-02-01 15:37:10.90547
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (paymentid, razorpaypaymentid, orderid, razorpayorderid, paymentstatus, createdat) FROM stdin;
1	Razorpay_PaymentID_123	65	Razorpay_OrderID_123	Success	2024-01-31 18:18:14.670897
2	PAY1234	67	32	Success	2024-01-31 18:23:44.994567
3	PAY1234	68	32	Success	2024-01-31 18:28:32.214013
4	PAY1234	69	32	Success	2024-01-31 18:49:02.148503
5		70		Failed	2024-01-31 18:54:57.389272
6	\N	71	\N	Failed	2024-01-31 18:56:27.676308
7	\N	72	\N	Failed	2024-01-31 19:01:30.393518
8	PAY1234	73	\N	Success	2024-01-31 19:03:54.565679
9	PAY1234	74	\N	Success	2024-01-31 19:07:31.256575
10	\N	75	\N	Failed	2024-01-31 19:08:51.000588
11	\N	76	\N	Faild	2024-01-31 19:10:14.316005
12	\N	77	\N	Faild	2024-01-31 19:13:00.775758
13	pay_NVEyhJ4gjTpfpo	78	\N	Sucess	2024-01-31 19:15:01.938709
14	pay_NVF0fKHW989dOL	79	\N	Sucess	2024-01-31 19:16:49.959315
15	pay_NVF3YZdCcsoXhA	80	\N	Success	2024-01-31 19:19:32.057068
16	\N	81	\N	Failed	2024-01-31 19:21:57.683634
17	\N	82	\N	Failed	2024-01-31 19:27:44.135391
18	pay_NVFCfGP79lhIQ7	83	\N	Success	2024-01-31 19:28:10.64127
19	\N	84	\N	\N	2024-01-31 19:31:12.89215
20	\N	85	\N	Failed	2024-01-31 19:40:27.68758
21	PAY1234	86	\N	Success	2024-01-31 19:40:55.422916
22	PAY1234	87	\N	Success	2024-01-31 19:41:28.080287
23	\N	88	\N	Failed	2024-01-31 19:42:00.862695
24	\N	89	\N	Failed	2024-01-31 19:42:21.634509
25	pay_NVFUXg8PJqVNQn	90	\N	Success	2024-01-31 19:45:08.326484
26	\N	91	\N	Failed	2024-01-31 19:51:13.721349
27	PAY1234	92	\N	Success	2024-01-31 19:51:23.844129
28	\N	93	\N	Success	2024-01-31 20:10:24.551665
29	\N	94	\N	Success	2024-01-31 20:16:23.463082
30	\N	95	\N	Success	2024-01-31 20:26:23.301334
31	pay_NVGEQDFYbig6qw	96	\N	Success	2024-01-31 20:28:27.709685
32	Razorpay_PaymentID_123	10000001	Razorpay_OrderID_123	Success	2024-02-01 10:36:21.872417
33	Razorpay_PaymentID_123	10000002	Razorpay_OrderID_123	Success	2024-02-01 10:38:03.394495
34	PAY1234	10000003	\N	Success	2024-02-01 10:41:16.085515
35	\N	10000004	\N	Failed	2024-02-01 10:43:03.405273
36	pay_NVUvAnIACPEtCR	10000005	\N	Success	2024-02-01 10:50:38.78977
37	pay_NVVpwHrrP5YBnw	10000006	\N	Success	2024-02-01 11:44:23.129906
38	pay_NVW4Q98N3YHEXN	10000007	\N	Success	2024-02-01 11:58:15.424062
39	\N	10000008	\N	Failed	2024-02-01 14:50:47.004082
40	\N	10000009	\N	Failed	2024-02-01 14:51:42.541416
41	\N	10000010	\N	Failed	2024-02-01 15:37:10.90547
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, categoryid, productname, imagelink, healthinfo, nutritionalinfo, sku, bestseller, weight, quantitytype, createdat, modifiedat, createdby, modifiedby, active, productnotes) FROM stdin;
12	3	Kodo Millet Pasta	kodo_millet_pasta.jpg	Kodo millets release glucose/energy slowly, over a longer period of time and thus helps in sugar control. Gluten-free – Great for people with gluten intolerance or celiac disease. Easy to digest.	Calories: 353 kcal | Dietary Fiber: 5.2 grams | Protein: 9.8 grams	112	1	192	gm	2024-01-10 16:54:19.598596	2024-01-10 16:54:19.598596	Jithendran	Jithendran	1	\N
13	3	Little Millet Pasta	little_millet_pasta.jpg	Little millet helps against diseases like diabetes, cardiovascular diseases, cataract, cancer, inflammation.	carbohydrates (g) : 67.0 | Protein (g) : 7.7 | Fat (g) : 4.7 | Energy (KCal) : 341	113	0	192	gm	2024-01-10 16:54:19.598596	2024-01-10 16:54:19.598596	Jithendran	Jithendran	1	\N
14	3	Barnyard Millet Pasta	barnyard_millet_pasta.jpg	Barnyard millet is a good source of highly digestible protein and at the same time is least caloric dense compared to all other cereals.	Carotene = 0ug | Iron = 2.9mg | Calcium = 0.02g | Phosphorous = 0.28g	114	0	192	gm	2024-01-10 16:54:19.598596	2024-01-10 16:54:19.598596	Jithendran	Jithendran	1	\N
15	3	Foxtail Millet Pasta	foxtail_millet_pasta.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	115	0	192	gm	2024-01-10 16:54:19.598596	2024-01-10 16:54:19.598596	Jithendran	Jithendran	1	\N
16	3	Multigrain Pasta	multigrain_pasta.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	116	0	192	gm	2024-01-10 16:54:19.598596	2024-01-10 16:54:19.598596	Jithendran	Jithendran	1	\N
17	4	Kodo Millet Sevai	kodo_millet_sevai.jpg	Kodo millets release glucose/energy slowly, over a longer period of time and thus helps in sugar control. Gluten-free – Great for people with gluten intolerance or celiac disease. Easy to digest.	Calories: 353 kcal | Dietary Fiber: 5.2 grams | Protein: 9.8 grams	117	1	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
18	4	Little Millet Sevai	little_millet_sevai.jpg	Little millet helps against diseases like diabetes, cardiovascular diseases, cataract, cancer, inflammation.	carbohydrates (g) : 67.0 | Protein (g) : 7.7 | Fat (g) : 4.7 | Energy (KCal) : 341	118	0	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
19	4	Barnyard Millet Sevai	barnyard_millet_sevai.jpg	Barnyard millet is a good source of highly digestible protein and at the same time is least caloric dense compared to all other cereals.	Carotene = 0ug | Iron = 2.9mg | Calcium = 0.02g | Phosphorous = 0.28g	119	0	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
20	4	Foxtail Millet Sevai	foxtail_millet_sevai.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	120	0	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
21	4	Karuppu Kavuni Sevai	karuppu_kavuni_sevai.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	121	0	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
1	1	Kodo Millet	kodo_millet.jpg	Kodo millets release glucose/energy slowly, over a longer period of time and thus helps in sugar control. Gluten-free – Great for people with gluten intolerance or celiac disease. Easy to digest.	Calories: 353 kcal | Dietary Fiber: 5.2 grams | Protein: 9.8 grams	101	1	1	kg	2024-01-10 16:54:08.906259	2024-01-10 16:54:08.906259	Jithendran	Jithendran	1	\N
2	1	Little Millet	little_millet.jpg	Little millet helps against diseases like diabetes, cardiovascular diseases, cataract, cancer, inflammation.	carbohydrates (g) : 67.0 | Protein (g) : 7.7 | Fat (g) : 4.7 | Energy (KCal) : 341	102	0	1	kg	2024-01-10 16:54:08.906259	2024-01-10 16:54:08.906259	Jithendran	Jithendran	1	\N
24	5	Little Millet Cookies	little_millet_cookies.jpg	Little millet helps against diseases like diabetes, cardiovascular diseases, cataract, cancer, inflammation.	carbohydrates (g) : 67.0 | Protein (g) : 7.7 | Fat (g) : 4.7 | Energy (KCal) : 341	124	0	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
3	1	Barnyard Millet	barnyard_millet.jpg	Barnyard millet is a good source of highly digestible protein and at the same time is least caloric dense compared to all other cereals.	Carotene = 0ug | Iron = 2.9mg | Calcium = 0.02g | Phosphorous = 0.28g	103	0	1	kg	2024-01-10 16:54:08.906259	2024-01-10 16:54:08.906259	Jithendran	Jithendran	1	\N
4	1	Foxtail Millet	foxtail_millet.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	104	0	1	kg	2024-01-10 16:54:08.906259	2024-01-10 16:54:08.906259	Jithendran	Jithendran	1	\N
5	2	Kodo Millet Noodles	kodo_millet_noodles.jpg	Kodo millets release glucose/energy slowly, over a longer period of time and thus helps in sugar control. Gluten-free – Great for people with gluten intolerance or celiac disease. Easy to digest.	Calories: 353 kcal | Dietary Fiber: 5.2 grams | Protein: 9.8 grams	105	1	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
6	2	Little Millet Noodles	little_millet_noodles.jpg	Little millet helps against diseases like diabetes, cardiovascular diseases, cataract, cancer, inflammation.	carbohydrates (g) : 67.0 | Protein (g) : 7.7 | Fat (g) : 4.7 | Energy (KCal) : 341	106	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
7	2	Barnyard Millet Noodles	barnyard_millet_noodles.jpg	Barnyard millet is a good source of highly digestible protein and at the same time is least caloric dense compared to all other cereals.	Carotene = 0ug | Iron = 2.9mg | Calcium = 0.02g | Phosphorous = 0.28g	107	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
8	2	Foxtail Millet Noodles	foxtail_millet_noodles.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	108	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
10	2	Curry Leaves Noodles	curry_leaves_noodles.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	110	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
11	2	Moringa Noodles	moringa_noodles.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	111	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
22	4	Moringa Sevai	moringa_sevai.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	122	0	180	gm	2024-01-10 16:54:24.043123	2024-01-10 16:54:24.043123	Jithendran	Jithendran	1	\N
23	5	Kodo Millet Cookies	kodo_millet_cookies.jpg	Kodo millets release glucose/energy slowly, over a longer period of time and thus helps in sugar control. Gluten-free – Great for people with gluten intolerance or celiac disease. Easy to digest.	Calories: 353 kcal | Dietary Fiber: 5.2 grams | Protein: 9.8 grams	123	1	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
25	5	Barnyard Millet Cookies	barnyard_millet_cookies.jpg	Barnyard millet is a good source of highly digestible protein and at the same time is least caloric dense compared to all other cereals.	Carotene = 0ug | Iron = 2.9mg | Calcium = 0.02g | Phosphorous = 0.28g	125	0	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
26	5	Foxtail Millet Cookies	foxtail_millet_cookies.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	126	0	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
27	5	Multigrain Cookies	multigrain_cookies.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	127	0	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
28	5	Pearl Millet Cookies	pearl_millet_cookies.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	128	0	90	gm	2024-01-10 16:54:28.294147	2024-01-10 16:54:28.294147	Jithendran	Jithendran	1	\N
29	6	Mappillai Samba	mappilai_samba.jpg	Mappillai Samba Rice increases stamina and provides energy, especially for schoolgoing children. It is believed to cure mouth ulcers and cancer. The bran layer is rich in polyphenols, anthocyanin and has antioxidant properties.	Fat 2.14 g | Protein 8.47 g | Dietary fiber (on dry basis) 1.48 g | Carbohydrate 77.13 g | Iron 9.44 mg | Calcium 11.86 mg |	129	1	1	kg	2024-01-10 16:54:32.263357	2024-01-10 16:54:32.263357	Jithendran	Jithendran	1	\N
30	6	Red Rice	red_rice.jpg	It lowers blood pressure and controls blood cholesterol levels, thereby becoming one of the healthy choices for people with diabetes and heart problems.	Calories: 109 | Carbohydrates: 23g | Fibre: 1.8g | Protein: 23g	130	0	1	kg	2024-01-10 16:54:32.263357	2024-01-10 16:54:32.263357	Jithendran	Jithendran	1	\N
31	6	Thooyamalli	thooyamalli.jpg	Rice has been shown to be quite beneficial to digestion. High Fibre content in this rice aids in the movement of digesting food in the intestine by loosening the bowels.	Energy (kcal) 359.17 | Protein (g)\t7.46 | Carbohydrate (g)\t80.06 | Dietary Fibre (g) 5.3	131	0	1	kg	2024-01-10 16:54:32.263357	2024-01-10 16:54:32.263357	Jithendran	Jithendran	1	\N
32	6	Seeraga Samba	seeraga_samba.jpg	It might reduce the risk of certain type of cancer that include – colon, intestine and breast cancerProtects our heart from all cardio related diseases,Improves mental health	Energy 170 kcal | Protein 3 g | Carbohydrate 38 g  | fiber 2.3 g	132	0	1	kg	2024-01-10 16:54:32.263357	2024-01-10 16:54:32.263357	Jithendran	Jithendran	1	\N
33	7	Organic Country Sugar	country_sugar.jpg	It is very rich in calcium and it ensures a strong bone and muscles when we have it along with milk.its improving memory power.	carbohydrates: 4.5 g | Fiber: 0 g | Sugars: 4.5 g | Protein: 0 g	133	1	1	kg	2024-01-10 16:54:36.545798	2024-01-10 16:54:36.545798	Jithendran	Jithendran	1	\N
34	7	Palm Jaggery	palm_jaggery.jpg	Its a healthier alternative to white sugar that helps to cleanse the entire system.jaggery is high in nutrients, it aids in the development of healthy and smooth skin.	Calories-383 Kcal | Protein-0.4 gms | Fat-0.1 gms | Iron-11 mg	134	0	1	kg	2024-01-10 16:54:36.545798	2024-01-10 16:54:36.545798	Jithendran	Jithendran	1	\N
35	7	Jaggery	jaggery.jpg	respiratory tract problems, jaggery could be one of the most beneficial solutions.Jaggery is a good source of potassium that helps balance electrolytes	calories: 100 | Protein: Less than 1 gram | Carbohydrates: 26 grams | Sugar: 24 grams	135	0	1	kg	2024-01-10 16:54:36.545798	2024-01-10 16:54:36.545798	Jithendran	Jithendran	1	\N
36	8	Urad Dal	urad_dal.jpg	One of the major urad dal health benefits is that it prevents anaemia due to the high iron content in it.	Energy 371Kcal  | Protein 25.7G | Fibre, total dietary 25.7\tG  | Sugar\t0 G	136	1	1	kg	2024-01-10 16:54:39.010995	2024-01-10 16:54:39.010995	Jithendran	Jithendran	1	\N
37	8	Toor Dal	toor_dal.jpg	Toor dal is rich in protein that might help avoid type 2 diabetes. It is found that in patients with diabetes and cholesterol, regular intake of toor dal may lower their blood sugar	Protein 22.86 g | Carbohydrates 62.86 g| Calcium 57 mg | Iron 3.09 mg	137	0	1	kg	2024-01-10 16:54:39.010995	2024-01-10 16:54:39.010995	Jithendran	Jithendran	1	\N
38	9	Groundnut Oil	groundnut_oil.jpg	It reduces the risk of heart disease, lowers blood pressure, helps to reduce inflammation and helps to strengthen the joints and alleviate joint discomfort.	Energy 40 kcal | Fats\t4.5g | sugar 0g| fiber 0g	138	1	1	litre	2024-01-10 16:54:43.223981	2024-01-10 16:54:43.223981	Jithendran	Jithendran	1	\N
39	9	Sesame Oil	sesame_oil.jpg	It may encourage fat burning, provides a quick supply of energy, help to reduce hunger and having antimicrobial and antifungal properties.	Calories 104 |Protein 0 grams (g) | Fat 11.5 g | Saturated fat 9.6 g	139	0	1	litre	2024-01-10 16:54:43.223981	2024-01-10 16:54:43.223981	Jithendran	Jithendran	1	\N
40	9	Coconut Oil	coconut_oil.jpg	It may encourage fat burning, provides a quick supply of energy, help to reduce hunger and having antimicrobial and antifungal properties.	Calories 104 |Protein 0 grams (g) | Fat 11.5 g | Saturated fat 9.6 g	140	0	1	litre	2024-01-10 16:54:43.223981	2024-01-10 16:54:43.223981	Jithendran	Jithendran	1	\N
9	2	Multigrain Noodles	multigrain_noodles.jpg	Foxtail Millet helps in regulating blood sugar level, cholesterol and increases HDL cholesterol in human body.	Proteins 11.2g | Carbohydrates 21g | Iron 5g | Calcium 14mg	109	0	180	gm	2024-01-10 16:54:12.564513	2024-01-10 16:54:12.564513	Jithendran	Jithendran	1	\N
\.


--
-- Data for Name: purchaseorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchaseorder (purchaseorderid, purchaseordernumber, supplierid, purchaseorderdate, totalpurchaseamount, createdat, modifiedat, createdby, modifiedby, deliverynotes) FROM stdin;
1	1002	101	2024-01-25	500	2024-01-25 12:18:58.736702	2024-01-25 12:18:58.736702	\N	\N	\N
\.


--
-- Data for Name: purchaseorderdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchaseorderdetail (purchaseorderdetailid, purchaseorderid, productid, quantity, quantitytype, purchaseprice, operationid, createdat, modifiedat, createdby, modifiedby) FROM stdin;
1	1	2	15		300	2	2024-01-25 12:18:58.736702	2024-01-25 12:18:58.736702	\N	\N
2	1	3	15		200	2	2024-01-25 12:18:58.736702	2024-01-25 12:18:58.736702	\N	\N
\.


--
-- Data for Name: rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rate (rateid, productid, mrp, discount, sellingprice, currency, effectivedate, enddate, createdat, modifiedat, createdby, modifiedby) FROM stdin;
1	1	120	15	105	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
2	2	130	15	113	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
3	3	150	15	130	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
4	4	160	20	133	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
5	5	78	30	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
6	6	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
7	7	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
8	8	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
9	9	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
10	10	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
11	11	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
12	12	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
13	13	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
14	14	75	25	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
15	15	66	10	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
16	16	66	10	60	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
17	17	46	15	40	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
18	18	50	25	40	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
19	19	50	25	40	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
20	20	50	25	40	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
21	21	65	25	50	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
22	22	48	20	40	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
23	23	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
24	24	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
25	25	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
26	26	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
27	27	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
28	28	36	10	30	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
29	29	105	10	94	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
30	30	75	10	66	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
31	31	95	10	85	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
32	32	130	10	116	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
33	33	80	10	72	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
34	34	85	10	75	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
35	35	400	10	360	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
36	36	175	10	156	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
37	37	195	10	178	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
38	38	320	10	290	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
39	39	550	10	500	INR	2024-01-11 11:09:41.481084	\N	2024-01-11 11:09:41.481084	\N	Jithendran	\N
40	40	220	10	200	INR	2024-01-11 11:09:41.481084	2024-01-26 16:16:12.480378	2024-01-11 11:09:41.481084	\N	Jithendran	\N
41	40	230	15	200	INR	2024-01-26 16:16:12.480378	\N	2024-01-26 16:16:12.480378	\N	Admin	\N
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (stockid, productid, quantityinstock, availabilitystatus, createdat, modifiedat, createdby, modifiedby) FROM stdin;
6	6	100	1	2024-01-10 16:56:16.721907	2024-01-31 17:18:06.92296	Jithendran	User
7	7	100	1	2024-01-10 16:56:16.721907	2024-01-31 17:18:06.92296	Jithendran	User
8	8	100	1	2024-01-10 16:56:16.721907	2024-01-31 16:17:24.621152	Jithendran	User
9	9	100	1	2024-01-10 16:56:16.721907	2024-01-31 13:41:54.338636	Jithendran	User
10	10	100	1	2024-01-10 16:56:16.721907	2024-01-31 19:19:32.057068	Jithendran	User
12	12	100	1	2024-01-10 16:56:16.721907	2024-01-31 19:45:08.326484	Jithendran	User
15	15	100	1	2024-01-10 16:56:16.721907	2024-01-31 18:19:56.438735	Jithendran	User
17	17	100	1	2024-01-10 16:56:16.721907	2024-01-30 18:06:19.178738	Jithendran	User
18	18	100	1	2024-01-10 16:56:16.721907	2024-01-31 16:41:17.87006	Jithendran	User
19	19	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
20	20	100	1	2024-01-10 16:56:16.721907	2024-01-30 18:00:56.057626	Jithendran	User
21	21	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
22	22	100	1	2024-01-10 16:56:16.721907	2024-01-31 14:07:26.460025	Jithendran	User
23	23	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
24	24	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
25	25	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
26	26	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
27	27	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
28	28	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
29	29	100	1	2024-01-10 16:56:16.721907	2024-01-31 16:32:30.286716	Jithendran	User
30	30	100	1	2024-01-10 16:56:16.721907	2024-01-31 11:34:05.828815	Jithendran	User
33	33	100	1	2024-01-10 16:56:16.721907	2024-01-31 11:32:35.992329	Jithendran	User
34	34	100	1	2024-01-10 16:56:16.721907	2024-01-31 12:25:35.466275	Jithendran	User
35	35	100	1	2024-01-10 16:56:16.721907	2024-01-31 11:50:56.723237	Jithendran	User
36	36	100	1	2024-01-10 16:56:16.721907	2024-01-31 16:30:29.855378	Jithendran	User
38	38	100	1	2024-01-10 16:56:16.721907	2024-01-31 16:24:22.449124	Jithendran	User
39	39	100	1	2024-01-10 16:56:16.721907	\N	Jithendran	\N
40	40	100	1	2024-01-10 16:56:16.721907	2024-01-31 20:10:24.551665	Jithendran	User
5	5	100	1	2024-01-10 16:56:16.721907	2024-01-31 20:16:23.463082	Jithendran	User
1	1	98	1	2024-01-10 16:56:16.721907	2024-01-31 20:26:23.301334	Jithendran	User
2	2	98	1	2024-01-10 16:56:16.721907	2024-01-31 20:28:27.709685	Jithendran	User
11	11	98	1	2024-01-10 16:56:16.721907	2024-02-01 10:36:21.872417	Jithendran	User
13	13	99	1	2024-01-10 16:56:16.721907	2024-02-01 10:36:21.872417	Jithendran	User
31	31	98	1	2024-01-10 16:56:16.721907	2024-02-01 10:38:03.394495	Jithendran	User
32	32	99	1	2024-01-10 16:56:16.721907	2024-02-01 10:38:03.394495	Jithendran	User
14	14	99	1	2024-01-10 16:56:16.721907	2024-02-01 10:41:16.085515	Jithendran	User
37	37	99	1	2024-01-10 16:56:16.721907	2024-02-01 10:41:16.085515	Jithendran	User
3	3	3	1	2024-01-10 16:56:16.721907	2024-02-01 10:50:38.78977	Jithendran	User
4	4	98	1	2024-01-10 16:56:16.721907	2024-02-01 11:44:23.129906	Jithendran	User
16	16	99	1	2024-01-10 16:56:16.721907	2024-02-01 11:58:15.424062	Jithendran	User
\.


--
-- Data for Name: stockhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockhistory (stockhistoryid, stockoldvalue, stocknewvalue, operationid, stockid, createdat, modifiedat, createdby, modifiedby) FROM stdin;
1	50	48	1	11	2024-01-25 11:27:54.430619	2024-01-25 11:27:54.430619	\N	\N
2	50	49	1	13	2024-01-25 11:27:54.430619	2024-01-25 11:27:54.430619	\N	\N
3	30	45	1	2	2024-01-25 12:13:29.222232	2024-01-25 12:13:29.222232	\N	\N
4	45	60	2	2	2024-01-25 12:16:28.436628	2024-01-25 12:16:28.436628	\N	\N
5	4	19	2	3	2024-01-25 12:16:28.436628	2024-01-25 12:16:28.436628	\N	\N
6	60	75	2	2	2024-01-25 12:18:58.736702	2024-01-25 12:18:58.736702	\N	\N
7	19	34	2	3	2024-01-25 12:18:58.736702	2024-01-25 12:18:58.736702	\N	\N
8	48	46	1	11	2024-01-30 12:26:55.866679	2024-01-30 12:26:55.866679	\N	\N
9	49	48	1	13	2024-01-30 12:26:55.866679	2024-01-30 12:26:55.866679	\N	\N
10	46	44	1	10	2024-01-30 17:41:08.376512	2024-01-30 17:41:08.376512	\N	\N
11	49	48	1	12	2024-01-30 17:41:08.376512	2024-01-30 17:41:08.376512	\N	\N
12	44	42	1	10	2024-01-30 17:41:19.887897	2024-01-30 17:41:19.887897	\N	\N
13	48	47	1	12	2024-01-30 17:41:19.887897	2024-01-30 17:41:19.887897	\N	\N
14	42	40	1	10	2024-01-30 17:47:33.174018	2024-01-30 17:47:33.174018	\N	\N
15	47	46	1	12	2024-01-30 17:47:33.174018	2024-01-30 17:47:33.174018	\N	\N
16	50	48	1	36	2024-01-30 18:00:56.057626	2024-01-30 18:00:56.057626	\N	\N
17	50	49	1	20	2024-01-30 18:00:56.057626	2024-01-30 18:00:56.057626	\N	\N
18	50	49	1	17	2024-01-30 18:06:19.178738	2024-01-30 18:06:19.178738	\N	\N
19	48	47	1	13	2024-01-30 18:08:42.828571	2024-01-30 18:08:42.828571	\N	\N
20	50	46	1	4	2024-01-30 18:47:51.23179	2024-01-30 18:47:51.23179	\N	\N
21	5	4	1	1	2024-01-30 18:52:38.388941	2024-01-30 18:52:38.388941	\N	\N
22	4	3	1	1	2024-01-30 18:54:42.512833	2024-01-30 18:54:42.512833	\N	\N
23	50	49	1	5	2024-01-30 18:56:51.536633	2024-01-30 18:56:51.536633	\N	\N
24	40	38	1	10	2024-01-30 19:00:46.307254	2024-01-30 19:00:46.307254	\N	\N
25	46	45	1	12	2024-01-30 19:00:46.307254	2024-01-30 19:00:46.307254	\N	\N
26	50	48	1	29	2024-01-31 11:02:10.116708	2024-01-31 11:02:10.116708	\N	\N
27	48	46	1	29	2024-01-31 11:25:48.028096	2024-01-31 11:25:48.028096	\N	\N
28	50	48	1	8	2024-01-31 11:26:50.153857	2024-01-31 11:26:50.153857	\N	\N
29	50	47	1	33	2024-01-31 11:32:35.992329	2024-01-31 11:32:35.992329	\N	\N
30	50	48	1	30	2024-01-31 11:34:05.828815	2024-01-31 11:34:05.828815	\N	\N
31	50	49	1	7	2024-01-31 11:37:46.364574	2024-01-31 11:37:46.364574	\N	\N
32	49	48	1	7	2024-01-31 11:37:46.364574	2024-01-31 11:37:46.364574	\N	\N
33	48	47	1	8	2024-01-31 11:43:16.65348	2024-01-31 11:43:16.65348	\N	\N
34	50	48	1	31	2024-01-31 11:43:31.439061	2024-01-31 11:43:31.439061	\N	\N
35	50	49	1	35	2024-01-31 11:50:56.723237	2024-01-31 11:50:56.723237	\N	\N
36	50	49	1	37	2024-01-31 12:02:11.21525	2024-01-31 12:02:11.21525	\N	\N
37	46	45	1	11	2024-01-31 12:10:14.00575	2024-01-31 12:10:14.00575	\N	\N
38	49	48	1	5	2024-01-31 12:13:51.924002	2024-01-31 12:13:51.924002	\N	\N
39	38	37	1	10	2024-01-31 12:20:55.358242	2024-01-31 12:20:55.358242	\N	\N
40	50	49	1	34	2024-01-31 12:25:35.466275	2024-01-31 12:25:35.466275	\N	\N
41	48	47	1	7	2024-01-31 12:27:43.579119	2024-01-31 12:27:43.579119	\N	\N
42	45	44	1	11	2024-01-31 12:34:41.932863	2024-01-31 12:34:41.932863	\N	\N
43	44	43	1	11	2024-01-31 12:35:19.722537	2024-01-31 12:35:19.722537	\N	\N
44	43	42	1	11	2024-01-31 12:36:19.606662	2024-01-31 12:36:19.606662	\N	\N
45	47	46	1	13	2024-01-31 12:38:36.663635	2024-01-31 12:38:36.663635	\N	\N
46	48	47	1	5	2024-01-31 13:25:25.044752	2024-01-31 13:25:25.044752	\N	\N
47	50	49	1	14	2024-01-31 13:34:35.180167	2024-01-31 13:34:35.180167	\N	\N
48	50	48	1	9	2024-01-31 13:41:54.338636	2024-01-31 13:41:54.338636	\N	\N
49	50	49	1	15	2024-01-31 13:43:06.543408	2024-01-31 13:43:06.543408	\N	\N
50	46	45	1	13	2024-01-31 13:51:25.064021	2024-01-31 13:51:25.064021	\N	\N
51	37	36	1	10	2024-01-31 14:03:31.546866	2024-01-31 14:03:31.546866	\N	\N
52	50	49	1	22	2024-01-31 14:07:26.460025	2024-01-31 14:07:26.460025	\N	\N
53	47	46	1	7	2024-01-31 14:17:32.034586	2024-01-31 14:17:32.034586	\N	\N
54	49	48	1	15	2024-01-31 14:21:08.398757	2024-01-31 14:21:08.398757	\N	\N
55	45	44	1	12	2024-01-31 14:22:46.625329	2024-01-31 14:22:46.625329	\N	\N
56	44	43	1	12	2024-01-31 14:38:55.8313	2024-01-31 14:38:55.8313	\N	\N
57	48	47	1	15	2024-01-31 15:39:51.22417	2024-01-31 15:39:51.22417	\N	\N
58	47	46	1	15	2024-01-31 16:15:56.92842	2024-01-31 16:15:56.92842	\N	\N
59	36	34	1	10	2024-01-31 16:16:28.997152	2024-01-31 16:16:28.997152	\N	\N
60	43	42	1	12	2024-01-31 16:16:28.997152	2024-01-31 16:16:28.997152	\N	\N
61	47	46	1	8	2024-01-31 16:17:24.621152	2024-01-31 16:17:24.621152	\N	\N
62	49	44	1	14	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233	\N	\N
63	42	41	1	12	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233	\N	\N
64	50	49	1	16	2024-01-31 16:23:34.593233	2024-01-31 16:23:34.593233	\N	\N
65	50	48	1	38	2024-01-31 16:24:22.449124	2024-01-31 16:24:22.449124	\N	\N
66	34	31	1	3	2024-01-31 16:27:33.917751	2024-01-31 16:27:33.917751	\N	\N
67	48	46	1	36	2024-01-31 16:30:29.855378	2024-01-31 16:30:29.855378	\N	\N
68	46	44	1	29	2024-01-31 16:32:30.286716	2024-01-31 16:32:30.286716	\N	\N
69	41	38	1	12	2024-01-31 16:39:01.912742	2024-01-31 16:39:01.912742	\N	\N
70	50	49	1	18	2024-01-31 16:41:17.87006	2024-01-31 16:41:17.87006	\N	\N
71	50	49	1	6	2024-01-31 17:18:06.92296	2024-01-31 17:18:06.92296	\N	\N
72	46	41	1	7	2024-01-31 17:18:06.92296	2024-01-31 17:18:06.92296	\N	\N
73	42	40	1	11	2024-01-31 18:00:51.866227	2024-01-31 18:00:51.866227	\N	\N
74	45	44	1	13	2024-01-31 18:00:51.866227	2024-01-31 18:00:51.866227	\N	\N
75	40	38	1	11	2024-01-31 18:04:50.438945	2024-01-31 18:04:50.438945	\N	\N
76	44	43	1	13	2024-01-31 18:04:50.438945	2024-01-31 18:04:50.438945	\N	\N
77	50	48	1	32	2024-01-31 18:10:32.968422	2024-01-31 18:10:32.968422	\N	\N
78	44	41	1	14	2024-01-31 18:10:32.968422	2024-01-31 18:10:32.968422	\N	\N
79	38	36	1	11	2024-01-31 18:11:00.837453	2024-01-31 18:11:00.837453	\N	\N
80	43	42	1	13	2024-01-31 18:11:00.837453	2024-01-31 18:11:00.837453	\N	\N
81	36	34	1	11	2024-01-31 18:11:45.754499	2024-01-31 18:11:45.754499	\N	\N
82	42	41	1	13	2024-01-31 18:11:45.754499	2024-01-31 18:11:45.754499	\N	\N
83	34	32	1	11	2024-01-31 18:18:14.670897	2024-01-31 18:18:14.670897	\N	\N
84	41	40	1	13	2024-01-31 18:18:14.670897	2024-01-31 18:18:14.670897	\N	\N
85	46	45	1	15	2024-01-31 18:19:56.438735	2024-01-31 18:19:56.438735	\N	\N
86	34	32	1	10	2024-01-31 18:23:44.994567	2024-01-31 18:23:44.994567	\N	\N
87	38	37	1	12	2024-01-31 18:23:44.994567	2024-01-31 18:23:44.994567	\N	\N
88	32	30	1	10	2024-01-31 18:28:32.214013	2024-01-31 18:28:32.214013	\N	\N
89	37	36	1	12	2024-01-31 18:28:32.214013	2024-01-31 18:28:32.214013	\N	\N
90	30	28	1	10	2024-01-31 18:49:02.148503	2024-01-31 18:49:02.148503	\N	\N
91	36	35	1	12	2024-01-31 18:49:02.148503	2024-01-31 18:49:02.148503	\N	\N
92	41	40	1	14	2024-01-31 19:03:54.565679	2024-01-31 19:03:54.565679	\N	\N
93	49	48	1	37	2024-01-31 19:03:54.565679	2024-01-31 19:03:54.565679	\N	\N
94	40	39	1	14	2024-01-31 19:07:31.256575	2024-01-31 19:07:31.256575	\N	\N
95	48	47	1	37	2024-01-31 19:07:31.256575	2024-01-31 19:07:31.256575	\N	\N
96	28	27	1	10	2024-01-31 19:19:32.057068	2024-01-31 19:19:32.057068	\N	\N
97	47	46	1	5	2024-01-31 19:28:10.64127	2024-01-31 19:28:10.64127	\N	\N
98	39	38	1	14	2024-01-31 19:40:55.422916	2024-01-31 19:40:55.422916	\N	\N
99	47	46	1	37	2024-01-31 19:40:55.422916	2024-01-31 19:40:55.422916	\N	\N
100	38	37	1	14	2024-01-31 19:41:28.080287	2024-01-31 19:41:28.080287	\N	\N
101	46	45	1	37	2024-01-31 19:41:28.080287	2024-01-31 19:41:28.080287	\N	\N
102	35	34	1	12	2024-01-31 19:45:08.326484	2024-01-31 19:45:08.326484	\N	\N
103	37	36	1	14	2024-01-31 19:51:23.844129	2024-01-31 19:51:23.844129	\N	\N
104	45	44	1	37	2024-01-31 19:51:23.844129	2024-01-31 19:51:23.844129	\N	\N
105	50	47	1	40	2024-01-31 20:10:24.551665	2024-01-31 20:10:24.551665	\N	\N
106	100	98	1	5	2024-01-31 20:16:23.463082	2024-01-31 20:16:23.463082	\N	\N
107	100	98	1	1	2024-01-31 20:26:23.301334	2024-01-31 20:26:23.301334	\N	\N
108	100	98	1	2	2024-01-31 20:28:27.709685	2024-01-31 20:28:27.709685	\N	\N
109	100	98	1	11	2024-02-01 10:36:21.872417	2024-02-01 10:36:21.872417	\N	\N
110	100	99	1	13	2024-02-01 10:36:21.872417	2024-02-01 10:36:21.872417	\N	\N
111	100	98	1	31	2024-02-01 10:38:03.394495	2024-02-01 10:38:03.394495	\N	\N
112	100	99	1	32	2024-02-01 10:38:03.394495	2024-02-01 10:38:03.394495	\N	\N
113	100	99	1	14	2024-02-01 10:41:16.085515	2024-02-01 10:41:16.085515	\N	\N
114	100	99	1	37	2024-02-01 10:41:16.085515	2024-02-01 10:41:16.085515	\N	\N
115	100	3	1	3	2024-02-01 10:50:38.78977	2024-02-01 10:50:38.78977	\N	\N
116	100	98	1	4	2024-02-01 11:44:23.129906	2024-02-01 11:44:23.129906	\N	\N
117	100	99	1	16	2024-02-01 11:58:15.424062	2024-02-01 11:58:15.424062	\N	\N
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplierid, suppliername, supplierphonenumber, supplieraddress, createdat, modifiedat, createdby, modifiedby) FROM stdin;
1	Supplier1	7708155644	Chennai	2024-01-25 12:59:28.642332	2024-01-25 13:08:47.223163	Admin	Admin
2	sorna	9876543201	Salem	2024-01-27 12:08:46.638717	2024-01-29 10:49:15.839059	sornamalyaamohan@gmail.com	Sorna
\.


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userrole (userroleid, userrolename) FROM stdin;
1	Customer
2	Admin
3	Store Manager
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, useremail, userpassword, userphonenumber, useraddress, usercity, userpincode, userstate, useralternateaddress, useralternatecity, useralternatepincode, useralternatestate, userroleid, createdat, modifiedat) FROM stdin;
2	admin	admin@milletsmarket.in	scrypt:32768:8:1$ToYZoy7AouTD0XP5$4dc23004f7c9182f141735b4d97fa333993dea1ebcb0f6494a166ac2ffb112d558b10a01427945c6a95ac51d8fbefce21533fdd2b3147a32a810382ee0264fe9	9597297675	salem	salem	636006	TN	\N	\N	\N	\N	2	2024-01-19 15:55:48.127994	\N
3	Sorna	sornamalyaamohan@gmail.com	scrypt:32768:8:1$Z4YxCFjXlsJddRtJ$dec50ac088eef79eb57e58853fac94ce4134c6d68f44f2411380843247cced36e4edb3b703c09c89301461512e504135cbc3966d534c48731ddacf7cf88b05d4	9876543210	Salem Town	Salem	636001	Tamil Nadu	Address 3	City 3	636002	State 3	1	2024-01-20 17:06:25.366827	\N
4	jithendran	jithendranjithu003@gmail.com	scrypt:32768:8:1$bPAufLqCRHCMkyv9$89e5a3029c10c7181fbe3c7742c01248442e9075526e92219fafb8ddd7c1ab4a2ea7c652d6b76eccad775157f933d232d8deb3d9e621dd950c77c7da7f071bcb	7708188455	chinnatirupathi	salem	636008	TN	\N	\N	\N	\N	1	2024-01-22 12:32:25.038524	\N
13	kishore	kishore@gmail.com	scrypt:32768:8:1$4e8vDcs83Qk09R18$34935caf0fc70c1841baafffd653c7353493ded409c4d135a988fb6a43e52eca1dbece45200feb173921d32fdfafd89c4a52cd8811f57eda99ef70f82f911925	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-26 15:46:09.291193	\N
14	kishore	kishoresekar@gmail.com	scrypt:32768:8:1$AeSS3fUs7G6tCEbu$7cd3e14b9fa995b2cbf28f2872c4348b0226422f84ebb256891fc796264c3b3549be352775db88c427a5ee2b6ca968331757d649a96e495aecd7a776981c3452	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-26 15:46:42.743792	\N
15	jithu	jithu@gmail.com	scrypt:32768:8:1$TyG4kqphAdKbHyN7$6ad75f0e300a05a0dfd7047cb426039e4a8409cc2aa08d7c444f4944fe86de683bb6883799dc89307c4666612ffa07153e42ac0cc4f4e8e09f45a51e0164be99	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-26 16:48:59.947628	\N
16	kishore	kishorear7@gmail.com	scrypt:32768:8:1$WuFUGT77v8cd2bpb$32e7ff547a1e2df4cacfe269b1a25cee7828b0fd30c86789e4a0ce0c919114d026f39edf2fd6da22273400cb2c3d6ad9658d65493e9c0c6bdd9fc4ac1d26bb24	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-27 14:36:10.805738	\N
17	kishore	kishsekar7@gmail.com	scrypt:32768:8:1$T1j888Xz2kRx5XiK$1bd26db28affa88fec0084d47cfa102d610c9b74feeac14cea0462057b7cb428cc3efa7ff2342e70cd0795355a6a9fad24bf1e285129457cf0484773a7562776	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-27 14:47:42.772201	\N
18	kishore	kishoresekar7	scrypt:32768:8:1$HpEcEsxQ7fvQn6Or$f7ca7a19f973da222c6f36766a93fa2e6e9ea52fc7de87f7d8b827efefda91c71c30a32c88295a321b93d7f322605ca88e6f78ca182fd55df16c6d6982ec4478	7708188644		salem	636008		\N	\N	\N	\N	1	2024-01-27 16:15:17.033525	\N
19	kishore	kiiishoresekar7@gmail.com	scrypt:32768:8:1$X6bnwb8T81qkPLYz$a2b094164bebbabeaf6d9b6363879eb91b21f4bb5d3468b5403a9be6990c75605e5c402c523c897172c5d0e43d3f8a14bb6b48974ae9677f913cb8a08f139dac	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-27 16:16:23.419928	\N
20	kishore	kishoresekar	scrypt:32768:8:1$F87dlH6MwIHme5CH$e254e8b87dc1aa8a70362ac96d26464c888cda4ef620f910f56bb37fe351fc60d5711bb1bfe38a7e1b8af0b37e6beda0fbe7e8d17f3fd48559da47cad49b1957	7708188644	chinnatirupathi	salem	636008	tamilnadu	\N	\N	\N	\N	1	2024-01-30 10:54:46.703866	\N
21	kishore	jithendranjithu03@gmail.com	scrypt:32768:8:1$2XRsWgkbrjLKbh0i$6399378e7175f174a953e1aef75f09a5c2cc8bb200bd8f32774125f9ccf4f5107521acc19734ab9fc77dd97fd430a95268b2dd232a63a61db03edba73b1402e5	7708188644	chinnatirupathi	salem	636008	tamilnadu	chinnatirupathi	salem	636005	tamilnadu	1	2024-01-30 11:03:41.627737	\N
12	San	gowri848920@gmail.com	scrypt:32768:8:1$0aoApRVn2Aue4nd7$fd40e03b04e345bb25e7feb82a229cad4ae1d19400e616788efc561962774e3a357fc8e22c2eb696c5306520eea60425eeff535fced14d356f6f22683d0b7640	963258658	Kongupatti 	Mettur 	655769	Tn	Kssksjbs	Salem	636305	Tn	1	2024-01-26 12:48:12.115991	\N
1	Kishore Kumar	kishoresekar7@gmail.com	scrypt:32768:8:1$BEiKVoU1VVBAD1vf$4372ac495a286d29726ab9b1cc2fc5971647e589b3d3ffb4cce96700ba66d3a2f753905d22563857304a8f802c27eef728bfef25c3735467aa3c0c5fd9abd941	9876543210	7/8, Bharathi Nagar, chinnatirupathi	Salem	636008	TN	7/8, Bharathi Nagar, chinnatirupathi	Salem	636001	TN	1	2024-01-19 15:54:09.716661	\N
\.


--
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartid_seq', 431, true);


--
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 11, true);


--
-- Name: deliverycharges_deliverychargeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliverycharges_deliverychargeid_seq', 1726, true);


--
-- Name: operations_operationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operations_operationid_seq', 3, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 10000010, true);


--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_orderdetailid_seq', 143, true);


--
-- Name: payment_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_paymentid_seq', 41, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 40, true);


--
-- Name: purchaseorder_purchaseorderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchaseorder_purchaseorderid_seq', 1, true);


--
-- Name: purchaseorderdetail_purchaseorderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchaseorderdetail_purchaseorderdetailid_seq', 2, true);


--
-- Name: rate_rateid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rate_rateid_seq', 41, true);


--
-- Name: stock_stockid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stockid_seq', 40, true);


--
-- Name: stockhistory_stockhistoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stockhistory_stockhistoryid_seq', 117, true);


--
-- Name: supplier_supplierid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplierid_seq', 2, true);


--
-- Name: userrole_userroleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userrole_userroleid_seq', 3, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 21, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- Name: deliverycharges deliverycharges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverycharges
    ADD CONSTRAINT deliverycharges_pkey PRIMARY KEY (deliverychargeid);


--
-- Name: operations operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (operationid);


--
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (orderdetailid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: purchaseorder purchaseorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT purchaseorder_pkey PRIMARY KEY (purchaseorderid);


--
-- Name: purchaseorderdetail purchaseorderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchaseorderdetail
    ADD CONSTRAINT purchaseorderdetail_pkey PRIMARY KEY (purchaseorderdetailid);


--
-- Name: rate rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_pkey PRIMARY KEY (rateid);


--
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stockid);


--
-- Name: stockhistory stockhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockhistory
    ADD CONSTRAINT stockhistory_pkey PRIMARY KEY (stockhistoryid);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplierid);


--
-- Name: userrole userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (userroleid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- PostgreSQL database dump complete
--

