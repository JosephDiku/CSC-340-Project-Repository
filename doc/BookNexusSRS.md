# Software Requirements Specification
## For BookNexus

Version 0.1  
Prepared by <Joseph Diku and Logan Wilkins>
<CSC340>  
<09/16/2025>

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Introduction](#1-introduction)
  * 1.1 [Document Purpose](#11-document-purpose)
  * 1.2 [Product Scope](#12-product-scope)
  * 1.3 [Definitions, Acronyms and Abbreviations](#13-definitions-acronyms-and-abbreviations)
  * 1.4 [References](#14-references)
  * 1.5 [Document Overview](#15-document-overview)
* 2 [Product Overview](#2-product-overview)
  * 2.1 [Product Functions](#21-product-functions)
  * 2.2 [Product Constraints](#22-product-constraints)
  * 2.3 [User Characteristics](#23-user-characteristics)
  * 2.4 [Assumptions and Dependencies](#24-assumptions-and-dependencies)
* 3 [Requirements](#3-requirements)
  * 3.1 [Functional Requirements](#31-functional-requirements)
    * 3.1.1 [User Interfaces](#311-user-interfaces)
    * 3.1.2 [Hardware Interfaces](#312-hardware-interfaces)
    * 3.1.3 [Software Interfaces](#313-software-interfaces)
  * 3.2 [Non-Functional Requirements](#32-non-functional-requirements)
    * 3.2.1 [Performance](#321-performance)
    * 3.2.2 [Security](#322-security)
    * 3.2.3 [Reliability](#323-reliability)
    * 3.2.4 [Availability](#324-availability)
    * 3.2.5 [Compliance](#325-compliance)
    * 3.2.6 [Cost](#326-cost)
    * 3.2.7 [Deadline](#327-deadline)

## Revision History
| Name          | Date       | Reason For Changes                     | Version   |
| ------------- | ---------- | -------------------------------------- | --------- |
| Joseph Diku   | 09/16/2025 | Initial completion of Sections 1 and 2 |  0.1      |
| Logan Wilkins | 09/16/2025 | Initial completion of Section 3        |  0.1      |
|               |            |                                        |           |

## 1. Introduction

### 1.1 Document Purpose
This SRS is written to provide a detailed description of the requirements for the BookNexus application. It is intended for a wide audience ranging from developers and stakeholders to testers.  It will serve as a reference point during development, testing stages of the project, and will ensure that the final product meets user needs and aligns with every established objective. 

### 1.2 Product Scope
BookNexus is an online library site designed to connect readers and authors in a shared digital space. With the slogan "Where stories and readers meet," the product is designed to enable customers to subscribe to and browse a wide library of books from their favorite authors and genres, and to leave reviews on their experiences. With a subscription, authors can upload their books and manage their profiles, keeping track of audience statistics and responding to reviews.
The software is designed to provide an engaging marketplace where readers gain access to diverse content and authors receive meaningful feedback. By incorporating a subscription-based system and interactive features, the platform focuses on digital distribution and community engagement.

### 1.3 Definitions, Acronyms and Abbreviations                                                 
- SRS: Software Requirements Specification
- Customer/Member (Reader): A user who registers to access, subsrequirementscribe to, and review books.
- Provider (Author): A user who registers to upload and manage books respond to customer feedback.

### 1.4 References
- IEEE Recommended Practice for Software Specifications

### 1.5 Document Overview
- Section 2: provides an overview of the product, including major functions, constrainsts, user characteristics, and dependencies.
- Section 3: specifies funtional and non-functional requirements in detail.

## 2. Product Overview

### 2.1 Product Functions
- Customer/Member (Reader)
    * Subscribe to access library
    * Browse library
    * Leave reviews and ratings
    * Add books to their Favorites List
    * View dashboard of books read and wishlist
- Provider (Author)
    * Subscribe to gain publishing access
    * Upload and manage digital books
    * View cutomer-related statistics
    * Respond to customer reviews
    * View dashboard of books uploaded
- Both (Reader and Author)
    * Register for account
    * Edit profile

### 2.2 Product Constraints
- Interface: The system must support a web-based interface with access from standard browsers
- Quality of Service: The system should be quick, responsive and support multiple users at once without performance issues
- Standard Compliance: The system must follow standard authentication protocols to verify users.
- Design Constrains: the platform will require role-based access in order to support both customer and provider needs.
  
### 2.3 User Characteristics
- Customers (Readers)
    * Customers is expected to have moderate technical understanding, with the ability to browse and understand basic searching techniques.
    * Customers are expected to have elementary navigation skills and a firm understanding of subscription systems
- Providers (Authors)
    * Providers are expected to have modetrate technical skills, with the understanding in uploading content and monitoring an audience.
    * Providers are expected to have elementary navigation skills and a firm understanding of subscription systems

### 2.4 Assumptions and Dependencies
- It is assumed that users have reliable internet access and a device with a web browser
- The system depends on third-party payment services for handling subscriptions
  
## 3. Requirements

### 3.1 Functional Requirements 
*  FR0: The system will get the user to make a member or author account
    - Each account will have its own Id when made
*  FR1: The system will allow authors to publish books to the library with the title, and genre.
*  FR2: The system will allow the ability for memebers to browse through the library to look for books.
    - There will be a search filter where you can search by author, title and genre.
*  FR3: The system allows members and authors to subscribe to the site to gain access to discounts and benefits
    - There is the ability to unsubscribe when you no longer need the subscription
*  FR4: Members and Authors can edit their profiles at any time.
*  FR5: Users will be able to browse their dashboard to look at their books and reviews they made.
*  FR6: The system will allow users to leave a rating and review on books in the library.
*  FR7: The system will allow the authors to respond to reviews left by memebers on their books


#### 3.1.1 User interfaces
The web page will be made using HTML, CSS, and JavaScript.

#### 3.1.2 Hardware interfaces
Devices with the ability to use the web browser will have access to our page.

#### 3.1.3 Software interfaces
As of right now the software interfaces being used are:
* Java jdk 21 (Coding Language)
* PostgreSQL 17 (Memory Storage)
* SpringBoot 3.4.5 (Java-based Framework)

### 3.2 Non Functional Requirements 

#### 3.2.1 Performance
* NFR0: The BookNexus System will consume less than 125 MB of memeory
* NFR1: A new member will be able to set up account and profile in less than 8 mins
* NFR2: A new author will understand how to publish books and manage their account within 10 mins
* NFR2: A intermediate user will completely understand how both author and member accounts work

#### 3.2.2 Security
* NFR3: Memebers and Authors must make an account to use the system

#### 3.2.3 Reliability
* NFR4: The System will go through a lot of testing to ensure good stability when launched.

#### 3.2.4 Availability
* NFR5: BookNexus will have 24/7 availability. Any scheduled maintenance will be initialized during low activity times to minimize conflicting with the users of the system.

#### 3.2.5 Compliance


#### 3.2.6 Cost
* NFR6: We acknowledged there will be no money spent on this project

#### 3.2.7 Deadline
* NFR7: The final product has to be delived by December 2025
