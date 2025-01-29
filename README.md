 # Game Analystics: Unlocking Tennis Data with SportRadar API

 ## PROJECT OVERVIEW
 
 This SportRador Event Explorer is a comprehensive solution for managing, visualizing, and analyzing sports competition data from the Sportradar API. This application extracts, processes, and stores structured event data in a relational database while providing interactive insights into tournaments, competition hierarchies and event details.
 
 ## TOOLS USED:

 ### SPORTRADAR API

 Sportradar API provides access to real-time and historical sports data, including match schedules,player statistics,rankings and event details. It offers structured JSON data that allows seamless integration into sports analytics applications.

 #### How it's Used in This Project:

 In this project, the Sportradar API is utilized to:

 1. Extract Tennis Competition Data
    * Retrieve details about various competitions
    * Organize them into categories and competition hierarchies.
 2. Fetch Venue & Complex Information
    * Get data on sports complexes and venues where matches are held.
    * Store venue details like location,timezone and associated competition.
 3. Analyze Player Rankings
    * collect doubles competitor rankings,including points,rank movement, and competitions played.
    * General Leaderboard and country-wise Rankings.
 4. Enable Real-time Data Exploration
    * The API allows dynamic,updates in the database.
    * Users can interactively explore tournaments,players and match location through the Streamlit dashboard.

  #### API Endpoints USED
  * Competitions Data -> [Competitions](https://developer.sportradar.com/tennis/reference/competitions)
  * Complexes Data -> [Complexes Data](https://developer.sportradar.com/tennis/reference/complexes)
  * Doubles Competitor Rankings -> [Competitor Rankings](https://developer.sportradar.com/tennis/reference/doubles-competitor-rankings)

### PYTHON LANGUAGE

Python is a versatile, high-level programming language known for its simplicity and readability.In this project, Python is used for API integration, data extraction, and building the Streamlit application.

### STREAMLIT 

Streamlit is an open-source app framework that allows to create interactive web applications quickly and with minimal code. Without web development skills with Streamlit we can turn Python scripts into fully interactive apps in just a few lines of code making it great for building dashboards. In this project A web application built with Streamlit allows users to explore and visualize data through interactive dashboards, filters, and leaderboards.

### POSTGRESQL

PostgreSQL is a powerful, open-source relational database management system known for its reliability, scalability, and support for advanced data types. It uses SQL for querying and offers features like ACID compliance, complex joins, and support for custom functions.In this project it Stores and organizes the extracted competition, venue, and player ranking data for efficient querying and analysis.

### LIBRARIES REQUIRED

  1. requests(API calls)
  2. pandas (Data transformation)
  3. psycopg2 (Database connection)
  4. streamlit (UI development) 

### PROJECT FEATURES:
  * Retrieve and Store Tennis Event Data from Sportradar API.
  * Organize Tournament based on competitions.
  * Analyze player Rankings.
  * Store and Query Data using an SQL database.
  * Built an Interactive Dashboard with Streamlit to visualize insights.
  * Search and Filter player and competition details dynamically.



    
 

