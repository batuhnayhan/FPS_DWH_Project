# FPS (Football Player Stats) DWH Project Details

### Aim of the Project 
The aim of the project is to design a data warehouse to make the performance data of the football players in the matches easier to analyze, visualize and report.

### Tools Used in the Project 
- **Python** : Extracting data with functions and loops using the Selenium library
- **SSIS**: ETL process using Slowly Changing Dimension, Lookup, Conditional Split, Union All etc. components
- **MS SQL Server**: Storing data, to create data warehouse tables and using trigger for the UpdateDate columns

### Project Steps 
- First of all, after analyzing the performance data of the football players in the teams in the 5 big football leagues of Europe on the FBREF site in the last 5 seasons, divided into 11 different fields, the data were scraped using Python's Selenium library. The result was 55 CSV files (These data can be downloaded in csv format for free from the FBREF site, but Python was used to automate the process)
- A data warehouse with star schema is modeled in accordance with this data set. This model has 5 Dimension and 1 Fact table
- Staging and ODS layers are created for transform operations before the data stream from the source to the target system DWH.
- With SSIS, the data of the players in 5 seasons in 11 different fields were first combined with union all and ETL was transferred to the Staging layer.
- 5 Dimension and 1 Fact table in the ODS layer were created and ETL was made to extract the data from Staging with the Truncate – Load method with the necessary transformations.
- Finally, transfer the data from ODS to DWH ETL is done. In this section, data were taken for Dimension tables with the Slowy Changing Dimension method. In the fact table, only the records with Insert, Update or Delete are taken with the Merge code.

### FPS DWH Model - Star Schema

![Star_Schema_MS_SQL_Diagram v2](https://user-images.githubusercontent.com/58702681/146261315-c599de31-931d-40e4-a6d4-d274b3940dcf.PNG)

Data Source: https://fbref.com/en/
