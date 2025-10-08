# restaurant-recommendations-engine

A location-aware restaurant recommender that personalizes results using a mix of **collaborative filtering (ALS)**, **geo-distance re-ranking**, and **content-based features** like cuisine and price range.  
Handles **cold-start** recommendations for new users and new restaurants.

---

## Project Overview
This project uses the [Yelp Open Dataset](https://www.yelp.com/dataset) to build an end-to-end recommendation pipeline:

1. **Data preparation** – parse raw Yelp JSON files and save clean Parquet datasets  
2. **Popularity baseline** – rank restaurants by a confidence-adjusted (Wilson) score  
3. **Collaborative Filtering (ALS)** – learn user–restaurant preferences from reviews  
4. **Re-ranking** – combine CF scores with distance and content similarity  
5. **Cold-start strategies** – provide sensible recs for brand-new users and items  
6. **Serving layer** – expose results via a FastAPI service and a Streamlit demo app  

---

## Tech Stack
- **Python:** pandas, numpy, scipy, scikit-learn  
- **Modeling:** implicit (ALS collaborative filtering)  
- **API:** FastAPI + Uvicorn  
- **Dashboard:** Streamlit  
- **Utilities:** pytest, black, isort, GitHub Actions CI  

---
## Folder Structure
restaurant-recommendations-engine/
│
├── data/ # (ignored) raw and processed Yelp data
├── src/ # main code (data_prep, models, api, etc.)
├── scripts/ # command-line utilities
├── tests/ # unit and integration tests
├── notebooks/ # exploration and EDA
├── dashboards/ # Streamlit demo app
├── docs/ # roadmap, diagrams, reports
├── requirements.txt # dependencies
├── Makefile # helper commands
└── README.md

---
##  Quick Start
```bash
# 1. Create and activate a virtual environment
python3 -m venv .venv
source .venv/bin/activate

# 2. Install dependencies
pip install -r requirements.txt

# 3. Download Yelp data (see data/README.md)
#    Place files under data/raw/

# 4. Run preprocessing
python src/data_prep.py

# 5. Run tests
pytest -q