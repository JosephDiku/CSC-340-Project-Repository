# BookNexus - Software Design 

Version 1  
Prepared by Alice Beback\
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
|Logan |  10/20  | Initial Design      |    1      |
|      |         |                     |           |
|      |         |                     |           |

## 1. Product Overview
LocalHarvest Hub is a simple, comprehensive, easy to use web app with the goal of connecting consumers to locally grown produce. Authors and customers make use of the centralized platform to meet their needs. 
Authors create and publish produce boxes, customers subscribe any available boxes that they are interested in, either as a one-off or recurring subscription.

## 2. Use Cases
### 2.1 Use Case Model
![Use Case Model](https://github.com/csc340-uncg/f25-team0/blob/main/doc/Object-Oriented-Design/use-case.png)

### 2.2 Use Case Descriptions

#### 2.2.1 Actor: Author
##### 2.2.1.1 Sign Up
A Author can sign up to create their profile with their name, email, and password. Emails must be unique.
##### 2.2.1.2 Log In
A Author shall be able to sign in using their registred email and password. After logging in, the Author shall be directed their dashboard where they see an overview of their library, reviews and upload books.
##### 2.2.1.3 Update Profile
A Author shall be to modify their profile by going to their profile page. They can change their email, password, and Author name.
##### 2.2.1.4 Create Library
The Author shall be able to create a new library. In this library will hold the books uploaded by them making them availble for the customers to subscribe to.
##### 2.2.1.4 View Customer Stats
A Author will be able to view several statistics such as total subscription revenue, total subscribers, and average ratings.

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
![UML Class Diagram](https://github.com/csc340-uncg/f25-team0/blob/main/doc/Object-Oriented-Design/class-diagram.png)
## 4. Database Schema
![UML Class Diagram](https://github.com/csc340-uncg/f25-team0/blob/main/doc/Object-Oriented-Design/schema.png)