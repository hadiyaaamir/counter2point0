# Counter 2.0 ✨

This is an updated version of the default Flutter Counter app. It includes several new features and enhancements, making it more interactive and visually appealing.

[Couter 2.0 Demo](https://github.com/hadiyaaamir/counter2point0/assets/63019067/993ff878-8da4-489c-99db-c96493d885b6)

## Features 🚀

- **Increment, Decrement, and Reset functionality:** Easily increase, decrease, or reset the counter value with buttons. 
- **Editable Counter Value:** Directly type in the desired value by tapping on the counter text. 
- **Animated Counter Value:** Displayed with animations, the text size progressively adjusts and the color becomes redder as the value approaches the minimum or maximum boundary. 
- **Dark Mode:** Supports a visually comfortable experience in low-light environments. 


## Project Structure 📁

This project follows clean coding practices and has been structured in a modular and maintainable manner. Features have been separated into folders, with model, view, and business logic each in their respective folders. Below is the structure of the lib folder of this application:

📁 **app/.**  &emsp; <- root of application <br/>
&emsp;📁 view/ <br/>
&emsp;&emsp;📂 counter_app.dart <br/>
📁 **counter/** <br/>
📁 **theme/** <br/>
&emsp; 📁 controller/ <br/>
&emsp; 📁 model/ <br/>
&emsp; 📁 view/ <br/>
📁 **widgets/** <br/>
📁 **utils/** <br/>
&emsp; 📁 models/ <br/>
&emsp; 📂 constants.dart  <br/>
📂 **main.dart** &emsp; <- runApp here

## Learning Outcomes 📚

- **Custom State Management:** Custom State Management: Implemented using ChangeNotifier and listeners for efficient state updates and synchronized UI.
- **Inherited Widgets:** Utilized for dependency injection, enabling efficient data and state propagation without tight coupling.
- **Immutability:** Ensured data integrity and predictability by implementing immutable classes.
- **Reduced Primitive Obsession:** Encapsulated related data and behavior within custom classes, improving code organization and reducing reliance on primitive types.
- **Clean Coding:** Practiced clean coding principles, including meaningful variable names, proper code formatting, and modular design.


