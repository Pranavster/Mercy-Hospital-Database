# Mercy-Hospital-Database
Mercy Hospital Database is an MySQL based application intended to simulate a database of a hospital. It includes functions for establishing connections between SQL and Python, which in turn is used to create a table for patients and staff, reading data into the table from a CSV, updating the table through specific queries, including OLAP queries, and deleting the table. Additionally, a GUI through Tkinter has been created which allows for a more user-friendly interface.

# ERD Hospital Database
![image](https://github.com/user-attachments/assets/374daa12-af32-4eff-ae4a-1487a3756bb9)

This hospital database includes entities such as doctors, departments, nurses, patients, schedules, referals, and individual procedures, most of which are strong entities with their own primary keys. Most of the entity relationships are one to one, one to many, or many to one.

# Explanation of Front End
This Tkinter based GUI includes operations for modifying the patient and staff databases as well as the schedule. Labels are used to describe which information needs to be entered; for example, when creating the patient, the date of birth and first and last names of the patient are requested, as well as the doctor's name. Text input fields are used to enter values. Buttons are used to allow queries to be executed, but also call lambda functions like create_query_add and create_query_execute. Many of the functions in this program are designed for solving specific queries. The general structure of these methods is that they will have the query as a string(which will be executed via the cursor) with the results being fetched. For each of the results, the values to be selected are extracted and formatted before being printed. 

# How to Run this Database

1. Upload the csv files in this repository to a MySQL connection.
2. Run the Full_Database.ipynb file.
