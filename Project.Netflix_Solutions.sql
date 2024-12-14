# Netflix Dataset Analysis Project

This project involves analyzing a dataset of Netflix content to answer 15 business-related questions. The goal is to extract actionable insights and provide solutions to these problems using SQL queries. Below is an overview of the project, along with instructions for setup and usage.

---

## Overview

Netflix is one of the leading streaming platforms globally, with thousands of titles in its library. This project aims to analyze the Netflix dataset to address various business problems, such as:

- Understanding the composition of content (Movies vs TV Shows).
- Identifying trends in ratings, genres, and release years.
- Gaining insights into country-specific contributions and actor involvement.
- Categorizing content based on specific keywords in descriptions.

By answering these questions, the project demonstrates the practical application of SQL in real-world scenarios, especially for data analysis and business intelligence purposes.

---

## Dataset

The dataset used in this project contains the following columns:

- **show_id**: Unique identifier for each content item.
- **show_type**: Indicates whether the content is a "Movie" or "TV Show".
- **title**: Title of the content.
- **director**: Name(s) of the director(s) of the content.
- **casts**: Names of the actors in the content.
- **country**: Country of origin for the content.
- **release_year**: Year the content was released.
- **rating**: Age rating of the content.
- **duration**: Duration of the content (minutes for Movies or seasons for TV Shows).
- **listed_in**: Genres/categories of the content.
- **description**: Short description of the content.
- **date_added**: Date the content was added to Netflix.

---

## Business Problems and Solutions

The SQL code containing all solutions to the 15 business problems can be found in the following file:

**File Path:** `Project.Netflix_Solutions.sql`

### 1. Count the number of Movies vs TV Shows
Query to compare the total number of Movies and TV Shows available on Netflix.

### 2. Find the most common rating for Movies and TV Shows
Query to identify the most frequent rating for each type of content.

### 3. List all Movies released in a specific year (e.g., 2020)
Query to extract all Movies released in the year 2020.

### 4. Find the top 5 countries with the most content on Netflix
Query to determine the top contributing countries, accounting for multiple countries listed per content item.

### 5. Identify Movies with the longest duration
Query to find Movies with the maximum duration.

### 6. Find content added in the last 5 years
Query to extract content added within the last five years.

### 7. Find all Movies/TV Shows by a specific director
Query to filter content directed by "Rajiv Chilaka."

### 8. List all TV Shows with more than 5 seasons
Query to identify TV Shows with more than 5 seasons.

### 9. Count the number of content items in each genre
Query to break down content based on the genres listed in the "listed_in" column.

### 10. Find each year and the average number of content releases in India
Query to calculate the yearly average number of content releases in India and return the top 5 years.

### 11. List all Movies that are documentaries
Query to identify Movies categorized under "Documentaries."

### 12. Find all content without a director
Query to extract content entries that lack a director.

### 13. Count the number of Movies actor "Salman Khan" appeared in over the last 10 years
Query to find Movies featuring "Salman Khan" released in the last decade.

### 14. Find the top 10 actors appearing in the highest number of Indian Movies
Query to identify the most frequent actors in Indian Movies on Netflix.

### 15. Categorize content based on the presence of keywords 'kill' and 'violence' in the description
Query to classify content as "Good" or "Bad" based on keywords in the description and count the items in each category.

---

## Requirements

- **SQL**: The queries are designed to work with MySQL or MariaDB.
- **MySQL Workbench**: Used to run the queries and analyze the results.

---

## Setup and Usage

1. **Import the Dataset**
   - Load the dataset into your MySQL database.

2. **Run Queries**
   - Execute the SQL queries in the provided order to analyze the data and answer the questions.

3. **Modify for Custom Analysis**
   - Adjust the queries as needed to explore other insights or solve additional problems.

---

## Insights and Learnings

This project demonstrates the power of SQL in solving real-world business problems, such as:

- Data cleaning and transformation using SQL functions.
- Aggregating and analyzing data with `GROUP BY`, `WITH`, and subqueries.
- Extracting valuable insights for decision-making in the entertainment industry.

---

## Contribution

Feel free to contribute to this project by:

- Improving the SQL queries.
- Adding more business questions.
- Optimizing the dataset for better analysis.

---

## Contact

For questions or suggestions, please reach out to me via GitHub or email.

---

## License

This project is licensed under the MIT License.

---

