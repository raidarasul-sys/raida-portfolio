-- View total rows and columns
SELECT COUNT(*) AS total_rows FROM energy_consumption;

-- Check distinct values in key columns
SELECT DISTINCT customer_type FROM energy_consumption;
SELECT DISTINCT regions FROM energy_consumption;

-- Descriptive statistics
SELECT 
  ROUND(AVG(energy_cost_brl),2) AS avg_cost,
  ROUND(MIN(energy_cost_brl),2) AS min_cost,
  ROUND(MAX(energy_cost_brl),2) AS max_cost
FROM energy_consumption;

-- Look for missing data
SELECT 
  SUM(CASE WHEN energy_cost_brl IS NULL THEN 1 ELSE 0 END) AS missing_costs,
  SUM(CASE WHEN building_size_m2 IS NULL THEN 1 ELSE 0 END) AS missing_size
FROM energy_consumption;

-- Average energy cost by region
SELECT regions, ROUND(AVG(energy_cost_brl),2) AS avg_cost
FROM energy_consumption
GROUP BY regions;

-- Total energy cost by region
SELECT 
    regions,
    ROUND(SUM(energy_cost_brl), 2) AS total_energy_cost_brl
FROM energy_consumption
GROUP BY regions
ORDER BY total_energy_cost_brl DESC;

-- Cost per m² by customer type and region
SELECT 
    regions,
    customer_type,
    ROUND(SUM(energy_cost_brl) / NULLIF(SUM(building_size_m2), 0), 4) AS cost_per_m2_brl
FROM energy_consumption
WHERE building_size_m2 IS NOT NULL AND building_size_m2 > 0
GROUP BY regions, customer_type
ORDER BY regions, cost_per_m2_brl DESC;

-- Average occupancy and energy cost by region
SELECT 
    regions,
    ROUND(AVG(occupants), 2) AS avg_occupancy,
    ROUND(AVG(energy_cost_brl), 2) AS avg_energy_cost_brl,
    ROUND(AVG(energy_cost_brl) / NULLIF(AVG(occupants), 0), 4) AS avg_cost_per_occupant
FROM energy_consumption
WHERE occupants IS NOT NULL AND occupants > 0
GROUP BY regions
ORDER BY avg_occupancy DESC;

-- Normalized energy cost (BRL per occupant) by customer type
SELECT 
    customer_type,
    ROUND(SUM(energy_cost_brl) / NULLIF(SUM(occupants), 0), 4) AS cost_per_occupant_brl
FROM energy_consumption
WHERE occupants IS NOT NULL AND occupants > 0
GROUP BY customer_type
ORDER BY cost_per_occupant_brl DESC;

-- Standard deviation and variance of energy cost by regions
SELECT 
    regions,
    ROUND(AVG(energy_cost_brl), 2) AS mean_cost_brl,
    ROUND(STDDEV(energy_cost_brl), 2) AS std_dev_brl,
    ROUND(VARIANCE(energy_cost_brl), 2) AS variance_brl
FROM energy_consumption
GROUP BY regions
ORDER BY std_dev_brl DESC;

-- Percentage distribution of regions
SELECT 
    regions,
    COUNT(*) AS total_records,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM energy_consumption), 2) AS pct_of_total
FROM energy_consumption
GROUP BY regions
ORDER BY pct_of_total DESC;

-- Percentage distribution of customer_type
SELECT 
    customer_type,
    COUNT(*) AS total_records,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM energy_consumption), 2) AS pct_of_total
FROM energy_consumption
GROUP BY customer_type
ORDER BY pct_of_total DESC;

-- Overall summary statistics
SELECT 
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(AVG(energy_cost_brl), 2) AS avg_cost_brl,
    ROUND(MIN(energy_cost_brl), 2) AS min_cost_brl,
    ROUND(MAX(energy_cost_brl), 2) AS max_cost_brl,
    ROUND(STDDEV(energy_cost_brl), 2) AS std_dev_cost_brl
FROM energy_consumption;
