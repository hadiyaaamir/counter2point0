# counter2point0

This is an updated version of the default Flutter Counter app. It includes several new features and enhancements, making it more interactive and visually appealing.

## Features

- Increment, Decrement, and Reset functionality: You can easily increase, decrease, or reset the counter value with the provided buttons.
- Editable Counter Value: By tapping on the counter text, you can directly type in the desired value instead of using the buttons.
- Animated Counter Value: The counter value is displayed with animations. As the value increases, the text size progressively gets larger, and as the value decreases, the text size becomes smaller. Additionally, the color of the text becomes redder as you approach the minimum or maximum boundary.
- Dark Mode: The app supports dark mode, providing a visually comfortable experience in low-light environments.

## Project Structure

This project follows clean coding practices and has been structured in a modular and maintainable manner. Here are some key considerations:

- Folder Structure: Features have been separated into folders, with model, view, and business logic each in their respective folders. This promotes organization and ease of navigation.
- Barrel Files: Barrel files have been utilized to simplify imports and provide easy access to multiple files within each feature folder.
- Reduced Primitive Obsession: Classes have been used to encapsulate related data and behavior, reducing reliance on primitive types and improving code organization.
- Immutability: Immutable classes have been implemented to ensure data integrity and minimize unexpected changes.
