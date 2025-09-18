# 🎬 MovieLens Data Pipeline with dbt

## 📌 Project Overview
This project demonstrates **modern data architecture** practices using the [MovieLens dataset](https://grouplens.org/datasets/movielens/).  
It simulates a real-world analytics workflow for a streaming platform (like Netflix) and covers all the key **dbt features**:

- Modern Data Architecture
- dbt Models (staging, intermediate, marts)
- Seeds & Sources
- Slowly Changing Dimensions (SCD)
- Snapshots
- Testing
- Macros
- Packages
- Documentation
- Analytical exploration on the MovieLens dataset

---

## 🏗️ Modern Data Architecture
This project follows a **layered approach**:

1. **Raw Layer** – Ingested raw tables from MovieLens dataset.  
2. **Staging Layer** – Standardized naming, column formatting, and applied basic cleaning.  
3. **Intermediate Layer** – Business logic transformations (joins, enrichments, SCD handling).  
4. **Mart Layer** – Final dimensional and fact tables designed for analytics.  

---

## 📂 Dataset Description
The MovieLens dataset contains the following tables:
  
- **Movies** – Movie metadata (`movieId`, `title`, `genres`).  
- **Links** –  ('IMDB','TMDB','movieIDs').  
- **Tags** – User-generated tags for movies('userid','movieid','tag','tagtimestamp').  
- **Genome Scores** – Relevance scores between movies and tag categories.  
- **Ratings** – User ratings for movies (`userId`, `movieId`, `rating`, `timestamp`).  

---

## ⚙️ dbt Features Implemented

### 1. Models
- **Staging Models (`stg_*`)**: Clean and standardized source tables.  
- **Intermediate Models (`int_*`)**: Business logic such as aggregations and joins.  
- **Mart Models (`dim_*`, `fct_*`)**: Final reporting-friendly tables (dimensions & facts).  

### 2. Seeds & Sources
- **Seeds**: Static reference data such as genre mappings.  
- **Sources**: Raw tables declared in `sources.yml`.  

### 3. Slowly Changing Dimensions (SCD)
- Implemented **Type 2 SCD** for the `movies` table.  
- Tracked changes in movie metadata (title/genre updates) over time.  

### 4. Snapshots
- Snapshots created for `users` table.  
- Allowed historical tracking of user profile changes.  

### 5. Testing
- **Generic Tests**: `unique`, `not_null`, `accepted_values`.  
- **Custom Tests**: Relavance score>=0.  

### 6. Macros
- Custom macros for:  
  - Generating surrogate keys.  
  - Date transformations.  
  - Reusable business logic (e.g., user activity categorization).  

### 7. Packages
- Used **dbt_utils** for:  
  - Surrogate keys.  
  - Advanced schema tests.  
  - Convenience macros.  

### 8. Documentation
- YAML docs for each source and model.  
- Auto-generated lineage graphs via `dbt docs`.  

---

## 🚀 How to Run
1. Clone this repository.  
2. Install dbt packages:  
   ```bash
   dbt deps
