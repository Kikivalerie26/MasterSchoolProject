/*Question #1: 
How has the revenue of Instagram changed over the 
years? Provide a summary of total revenue per year 
for Instagram.*/
SELECT PARENT_COMPANY,
				YEARS,
			 SUM(revenue) AS total_revenue
FROM meta_revenue
WHERE PARENT_COMPANY = 'Instagram'
	GROUP BY PARENT_COMPANY,
  					YEARS
  ORDER BY TOTAL_REVENUE
;


/*Question #2: 
What is the revenue in 2022 and 2021  generated by the 
Video ad type on both platforms (Facebook and 
Instagram) combined? Did revenue grow?*/

SELECT 
			 YEARS,
			 SUM(revenue) AS total_revenue
FROM META_REVENUE
WHERE 
 YEARS IN ('2022', '2021')
	GROUP BY  --AD_TYPES, --,PARENT_COMPANY,
  					YEARS
 -- ORDER BY TOTAL_REVENUE
;


/*Question #3: 
Create a column called “ad_products” that creates one
value that groups the Display ad types together and 
one value that groups the Video ad types together. 
What is the total revenue generated by each ad 
product? */

SELECT
  CASE
    WHEN AD_TYPES like '%Video%' THEN 'Video'
    WHEN AD_TYPES like '%Display%' THEN 'Display'
    ELSE AD_TYPES
  END AS ad_products,
  SUM(revenue) AS total_revenue
FROM
  META_REVENUE
--WHERE
 -- AD_TYPES IN ('Video', 'Display')
GROUP BY
  ad_products
ORDER BY
  total_revenue DESC;
  
  


/*Question #4: 
Can you identify the ad_id of Video ads that have 
generated over 2 million in revenue in 2022? 
Note: the revenue numbers are already in millions, 
so 2 million will show up as 2 in the data.*/

SELECT AD_ID,
		SUM(REVENUE) AS TOT_REV
	FROM META_REVENUE
  WHERE YEARS = 2022
  AND ad_types like '%Video%'
  
  GROUP BY AD_ID 
  
  HAVING SUM(REVENUE)>2
  ORDER BY TOT_REV ASC
  ;

  SELECT PARENT_COMPANY,
  			 YEARS,
  		SUM(REVENUE) AS TOTAL_REVENUE
   FROM META_REVENUE
   GROUP BY PARENT_COMPANY, YEARS
  HAVING SUM(REVENUE) > 500
   ;

  SELECT * FROM meta_revenue LIMIT  5