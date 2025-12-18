-- Data quality checks and transformation for the 
-- bronze.erp_loc_a101 table

INSERT INTO silver.erp_loc_a101
(cid, cntry)

SELECT 
REPLACE(cid, '-' , '') AS cid,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END AS cntry
cntry
FROM bronze.erp_loc_a101 
WHERE REPLACE(cid, '-' , '') AS cid NOT IN
(SELECT cst_key FROM silver.crm_cust_info)



SELECT cst_key FROM silver.crm_cust_info

-- Data Standardization & Consistency 
SELECT DISTINCT cntry
FROM bronze.erp_loc_a101
ORDER BY cntry

