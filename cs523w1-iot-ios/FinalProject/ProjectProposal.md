# Project Proposal - Josh Gribbon

I want to make a simple chat room application. All chat rooms will be open to anyone but identified with random strings. Someone could get a link to a room ID and then join. There will be authentication which is optionally biometric, and you could send text and links. If it's a link then it can be opened in an in-app browser.

I plan on using Firebase(https://firebase.google.com/) for the backend storage of messages, and potentially some other tools they offer if they seem useful.

Users can:
* See open chat rooms
* Search for chat rooms
* Enter a chat room
* Send/receive messages
* Send links and open in the app

Frameworks:
* Foundation - basic functionality
* Swift - basic functionality
* Webkit - allow users to follow links from within the app
* LocalAuthentication - allow users to authenticate biometrically