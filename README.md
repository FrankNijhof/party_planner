# party planner

This is a school project. The purpose of this project to research front-end frameworks and create a prototype. <br/>
One of the frameworks that we selected was Flutter.  <br/>  <br/>
The assignment is to make a party planner. The user should create an event (or party) and send invitations to people (attendees).  <br/>
The invited attendees should get an invitation mail from the user.

## Features

We needed for each prototype a requirement of features. <br/> <br/>
So far, the features that I have created for this app are:
- Writing and Sending a mail to a recipient <br/>
 ![Composing mail](https://imgur.com/NypgpNw.png "a title")
- A calendar to select a date for creating a party/event <br/>
  ![Add event](https://imgur.com/3NaDVvX.png "a title")
- Saving the party/event in your phone agenda

## Plugins/libraries

- Pathprovider <br/>
Used for getting a string to the directory of the app. It makes it easier to create/write files to the phone.
- datepicker (syncfusion) <br/>
Used for getting a calendar and selecting a date for the party.
- fluttertoast <br/>
Used for messages for notifications e.g. when certain fields are not filled in.
- flutter_email_sender <br/>
Used for generating a mail file to send to the recipient.
- add_2_calendar <br/>
Used for adding the party to the phone agenda.


## Known issues
There are two unresolved issues that couldn't be fixed before the deadline: <br/>
- Refreshing attendees list  <br/>
When adding a new attendee to the party it wont update the view as it should be. It will only update when restarting the app or adding a new contact or party.

- Theme won't apply to all pages  <br/>
On the pages for adding a party or contact won’t add the custom theme.



