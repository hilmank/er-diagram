# Description
ER diagram of the Educational Organization has the following description :
- Organization has several Departments
- Each department only have one Location
- A Department Head control a particular department.
- An employee works in only one department but can work on several programs
- An employee has several files like photo, certicates, etc
- The program contains all activities of the organization that are assigned to the department.
- Types of programs include courses, child care, primary education, secondary education, higher education, home schooling, educational consultation, shops and other programs.

# Entities and Atributes
- Orgazization:
  + id
  + name, 
  + address
  + phone_number
  + email
  + social_media_akun

- Departments:
  + id
  + name, 
  + address
  + phone_number
  + email
  + social_media_akun

- Employees:
  + id
  + department_id
  + position_id
  + name, 
  + address, 
  + date_of_birth, 
  + place_of_birth, 
  + gender, 
  + email, 
  + phone_number
  + mobile_number
  + hire_date
  + emp_status
  + educations
  + certifications
  + bank_account_number
  + tax_id_number
  + marital_status
  + num_of_child
  + social_media_akun

- Programs:
  + id
  + name
  + description
  + social_media_akun

- Positions
  + id
  + name
  + description
