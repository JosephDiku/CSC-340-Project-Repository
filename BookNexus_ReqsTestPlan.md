# BookNexus Requirements Testing
## Actors
- Provider P: Author
- Member M: Readers
- Service S: Library

### Use Cases
#### 1. Provider: Create provider profile (Sign up as an author):
1. Author P1 logs in for the first time and creates a profile.
2. P1 creates new library and publishes books S1 and S2 with values for searchable criteria C1, C2, C3 (C1=Name, C2=Contents, C3=Price).  
P1 exits the app.

#### 2. Customer: Create customer profile (Sign up as a member):
1. Customer C1 logs in for the first time and creates a profile.

#### 3. Customer:  View and subscribe to services (Subscribe to a library):
1. Customer C2 logs in for the first time and creates a new profile.
2. C2 views available libraries S1 and S2.
3. C2 subscribes to S1.

#### 4. Customer: Write review (Review a book):
1. C2 logs in and views their subscriptions.
2. C2 writes a positive review of book S1. C2 exits.

#### 5. Customer: Modify profile
1. C1 logs in and modifies their profile.
2. C1 views library S1 and the positive review on book.
3. C1 subscribes to S1. C1 exits.

#### 6. Provider:  Reply to Review, View Customer Statistics, & Modify Profile use cases
1. Provider P1 logs in and reads their review and replies with thanks. 
2. P1 views customer statistics.  P1 modifies his profile. P1 exits.
