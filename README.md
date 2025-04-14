# Test task for BI-analyst

## Overview

This project is a test task for the BI Analyst role. \
The main task - to analyse data about sales and calculate a few metrics. 

## Structure 

The main files are Jupyter Notebooks.
- Notebook ```general_info``` contains the first information about customers and sales.
- Metrics MRR, ARR, and ARPU are calculated in ```metrics``` Notebook.
- Discount analysis is in ```discount_analysis``` Notebook.
- Notebook ```transition_paths``` calculates popular product transition paths.

.py files are service functions for working with the DB, making charts, and formatting reports.\
.sql files contain queries for calculating metrics and using them in Notebooks.

## How to use

**1. Start a database using this command:**
```bash
docker compose up -d
```

**2. Connect to the DB with the credentials below:**
```
    port: 5432
    POSTGRES_USER: jet
    POSTGRES_PASSWORD: brains
```

**3. Create a table**

Run ```create_table.sql``` file.


**4. Fill the database with data**

Use the IDE's features to insert data from a CSV file into a database.


## Creating PDF-reports

To convert all Notebooks to PDF-reports, execute the following command:
```bash
jupyter nbconvert --no-input --output-dir=out --to pdf  .\*.ipynb
```


