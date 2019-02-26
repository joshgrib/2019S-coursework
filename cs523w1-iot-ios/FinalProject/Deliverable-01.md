# First Deliverable

Please upload:
- An updated documentation that describes your application.  
- A list with all the features your final version application will include.
- A weekly timeframe for your project - What will be implemented, by whom, and by when?
- The source code (What you have done so far)

## Description
I want to make a simple chat room application. All chat rooms will be open to anyone but identified with random strings. Someone could get a link to a room ID and then join. There will be authentication which is optionally biometric, and you could send text and links. If it's a link then it can be opened in an in-app browser.

I plan on using [Firebase](https://firebase.google.com/) for the backend storage of messages, and potentially some other tools they offer if they seem useful.

## Features
* See open chat rooms
* Search for chat rooms
* Enter a chat room
* Send/receive messages
* Send links and open in the app

## Timeline
All dates are Mondays.

| Date  | Task |
| :-:   | :--  |
| 02-25 | Initial project setup, add Firebase |
| 03-04 | User authentication |
| 03-11 | Create new chat rooms and view the list |
| 03-18 | Search for rooms and join |
| 03-25 | Send messages, push updates (no reloading) |
| 04-01 | Add in-chat web browser |
| 04-08 | Edit chat room names |
| 04-15 | Edit messages you sent |
| 04-22 | Delete chat rooms and messages|
| 04-29 | Debugging, testing, polishing |
| 05-06 | Project completion |

## Source code - what's done so far
The included source code is for a basic tabbed application - one tab will display the chat rooms and the other will show the most recent opened chat room. I've also done the setup for Firebase to start using that for the backend to store the rooms and messages.

I also set up the basics for the database in Firebase. I'm doing this with Firestore with a `rooms` collection storing documents with the room names, who created it, and when. Then each room has a `messages` collection that will store a document for each message with the message contents, who sent it, and when.