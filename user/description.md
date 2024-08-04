# Description
User Management is a basic module that will support an application to run perfectly. User management is made to easily manage and monitor user accounts, manage user access rights to application content and menus, and to ensure the security of the application.
- Applications are created on several platforms
- Each application has several menus and submenus
- Active users can access applications according to the access rights granted
- Application access rights are in the form of roles that can be granted to users
- Users can have several roles
- Users can have several files

# Entities and Attributes
**A. appl**
 1. id [string]
 2. code [string]
 3. name [string]
 4. description [string]

**B. appl_extra**
 1. appl_id [string]
 2. key [string]
 3. type [string]
 4. value [string]

**C. appl_task**
 1. id [string]
 2. appl_task_parent_id [string]
 3. appl_id [string]
 4. index_no [integer]
 5. task_name [string]
 6. controller_name [string]
 7. action_name [string]
 8. description [string]
 9. icon_name [string]
 10. custom_id [string]
 11. status [integer]

**D. role**
 1. id [string]
 2. code [string]
 3. name [string]

**E. user**
 1. id [string]
 2. username [string]
 3. password [string]
 4. email [string]
 5. first_name [string]
 6. middle_name [string]
 7. last_name [string]
 8. address [string]
 9. phone_number [string]
 10. mobile_number [string]
 11. status [integer]
 12. last_login [datetime]
 13. organization_id [string]
 14. created_by [string]
 15. created_date datetime
 16. updated_by [string]
 17. updated_date [datetime]

**F. user_file**
 1. id [string]
 2. user_id [string]
 3. category [string]
 4. type [string]
 5. title [string]
 6. description [string]
 7. file_name [string]
 8. file_thumbnail [string]
