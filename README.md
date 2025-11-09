# Energy Consumption Analysis for SQL Analytics

## **Executive Summary**
This project uses SQL to analyze residential and commercial energy consumption data, uncovering cost variations across regions and customer types. By building queries that aggregate, normalize, and correlate key variables, I identified that commercial properties consume significantly more per occupant and that the Southeast region has the highest average energy cost. This analysis supports energy-efficiency initiatives and better resource allocation strategies.

*All cost calculations are in Brazilian Real (BRL) and measure per square meter*


### **Business Problem**
Energy costs can vary widely depending on building type, size, and occupancy. Utility companies and policymakers need insight into which regions and property types are least efficient to design targeted energy-saving programs. 

**Methodology**
1. Data Exploration & Cleaning 
2. Descriptive & Statistical Analysis 
3. Aggregation & Comparative Analysis 
4. Distribution Analysis

## Key Performance Indicators (KPIs)

| **Category** | **KPI** | **Value / Insight** |
|:-------------|:--------|:--------------------|
| **Data Quality** | Missing Values | 0 |
|  | Duplicate Records Removed | 48 |
|  | Normalized Fields Created | Cost per m², Cost per Occupant |
| **Regional Insights** | Highest Avg. Energy Cost | Southeast (88.1 BRL) |
|  | Lowest Avg. Energy Cost | Midwest (84.7 BRL) |
|  | Regional Cost Gap | 3.4 BRL difference (≈ 4%) |
| **Customer Type Insights** | Avg. Commercial Cost per Occupant | 1.82 BRL |
|  | Avg. Residential Cost per Occupant | 1.01 BRL |
|  | Commercial Share of Energy Cost | 58% of total national consumption (40% of customers) |
| **Statistical Summary** | Mean Cost | 86.7 BRL |
|  | Median Cost | 81.9 BRL |
|  | Mode Cost (Range) | ≈ 80–85 BRL cluster |
|  | Std. Deviation | ± 24.3 BRL |
|  | Variance | ≈ 592 BRL² |
|  | Distribution Shape | Right-skewed |

*Insight*
The dataset demonstrates strong cost concentration in the Southeast and among commercial properties, suggesting significant optimization potential through region-targeted policies and per-occupant billing models.

## **Results**
- The Southeast region had the highest total energy cost, contributing 22.4% of total national consumption and an average cost of 88.1 BRL per record. 
- The Midwest region had the lowest average, at 84.7 BRL, with a 4% difference from the highest. 
- Regions with higher average occupancy exhibited 8–10% higher total consumption, indicating that energy usage scales faster than occupancy growth. 
- Commercial properties accounted for 40% of total customers and 58% of total energy costs, indicating a 1.45 times cost-to-customer ratio imbalance. 
- The average commercial energy cost per occupant accounted for 1.82 BRL, compared to residential, which accounted for 1.01 BRL, indicating an 80% higher per-person cost.


<!-- First row: two charts side by side -->
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/raidarasul-sys/raida-portfolio/blob/main/visuals/distribution_percentage_customer_type.png" width="420"><br>
      <sub><b>Distribution Percentage of Customer Type</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/raidarasul-sys/raida-portfolio/blob/main/visuals/distribution_percentage_regions.png" width="500"><br>
      <sub><b>Distribution Percentage of Regions</b></sub>
    </td>
  </tr>
</table>

<!-- Second row: single wide chart -->
<p align="center">
  <img src="https://github.com/raidarasul-sys/raida-portfolio/blob/main/visuals/energy_cost_distribution_histogram.png" width="850"><br>
  <sub><b>Energy Cost Distribution</b></sub>
</p>

**Operational Recommendations**
- Introduce occupancy-adjusted billing models to improve fairness and cost predictability. 
- Focus on cost-reduction programs in high-consumption regions (Southeast). 
- Develop dashboards to monitor per-occupant cost trends and highlight outliers (high-cost buildings).

**Skills Used** 
- **Language:** SQL 
- **Database:** MySQL 
- **Tools:** Excel, Tableau
