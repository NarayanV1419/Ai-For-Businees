# Introduction
🤖 Corporate AI Adoption — SQL Analysis Project

This project analyzes AI adoption patterns across 8,000 global corporations 
over a 20-year period (2015–2035) using SQL. Working with a synthetic dataset 
covering 14 countries and 10 industries, I explored 4 core business questions 
— from cohort analysis to hypothesis testing — to uncover how AI investment, 
automation, and maturity translate into real financial outcomes.

SQL queries? Check them out here: [SQL Queries Folder](/Scripts/)
# Background
As AI adoption accelerates globally, organizations face a critical question — 
does investing in AI actually deliver measurable results?

This project investigates that question using a structured dataset of 8,000 
corporations across 14 countries and 10 industries spanning 2015 to 2035.

The analysis focuses on 4 specific areas where business leaders often lack 
clarity:

- Whether automation genuinely improves workforce productivity
- Whether employee AI training drives higher adoption
- Which industries are scaling AI deployments the fastest
- Whether AI value concentrates in the most mature companies

## The question I wanted to answer through my SQL queries were:
1. Do companies with higher automation rates actually become more productive — and does this hold true across all industries?
2. Do companies that invest more hours in AI training for employees reach higher AI adoption levels?
3. Which industry scaled up the number of AI deployments most rapidly between 2020 and 2030?
4. Do the top 20% most AI-mature companies account for 80% of all cost savings globally?
# Tools I Used
For my deep dive into corporate AI adoption analytics,
I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to write
  complex queries and uncover meaningful business insights
  from 200,000 rows of corporate data.

- **PostgreSQL:** The chosen database engine, ideal for handling
  large datasets and executing advanced SQL features like CTEs,
  window functions, and subqueries.

- **DBeaver:** My go-to SQL client for writing, running, and
  visualizing query outputs with a clean and intuitive interface.

- **Git & GitHub:** Essential for version control and sharing
  my SQL scripts publicly, ensuring the project is well tracked
  and accessible to the community.
# The Analysis
### 1. Automation & Productivity — Does More Automation Mean More Output?

- Segmented all companies into Low, Mid and High automation tiers
  using CASE WHEN on automation_rate column.
- Calculated average productivity gain per tier across all 10 industries.
- Used a self JOIN to compare High vs Low tier directly per industry
  and flagged anomalies where high automation underperformed.

### 2. Training Hours vs AI Adoption — Does Learning Drive Growth?

- Bucketed companies into Low, Mid and High training hour tiers
  based on employee_ai_training_hours column.
- Calculated average AI adoption level per tier per industry.
- Used a self JOIN to identify industries where more training
  did not lead to higher adoption levels.

### 3. AI Deployment Race — Which Industry Scaled the Fastest?

- Filtered data between 2020 and 2030 to focus on the core
  growth decade.
- Used LAG() window function to calculate year-over-year
  deployment growth per industry.
- Averaged YoY growth per industry and ranked using DENSE_RANK()
  to find the fastest scaling sector.

### 4. The Pareto Test — Do Top AI Companies Drive 80% of Cost Savings?

- Used NTILE(5) to split all 8,000 companies into 5 equal buckets
  ranked by average AI maturity score.
- Calculated each bucket's total cost savings and compared against
  global total using CROSS JOIN.
- Tested whether bucket 1 (top 20%) contributed 80% of all savings.

#  What I Learned

### SQL Technical Skills
- Writing multi-layered CTEs and chaining them together
  to break complex problems into readable steps.
- Using window functions like LAG(), RANK(), DENSE_RANK()
  and NTILE() to solve real analytical problems.
- Applying self JOINs to compare segments within the same
  table — a pattern used heavily in anomaly detection.
- Using CROSS JOIN for attaching a single aggregate value
  to every row without a join key.
- Calculating CAGR directly inside SQL using POWER() function
  — a technique most analysts do in Excel.
- Fixing real errors like duplicate rows, wrong GROUP BY,
  division by zero and incorrect PARTITION BY usage.

### Analytical Thinking
- Breaking a business question into logical steps before
  writing a single line of SQL.
- Understanding when AVG() gives misleading results and
  SUM() tells a more accurate story.
- Learning that disproving a hypothesis (Pareto did not hold)
  is just as valuable as confirming one.
- Identifying anomalies in data — industries where expected
  patterns break down — and treating them as insights.

### Project & Workflow Skills
- Structuring a SQL project professionally with clean folder
  organisation and meaningful file names.
- Writing a portfolio ready README that communicates findings
  clearly to both technical and non technical audiences.
- Using DBeaver for query execution and result validation.
- Managing the project with Git and GitHub for version control.

# Insights

## Productivity Gain by Industry
- Training tier, not industry, drives productivity — High tier scores ~0.68, Mid ~0.44, Low ~0.18 uniformly across all 10 sectors
- High-tier workers are 3.5–4× more productive than Low-tier, a multiplier that holds without exception across every industry
- Education is the only sector with missing High-tier data points, suggesting incomplete representation worth flagging before sector-level conclusions

## Adoption Level by Training Tier
- Adoption is entirely tier-driven — High ≈ 0.82, Mid = 0.53 (zero variance), Low ≈ 0.22 across all industries with near-zero deviation
- Upgrading Low → High tier delivers a 3.7× adoption boost; even Low → Mid nearly doubles it
- Mid tier lands at an almost perfect arithmetic midpoint between Low and High, suggesting a structured scoring model rather than organic measurement

## Industry YoY Growth Ranking
- Growth spread across all 10 industries is just 0.04 (1.86–1.90), indicating a macro tide lifting all sectors equally
- 6 of 10 industries are tied at exactly 1.87 — Telecom alone leads at 1.86, making all rankings below it practically insignificant
- Energy and Technology rank last despite being innovation-heavy — possible signs of market saturation or a measurement window that misses recent acceleration

## Cost Savings & Pareto Analysis
- Pareto principle does not hold — Basket 1 captures only 22.64% of global savings; the cumulative curve rises linearly instead of steeply
- Savings decline gradually from $96.4B (Basket 1) to $70.1B (Basket 5), a ~27% drop, meaning lower-maturity segments still carry significant value
- Total addressable savings = $425.8B globally; even distribution across baskets favors a portfolio strategy over concentrating resources on top-maturity segments only