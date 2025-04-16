# Chatapp
Chatapp WebApp
# ChatApp – Database/Application Backup Logging and Chat Room System
 
## Overview
ChatApp is a web-based application built with PHP and MySQL that combines two primary modules:
1. Application/Database Backup Logging System
2. General Chat Room
 
The system features user authentication, role-based access control, and comprehensive logging capabilities.
 
## Prerequisites
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Apache/Nginx web server
- Web browser with JavaScript enabled
 
## Installation
 
### 1. Database Setup
1. Create two new MySQL databases for the application by executing the SQL files in the Databases folder
 
### 2. Application Setup
1. Database connection is defined in the mainconn.php file in the Connections folder
 
## Features
 
### Authentication System
- User registration (signup)
- User login (signin)
- Password recovery
 
### Role-Based Access Control
#### Admin Users
- Create logging entries
- Manage user accounts (approve signup, suspend users)
- View backup logs
- Access to chat rooms
 
#### Regular Users
- View/create backup logs
- Participate in chat rooms
- Update personal profile
- Change password
- Recover password
 
### Logging Module
- Record application/database backups
- Review database/application logs
 
### Chat Room Module
- Real-time messaging
- Message history
 
## File Structure

chatapp/
│
├── Databases/
│   ├── chat.sql
│   └── prod.sql
│
├── Connections/
│   ├── mainconn.php
│
└── Images/

 
## Security
- Input validation and sanitization
  
## Usage
 
### Admin Panel
1. Login with admin credentials
2. Access admin dashboard
3. Manage users 
 
### Logging Module
1. Navigate to logging section
2. Create new log entries
3. Search and filter existing logs
 
### Chat Room
1. General chat room is visible
2. Send and receive messages
 
## Troubleshooting
- Check database connection if login fails
 
## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Create a pull request
 
## License
 
## Support
For support, please contact [eezino@gmail.com]
 
## Authors
[Zino]
 
## Version History
- v1.0.0: Initial release
