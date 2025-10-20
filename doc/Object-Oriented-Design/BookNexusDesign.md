# BookNexus - Software Design 

Version 1  
Prepared by Joseph Diku and Logan Wilkins\
BookNexus\
Oct 20, 2025

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Product Overview](#1-product-overview)
* 2 [Use Cases](#2-use-cases)
  * 2.1 [Use Case Model](#21-use-case-model)
  * 2.2 [Use Case Descriptions](#22-use-case-descriptions)
    * 2.2.1 [Actor: Author](#221-actor-Author)
    * 2.2.2 [Actor: Customer](#222-actor-customer) 
* 3 [UML Class Diagram](#3-uml-class-diagram)
* 4 [Database Schema](#4-database-schema)

## Revision History
| Name | Date    | Reason For Changes  | Version   |
| ---- | ------- | ------------------- | --------- |
|Logan |  10/20  | Initial Design      |     1     |
|      |         |                     |           |
|      |         |                     |           |

## 1. Product Overview
BookNexus is a simple, comprehensive, and easy to use web app with the goal of connecting readers to the authors. Authors and members make use of the centralized platform to meet their needs of literature. 
Authors create a library and publish books to them, customers subscribe to library the authors have to read books they are interested in, either as a one-off or recurring subscription to that library.

## 2. Use Cases
### 2.1 Use Case Model
![Use Case Model](https://github.com/JosephDiku/CSC-340-Project-Repository/blob/main/doc/Object-Oriented-Design/Use-case%20diagram.jpg)

### 2.2 Use Case Descriptions

#### 2.2.1 Actor: Author
##### 2.2.1.1 Sign Up
A Author can sign up to create their profile with their name, email, and password. Emails must be unique.
##### 2.2.1.2 Log In
A Author shall be able to sign in using their registred email and password. After logging in, the Author shall be directed their dashboard where they see an overview of their library, reviews and be able to upload books.
##### 2.2.1.3 Update Profile
A Author shall be to modify their profile by going to their profile page. They can change their email, password, and Author name.
##### 2.2.1.4 Create Library
The Author shall be able to create a new library. In this library will hold the books uploaded by them making them availble for the customers to subscribe to.
##### 2.2.1.5 View Stats
A Author will be able to view several statistics such as total subscription revenue, total subscribers, and average ratings.
##### 2.2.1.6 Upload Books
A Author can upload books to the library they made to be viewed by memebers that subscribe.
##### 2.2.1.7 Respond to Reviews
A Author is able to respond to the reviews that have been left by the memebers on their books.

#### 2.2.2 Actor: Memeber
##### 2.2.2.1 Sign Up
A customer can sign up to create their profile with their name, email, password, and address. Emails must be unique.
##### 2.2.2.2 Log In
A customer shall be able to sign in using their registred email and password. After logging in, the customer shall be directed their dashboard where they see an overview of their subscriptions.
##### 2.2.2.3 Browse Produce Boxes
A customer shall be able to view available produce boxes. They can do this from the home page or using a search function. They can also filter boxes by name, descriptions, or farm. They will also be able to select one box and view more details.
##### 2.2.1.4 Subscribe to Produce Box
Upon selecting a box, a customer shall be able to subscribe for the box using a one-click action. This box will then appear on their dashboard, and they will be able to ammend the subscription.
##### 2.2.1.5 Review Produce Box
A customer may write a review for a box they subscribed to. They will be able to rate the box based on freshness and delivery.

## 3. UML Class Diagram
![UML Class Diagram](Link goes here)
## 4. Database Schema
![UML Class Diagram](Link goes here)