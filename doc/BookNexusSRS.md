# Software Requirements Specification
## For BookNexus

Version 0.1  
Prepared by <Joseph Diku and Logan Wilkins>  
09/16/2025 

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
This section specifies the software product's requirements. Specify all of the software requirements to a level of detail sufficient to enable designers to design a software system to satisfy those requirements, and to enable testers to test that the software system satisfies those requirements.

The specific requirements should:
* Be uniquely identifiable.
* State the subject of the requirement (e.g., system, software, etc.) and what shall be done.
* Optionally state the conditions and constraints, if any.
* Describe every input (stimulus) into the software system, every output (response) from the software system, and all functions performed by the software system in response to an input or in support of an output.
* Be verifiable (e.g., the requirement realization can be proven to the customer's satisfaction)
* Conform to agreed upon syntax, keywords, and terms.

#### 3.1.1 User interfaces
Define the software components for which a user interface is needed. Describe the logical characteristics of each interface between the software product and the users. This may include sample screen images, any GUI standards or product family style guides that are to be followed, screen layout constraints, standard buttons and functions (e.g., help) that will appear on every screen, keyboard shortcuts, error message display standards, and so on. Details of the user interface design should be documented in a separate user interface specification.

Could be further divided into Usability and Convenience requirements.

#### 3.1.2 Hardware interfaces
Describe the logical and physical characteristics of each interface between the software product and the hardware components of the system. This may include the supported device types, the nature of the data and control interactions between the software and the hardware, and communication protocols to be used.

#### 3.1.3 Software interfaces
Describe the connections between this product and other specific software components (name and version), including databases, operating systems, tools, libraries, and integrated commercial components. Identify the data items or messages coming into the system and going out and describe the purpose of each. Describe the services needed and the nature of communications. Refer to documents that describe detailed application programming interface protocols. Identify data that will be shared across software components. If the data sharing mechanism must be implemented in a specific way (for example, use of a global data area in a multitasking operating system), specify this as an implementation constraint.

### 3.2 Non Functional Requirements 

#### 3.2.1 Performance
If there are performance requirements for the product under various circumstances, state them here and explain their rationale, to help the developers understand the intent and make suitable design choices. Specify the timing relationships for real time systems. Make such requirements as specific as possible. You may need to state performance requirements for individual functional requirements or features.

#### 3.2.2 Security
Specify any requirements regarding security or privacy issues surrounding use of the product or protection of the data used or created by the product. Define any user identity authentication requirements. Refer to any external policies or regulations containing security issues that affect the product. Define any security or privacy certifications that must be satisfied.

#### 3.2.3 Reliability
Specify the factors required to establish the required reliability of the software system at time of delivery.

#### 3.2.4 Availability
Specify the factors required to guarantee a defined availability level for the entire system such as checkpoint, recovery, and restart.

#### 3.2.5 Compliance
Specify the requirements derived from existing standards or regulations

#### 3.2.6 Cost
Specify monetary cost of the software product.

#### 3.2.7 Deadline
Specify schedule for delivery of the software product.
