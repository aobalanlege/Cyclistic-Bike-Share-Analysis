# Cyclistic-Bike-Share-Analysis
The purpose of this analysis is to understand the usage patterns of casual riders and annual members at Cyclistic, a bike-share company in Chicago. The marketing team aims to design a strategy to convert casual riders into annual members. The findings are backed by compelling data insights and professional visualizations.

# Cyclistic Data Analysis Project

## Project Overview
As a data analyst on the marketing team at Cyclistic, the goal is to analyze user behavior patterns to distinguish between casual riders and annual members. The insights derived will inform a targeted marketing strategy aimed at converting casual riders into annual members. The success of the proposed recommendations relies on obtaining approval from Cyclistic executives, emphasizing the need for compelling data insights and professional data visualizations.

## Data Analysis Process
### Tools Used
- Spreadsheet (Microsoft Excel)
- SQL (BigQuery)
- Tableau

### Steps
1. **Ask**
   - **Context:** In 2016, Cyclistic launched a bike-share program with 5,824 bikes and 692 stations in Chicago.
   - **Business Task:** Develop marketing strategies to convert casual riders into annual members.
   - **Business Questions:**
     1. How do annual members and casual riders use Cyclistic bikes differently?
     2. Why would casual riders buy Cyclistic annual memberships?
     3. How can Cyclistic use digital media to influence casual riders to become members?

2. **Prepare**
   - **Data Source:** Cyclistic historical data trips from January 2022 to December 2022.
   - **Data Preparation:**
     - Obtained 12 files (1 GB total) corresponding to each month.
     - Organized and stored them in CSV format in a subfolder called "DATA."

3. **Process**
   - **Data Cleaning:**
     - Checked for incomplete values and deleted rows with missing data.
     - Removed unnecessary columns (start_lat, start_lng, end_lat, end_lng).
     - Checked for duplicate values in ride_id.
     - Checked for invalid values in rideable_type and member_casual.
     - Created additional columns for ride_length and day_of_week.
   - **Data Transformation with SQL (BigQuery):**
     - Merged 12 tables into one (cyclistic_2022).
     - Created a final table for analysis (bike_share) with additional columns for month, day, and hour.

4. **Analyse**
   - **Ride Length Analysis:**
     - Distribution of ride lengths for annual members and casual riders.
     - Average ride length for members and casual users.
   - **Ride Frequency Patterns:**
     - Ride frequency by day, month, and hour for both user types.
   - **Ride Preferences and Behavior:**
     - Rideable type preferences, popular start and end stations for both user types.

5. **Share**
   - Used Tableau for data visualization.
   - Visualizations include:
     - Proportion of casual and member riders.
     - Ride preferences for members and casual users.
     - Frequency of ride usage by month, day of the week, and hour.

6. **Act**
   - Developed insights for targeted marketing strategies based on usage trends.
   - Recommendations include targeted marketing campaigns, promotional benefits, increased bike availability, and partnerships with local businesses.
   - Suggestions for future analysis include exploring demographic information, trip purposes, and weather data.

## Application of Insights
1. **Targeted Marketing Campaigns:**
   - Highlight benefits of annual subscriptions.
   - Emphasize convenience, cost-effectiveness, and consistent riding experiences.
2. **Promotional Benefits:**
   - Offer special promotions or discounts for switching to annual memberships.
   - Clearly communicate the value proposition.
3. **Increased Availability of Bikes:**
   - Adjust bike allocation based on usage trends.
   - Ensure enough classic bikes are accessible, considering their popularity among annual members.
4. **Develop Partnerships:**
   - Partner with businesses near popular start and end stations.
   - Offer discounts or rewards to riders.

## Recommendations for Future Analysis
- **Demographic Information:**
  - Analyze age, gender, and geographical preferences of riders.
  - Adjust marketing campaigns based on demographic segments.
- **Trip Purpose:**
  - Collect data on trip purposes (commuting, leisure, exercise).
  - Tailor messaging for targeted purposes.
- **Weather Data:**
  - Include weather data to understand how seasonal variations impact rider behavior.
  - Design promotions or incentives accordingly.

## Project Completion
This project was completed as part of the requirements for the Google Data Analytics Professional Certificate program.

To read the full analysis, please visit [Cyclistic User Analysis](https://medium.com/@adewaleobalanlege/cyclistic-user-analysis-how-does-a-bike-share-navigate-speedy-success-973d24a41950)
