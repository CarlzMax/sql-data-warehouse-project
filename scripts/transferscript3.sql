-- Full transformation query: 
-- INSERT INTO SQL syntax as well

INSERT INTO silver.erp_cust_az12 (cid, bdate, gen)

SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	ELSE cid
END cid
CASE WHEN bdate > GETDATE() THEN NULL
	ELSE bdate
END AS bdate,
gen
FROM bronze.erp_cust_az12
WHERE cid LIKE '%AW00011000%'

SELECT * FROM [silver].[crm_cust_info];




-- data quality check for the IDs to see if they match
-- and removing the unneeded characters "NAS"

SELECT
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	ELSE cid
END cid
bdate,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	 ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12
WHERE CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	ELSE cid
END NOT IN (SELECT DISTINCT cst_key FROM silver.crm_cust_info)



-- Identify Out-Of-Range Dates

SELECT DISTINCT
bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' AND bdate > GETDATE()

--Data standardization & consistency

SELECT DISTINCT 
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	 ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12
