-- adv data cleaning, changing datatypes and updating dataset.

ALTER TABLE dataset1
  MODIFY Growth decimal(10,2);
 
ALTER TABLE dataset1
  MODIFY Literacy int;
  
SET SQL_SAFE_UPDATES = 0;

update dataset2
SET population = replace(population, ',', '');

alter table dataset2
  modify population bigint;
  
update dataset2
SET area_km2 = replace(area_km2, ',', '');

alter table dataset2
  modify area_km2 bigint;
  
  
-- eyeing the whole data

SELECT 
   *
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY District asc;   


-- 1) population of districts /

SELECT
   district,
   dataset1.state,
   population
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY population desc;

-- 2) top 3 most populated districts/

SELECT
    district,
    dataset1.state,
    population
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY population desc limit 3;

-- 3) population of a district vs growth rate (growth is in %)/

SELECT 
   district,
   dataset1.state,
   population,
   growth
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY growth desc, population; 

-- 4)growth rate and its link withb population
  
SELECT
   population,
   growth
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY populatioN desc;

-- 5) top 3 growth rate districts

SELECT 
   district,
   dataset1.State,
   population,
   growth
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY growth desc limit 3;

-- 6) population of a district vs sex ratio/ ordered by growth /

SELECT 
   district,
   dataset1.State,
   sex_ratio,
   population
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY sex_ratio desc;


-- 7) population of a district vs sex ratio / ordered by population/


SELECT 
   district,
   dataset1.State,
   sex_ratio,
   population
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY population desc;

-- 8) population of districts vs area_km2 / ordered by area_km2/

SELECT
   district,
   dataset1.state,
   population,
   area_km2
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY area_km2 desc;
   
-- 9) population of districts vs area_km2 / ordered by population/

SELECT
   district,
   dataset1.state,
   population,
   area_km2
FROM
   dataset1
LEFT JOIN dataset2
   USING (district)
ORDER BY population desc;

-- 10) growth vs sex ratio by district/ ordered by growth 

SELECT 
   district,
   state,
   Growth,
   sex_ratio
FROM
   dataset1
ORDER BY growth desc;   
   
-- 11) growth vs sex ratio by district/ ordered by sex_ratio

SELECT 
   district,
   state,
   Growth,
   sex_ratio
FROM
   dataset1
ORDER BY sex_ratio desc;

-- 12) growth vs literacy by district / ordered by literacy

SELECT 
   district, 
   state,
   growth,
   literacy
FROM
   dataset1
ORDER BY literacy desc;

-- 13) growth vs literacy by district/ ordered by growth

SELECT 
   district, 
   state,
   growth,
   literacy
FROM
   dataset1
ORDER BY growth desc;


-- 14) top 5 state with highest literacy rate

SELECT 
   district,
   state,
   literacy
FROM 
   dataset1
WHERE literacy > 96
ORDER BY literacy desc;

-- 15) literacy vs sex ratio by district/ ordered by literacy/

SELECT
   district,
   state,
   sex_ratio,
   literacy
FROM
   dataset1
ORDER BY literacy desc;   
   
-- 16) literacy vs sex ratio by district/ ordered by sex ratio/

SELECT
   district,
   state,
   sex_ratio,
   literacy
FROM
   dataset1
ORDER BY sex_ratio desc;   


-- 17) avg growth per state/


SELECT 
    state,
    AVG(growth) as avg_growth 
FROM 
   dataset1
GROUP BY 
   state
ORDER BY avg(growth) desc;  


-- 18) avg literacy rate per state/

SELECT
    state,
    AVG(literacy) as avg_literacy_rate
FROM
    dataset1
GROUP BY 
    state
ORDER BY 
    AVG(Literacy) desc;    
    
--  19( avg sex ratio per state/


SELECT
   state,
   AVG(sex_ratio) as avg_sex_ratio
FROM
   dataset1
GROUP BY 
   state
ORDER BY
   AVG(sex_ratio) desc;   
   
-- 20) top 3 lowest sex ratio/


SELECT
   state,
   sex_ratio
FROM
   dataset1
GROUP BY 
   state
ORDER BY
   sex_ratio asc limit 3;
   
-- 21)top 3 lowest literacy rate/

SELECT
   state,
   Literacy
FROM
   dataset1
GROUP BY 
   state
ORDER BY
   literacy asc limit 3;
     