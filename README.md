# The Manual Weight Loss Planner
<img src="https://github.com/hschuch-04/weight-loss-planner/assets/46430331/25dab6ce-a348-4330-8d18-f0af9f5622c0" width="178" height="389" />

## Introduction
The Manual Weight Loss planner is a mobile application which allows users to input their details and get an estimated calorie amount for the day (based on scientific formulas) depending on their weekly weight loss goals. 

After that they can calculate their calories for the day manually by selecting each day of the week and putting in their meal details, such as calories, protein, fat, etc. This requires the user does it all manually which can be more time consuming than other mobile weight loss apps, however this does give more customization back to the user, and should be for people who are focused on their goal. 

It also has a graphing section where you can put input your weight for the day, and it will give a basic graph, storing all your previous information to be used as a trajectory.

## The Tech Stack
### Front End
The Front End of the application is built using Flutter for multi-platform development, as I am a solo developer.

### Back End
SQLite is the database I am using to store information for meals for each day of the week, as the storage requirements are small for this scale of project and don't require much strain on the phone itself. It also has an easy to install package SQFLITE which can be imported directly into the project and used.

## Development Experience
I have learnt so much from this project such as page layout and navigation, package dependencies, file structure, re-usable components, etc. This project has helped me also identify keeping scope, as I want to develop more features such as user profiling, and graphing their weight-loss journey however since I'm still learning trying to keep it focused with just Meal Planning and the Calculator first before expanding on, but it's very exciting wanting to further improve the application.

I've also been trying to update to GitHub when significant changes have occurred, such as Database Integration or a new feature has been implemented. 
