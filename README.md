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

|        Column       |      TYPE     |
|--------------------:|---------------|
|   Sessionid         |     uuid      |
|   Title             |    String     |
|   Desc              |    String     |
|   SpeakerName       |    String     |
|   HallNumber        |    String     |
|   ScheduledStartTime|    String     |
|   ScheduledEndime   |    String     |
|   Status            |    String     |
|   Location          |    String     |


2-Attendee Table 

|        Column       |      TYPE     |
|--------------------:|---------------|
|   AttendeeID        |     uuid      |
|   FullName          |    String     |
|   Email             |    String     |


3-SessionAttendee Table

|        Column       |      TYPE     |
|--------------------:|---------------|
|   AttendeeSessionID |     uuid      |
|   AttendeeID        |     uuid      |
|   Sessionid         |     uuid      |
|   Status            |    String     |


</details>




<details>
<summary>RelationShip</summary>

## **Relationships.**
  
### Many-To-Many (M:) Relationship.


**One session can have a group of Attendees.**

**One attendee can have a group of Sessions.**

```diff
- ** [NOTE!]**
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
