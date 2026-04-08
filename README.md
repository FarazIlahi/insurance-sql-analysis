#  Medical Insurance Cost Analysis (SQL Project)

##  Overview
This project analyzes a medical insurance dataset to identify key factors that influence insurance charges. Using SQL, the data was explored through grouping, aggregation, and segmentation techniques to uncover meaningful patterns.

---

##  Objectives
The goal of this analysis is to understand how different variables impact medical insurance costs, including:
- Smoking status
- Age
- Body Mass Index (BMI)
- Number of children
- Geographic region

---

##  Analysis Questions

1. How do medical insurance charges differ between smokers and non-smokers?  
2. How do insurance charges vary across different age groups?  
3. Does the number of children impact insurance charges?  
4. How does BMI influence insurance charges?  
5. Are there significant differences in charges across regions?  
6. How does smoking status affect charges across different age groups?  
7. How does smoking status affect charges across different BMI ranges?  

---

##  Key Insights

- Insurance charges are significantly higher for smokers compared to non-smokers.  
- Charges increase with age, showing a positive relationship between age and cost.  
- The number of children is relatively evenly distributed and does not significantly impact charges.  
- Higher BMI is associated with higher insurance costs.  
- No significant variation in charges was observed across different regions.  
- Smokers consistently incur higher costs across all age groups, indicating smoking is a dominant cost driver.  
- Across BMI ranges, smokers generally have higher costs, though some variation exists in higher BMI groups due to smaller sample sizes and potential outliers.  

---

##  Methodology

- SQL was used for all analysis
- Data was grouped and aggregated using:
  - `GROUP BY`
  - `COUNT()`, `AVG()`, `MIN()`, `MAX()`
- Bucketing techniques were applied using:
  - `FLOOR()` for age and BMI segmentation
- Conditional logic was used with:
  - `CASE` statements for labeling groups
- Comparative analysis was performed using multi-variable grouping (e.g., age + smoker, BMI + smoker)

---

##  Files

- `queries.sql` → Contains all SQL queries used for analysis  
- `README.md` → Project overview, methodology, and insights  

---

##  Key Takeaways

This project demonstrates the ability to:
- Perform data aggregation and segmentation in SQL  
- Analyze relationships between multiple variables  
- Identify trends and validate findings with data  
- Communicate insights clearly and effectively  

---

##  Future Improvements

- Perform regression analysis to quantify relationships  
- Analyze median costs to reduce impact of outliers  
- Visualize findings using Python (Pandas/Matplotlib or Tableau)  
