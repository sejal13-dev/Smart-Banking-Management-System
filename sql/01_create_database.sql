/*
=========================================================
Project : Smart Banking Management System
File    : 01_create_database.sql
Author  : Sejal Priya
Version : 2.0

Description:
Creates the Smart Banking System database.
=========================================================
*/

DROP DATABASE IF EXISTS smart_banking_system;

CREATE DATABASE smart_banking_system
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE smart_banking_system;

SELECT DATABASE() AS current_database;