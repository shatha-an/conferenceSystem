# API-Documentation


<details>
<summary>App Statement</summary>

## **App Statement.**

_Conference Management Software is an system to facilitate the planning, coordination, and execution of conferences and events. This robust system caters to the core components of conference management by incorporating a suite of functionalities tailored to enhance the collaboration between speakers, organizers, and attendees_

</details>



<details>
<summary>Tables</summary>

## **Tables.**

1-Session Table 

|        Column       |      TYPE     |     Key
|--------------------:|--------------:|---------------|
|   Sessionid         |     uuid      |      PK       |
|   Title             |    String     |               |
|   Desc              |    String     |               |
|   SpeakerName       |    String     |               |
|   HallNumber        |    String     |               |
|   StartTime         |    String     |               |
|   Endime            |    String     |               |
|   Status            |    String     |               |
|   Location          |    String     |               |


2-Attendee Table 

|        Column       |      TYPE     |
|--------------------:|---------------|
|   AttendeeID        |     uuid      |
|   FullName          |    String     |
|   Email             |    String     |



**Relationship table**

3-SessionAttendee Table

|        Column       |      TYPE     |
|--------------------:|---------------|
|   AttendeeSessionID |     uuid      |
|   AttendeeID        |     uuid      |
|   Sessionid         |     uuid      |
|   Status            |    String     |


</details>


<details>
<summary>Database Schema</summary>

## **Database Schema.**

<img width="1161" alt="Screenshot 1445-08-16 at 9 28 48 AM" src="https://github.com/shatha-an/conferenceSystem/assets/144011837/5be2b447-c3bf-4ee2-84bf-8d0a1e9bb712">


</details>


<details>
<summary>RelationShip</summary>

## **Relationship.**
  
### Many-To-Many (M:) Relationship.


**One session can have a group of Attendees.**

**One attendee can have a group of Sessions.**

```diff
- [NOTE!]
The SessionAttendee table is relationship table and used "AttendeeID" ,"SessionID" as foreignKey from Basic tables (Attendee table , Session table).
```

</details>



<details>
<summary>Feature List (CRUD)</summary>

## **Feature List (CRUD).**

**Create:**
```
Create New Session. 
Create New Attendee.
```


**Read:**
```
Read All Sessions.
```


**Update**: 
```
Update Session (SpeakerName, Title, Desc, HallNumber, StartTime, EndTime, Status, Location).
Ubdate Status of Atendee.
```

**Delete:**
```
Delete a Session.
```

</details>
