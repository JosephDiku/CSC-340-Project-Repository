# Software Requirements Specification
## For <BookNexus>

Version 0.1  
Prepared by <Logan Wilkins & Joseph Diku>  
<CSC340>  
<September 17, 2025> 

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
| Name | Date    | Reason For Changes  | Version   |
|Logan |   9/1   | Doing Requirments   | 1.0       |
|      |         |                     |           |
|      |         |                     |           |
|      |         |                     |           |

## 1. Introduction

### 1.1 Document Purpose
Describe the purpose of the SRS and its intended audience.

### 1.2 Product Scope
Identify the product whose software requirements are specified in this document, including the revision or release number. Explain what the product that is covered by this SRS will do, particularly if this SRS describes only part of the system or a single subsystem. 
Provide a short description of the software being specified and its purpose, including relevant benefits, objectives, and goals. Relate the software to corporate goals or business strategies. If a separate vision and scope document is available, refer to it rather than duplicating its contents here.

### 1.3 Definitions, Acronyms and Abbreviations                                                                                                                                                                         |

### 1.4 References
List any other documents or Web addresses to which this SRS refers. These may include user interface style guides, contracts, standards, system requirements specifications, use case documents, or a vision and scope document. Provide enough information so that the reader could access a copy of each reference, including title, author, version number, date, and source or location.

### 1.5 Document Overview
Describe what the rest of the document contains and how it is organized.

## 2. Product Overview
This section should describe the general factors that affect the product and its requirements. This section does not state specific requirements. Instead, it provides a background for those requirements, which are defined in detail in Section 3, and makes them easier to understand.

### 2.1 Product Functions
Summarize the major functions the product must perform or must let the user perform. Details will be provided in Section 3, so only a high level summary (such as a bullet list) is needed here. Organize the functions to make them understandable to any reader of the SRS. A picture of the major groups of related requirements and how they relate, such as a top level data flow diagram or object class diagram, is often effective.

### 2.2 Product Constraints
This subsection should provide a general description of any other items that will limit the developer’s options. These may include:  

* Interfaces to users, other applications or hardware.  
* Quality of service constraints.  
* Standards compliance.  
* Constraints around design or implementation.
  
### 2.3 User Characteristics
Identify the various user classes that you anticipate will use this product. User classes may be differentiated based on frequency of use, subset of product functions used, technical expertise, security or privilege levels, educational level, or experience. Describe the pertinent characteristics of each user class. Certain requirements may pertain only to certain user classes. Distinguish the most important user classes for this product from those who are less important to satisfy.

### 2.4 Assumptions and Dependencies
List any assumed factors (as opposed to known facts) that could affect the requirements stated in the SRS. These could include third-party or commercial components that you plan to use, issues around the development or operating environment, or constraints. The project could be affected if these assumptions are incorrect, are not shared, or change. Also identify any dependencies the project has on external factors, such as software components that you intend to reuse from another project, unless they are already documented elsewhere (for example, in the vision and scope document or the project plan).

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
