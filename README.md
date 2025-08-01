# 🦠 COVID-19 Data Analysis & Visualization

A full-cycle data analysis project that explores the spread, mortality, and vaccination patterns of the COVID-19 pandemic across countries and continents using SQL, Python, and Power BI.

---

## 1. 📘 Background and Overview

The COVID-19 pandemic has affected millions globally, and understanding its trends is crucial for public health preparedness. This project integrates datasets on COVID-19 cases, deaths, and vaccinations to answer key questions:

- Which countries had the highest infection and mortality rates?
- How effective were vaccination campaigns?
- Which regions are most/least prepared for future outbreaks?

The project uses:

- Microsoft SQL Server for data preprocessing and KPI extraction  
- Python (Pandas, Seaborn, Matplotlib) for exploratory data analysis  
- Power BI for creating an interactive executive dashboard

---

## 2. 🧾 Data Structure Overview

Two primary datasets were merged on country and date:

📃 CovidDeaths.csv  
Fields: country, continent, date, population, total_cases, total_deaths, new_cases, new_deaths, icu_patients, hospital_beds_per_thousand

📃 CovidVaccinations.csv  
Fields: country, date, new_vaccinations, people_fully_vaccinated_per_hundred, total_vaccinations

Key Measures Computed:
- Infection Rate = (Total Cases / Population) × 100  
- Death Rate = (Total Deaths / Population) × 100  
- Mortality Rate = (Total Deaths / Total Cases) × 100  
- Vaccination % = (Total People Vaccinated / Population) × 100  

---

## 3. 📊 Executive Summary

🌍 Global Highlights:

- 🌡 Highest infection rate: Brunei (76.99%), San Marino (74.24%)
- ⚰️ Highest mortality rate: Peru (6604 deaths per million), Bulgaria (5679)
- 💉 Most vaccinated countries: Gibraltar (112%), Nauru (111%), Brunei (99%)
- ⚠️ Least vaccinated countries: Burundi (0.28%), Yemen (2.75%)
- 🟢 Lowest mortality rate countries: Vatican, Tokelau, Falkland Islands (0 deaths)

🌐 Continent-wise Death Rates:

| Continent       | Death Rate (%) |
|-----------------|----------------|
| South America   | 0.3157         |
| North America   | 0.2824         |
| Europe          | 0.2818         |
| Oceania         | 0.0739         |
| Asia            | 0.0345         |
| Africa          | 0.0179         |

---

## 4. 🔍 Insights Deep Dive

📌 Top Insights:

- 🇷🇸 Brunei not only had the highest infection rate (76.99%) but also one of the highest cases per million (769K), suggesting widespread testing and small population effects.
- 🇵🇪 Peru recorded the highest deaths per million (6604), indicating a possible healthcare capacity challenge.
- 🇺🇸 The United States reported the highest total cases (103M) and total deaths (1.22M) globally.
- 🏥 Falkland Islands, Vatican, and Saint Helena reported zero COVID-19 deaths.
- 💉 Countries like Gibraltar and Nauru vaccinated more than 100% of their population (due to inclusion of non-residents/workforce).
- 🔻 Countries like Burundi and Yemen had alarmingly low vaccination rates (<5%).

📊 SQL and Python were used to create time-trend graphs, correlation charts, and deep filters for infection, mortality, and vaccination analytics.

---

## 5. ✅ Recommendations

🎯 Based on the analysis, key actions for health policymakers and stakeholders include:

- Prioritize global vaccine equity: Countries like Burundi and Haiti need urgent vaccine access.
- Strengthen healthcare systems in high-death-rate regions (e.g., Peru, Bulgaria).
- Use dashboards like this for real-time monitoring and early warnings.
- Invest in digital tracking systems to ensure accurate case/death reporting.
- Encourage booster and outreach programs in countries with plateaued vaccination rates.

---

📂 Project Files:

- SQLQuery1.sql – all key metric queries  
- Covid_Analysis.ipynb – Python-based EDA + visualizations  
- Power BI Dashboard – [screenshot or .pbix available]  

🗜️ Explore interactive insights on vaccination, death trends, and more.

📬 For feedback or collaboration, feel free to connect!
