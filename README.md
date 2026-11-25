## 📌 Project Description

The **SQL Data Warehouse and Analytics Project** is an end-to-end data engineering and analytics solution designed to build a modern data warehouse using Microsoft SQL Server.

The project focuses on integrating data from two different source systems — **Enterprise Resource Planning (ERP)** and **Customer Relationship Management (CRM)** — provided in CSV format. The objective is to consolidate data from these systems into a centralized data warehouse, transforming raw data into a clean, consistent, and business-ready format for analytical reporting.

The solution follows the **Medallion Architecture**, consisting of three layers:

- **Bronze Layer:** Stores raw data ingested directly from the ERP and CRM CSV files, preserving the original source data.
- **Silver Layer:** Performs data cleaning, standardization, transformation, and normalization to improve data quality and consistency.
- **Gold Layer:** Organizes the transformed data into a business-oriented model using fact and dimension tables based on a Star Schema, making it suitable for analytical queries and reporting.

The project also involves developing SQL-based ETL pipelines to extract, transform, and load data across the warehouse layers, along with data quality checks to validate the accuracy and consistency of the transformed data.

In the analytics phase, SQL queries are developed to explore key business areas, including:

- **Customer Behavior:** Understand customer characteristics and purchasing patterns.
- **Product Performance:** Evaluate product-level performance and sales contributions.
- **Sales Trends:** Analyze sales performance and identify meaningful business trends.

### 🎯 Project Objectives

- Design and implement a modern data warehouse using SQL Server.
- Integrate ERP and CRM data into a centralized analytical environment.
- Implement Bronze, Silver, and Gold layers using Medallion Architecture.
- Develop SQL-based ETL pipelines for data ingestion and transformation.
- Apply data cleaning and data quality validation techniques.
- Design fact tables, dimension tables, and a Star Schema.
- Perform SQL-based business analysis to generate actionable insights.
- Maintain technical documentation covering architecture, data flows, and data models.

This project demonstrates practical skills in **SQL Development, Data Engineering, ETL Processes, Data Warehousing, Data Modeling, and Data Analytics**.