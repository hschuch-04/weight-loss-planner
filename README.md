# The Manual Weight Loss Planner
<img src="https://github.com/hschuch-04/weight-loss-planner/assets/46430331/25dab6ce-a348-4330-8d18-f0af9f5622c0" width="178" height="389" />

## Introduction
The Manual Weight Loss planner is a mobile application which allows users to input their details and get an estimated calorie amount for the day (based on scientific formulas) depending on their weekly weight loss goals. 

After that they can calculate their calories for the day manually by selecting each day of the week and putting in their meal details, such as calories, protein, fat, etc. This requires the user does it all manually which can be more time consuming than other mobile weight loss apps, however this does give more customization back to the user, and should be for people who are focused on their goal. 

This app came from myself wanting to track my own weight loss journey but didn't like MyFitnessPal due to being restricted in how I input information as I enjoy calculating everything myself and would like to input everything manually, whether and individual food item or a whole meal. So I decided this would not only help with my journey, but be a good project to develop my skills in Mobile App Development.

## The Tech Stack
### Front End
The Front End of the application is built using Flutter for multi-platform development, as I am a solo developer.

### Back End
SQLite is the database I am using to store information for meals for each day of the week, as the storage requirements are small for this scale of project and don't require much strain on the phone itself. It also has an easy to install package SQFLITE which can be imported directly into the project and used.

## Development Experience
I have learnt so much from this project such as page layout and navigation, package dependencies, file structure, re-usable components, etc. This project has helped me also identify keeping scope, as I want to develop more features such as user profiling, and graphing their weight-loss journey however since I'm still learning trying to keep it focused with just Meal Planning and the Calculator first before expanding on, but it's very exciting wanting to further improve the application.

I've also been trying to update to GitHub when significant changes have occurred, such as Database Integration or a new feature has been implemented. 

## Future Goals
Once I am happy with the application and it's features, I want to slowly convert from an offline application to one that used cloud services such as Firebase, to store different people's data which can then be used to help give metrics back to people about the general public.

I want to create a graphing and journey section of the app, to further improve the experience of someones weight loss journey.
