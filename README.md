# Mobile Development Challenge

## Selected Sections
1. Advanced Networking and Data Handling
2. Secure Authentication and User Management
3. Robust Database Integration and Offline Support

## Project Structure
📦lib
┣ 📂core
┃ ┣ 📂error
┃ ┃ ┣ 📜exceptions.dart
┃ ┃ ┗ 📜failure.dart
┃ ┣ 📂service
┃ ┃ ┣ 📂local
┃ ┃ ┃ ┣ 📂interface
┃ ┃ ┃ ┃ ┗ 📜i_simple_user_data.dart
┃ ┃ ┃ ┗ 📜user_data_factory.dart
┃ ┃ ┣ 📂remote
┃ ┃ ┃ ┣ 📜api_consumer.dart
┃ ┃ ┃ ┣ 📜dio_consumer.dart
┃ ┃ ┃ ┣ 📜error_message_remote.dart
┃ ┃ ┃ ┗ 📜service_locator.dart
┃ ┃ ┣ 📜simple_secure_user_data.dart
┃ ┃ ┗ 📜simple_user_data.dart
┃ ┣ 📂utilities
┃ ┃ ┣ 📜base_usecase.dart
┃ ┃ ┣ 📜db_helper.dart
┃ ┃ ┣ 📜defs.dart
┃ ┃ ┗ 📜enums.dart
┃ ┗ 📜widget_life_cycle_listener.dart
┣ 📂features
┃ ┣ 📂authentication
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┣ 📂data_sources
┃ ┃ ┃ ┃ ┣ 📜authentication_remote_data_source.dart
┃ ┃ ┃ ┃ ┗ 📜endpoints.dart
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜authantication_reposiory.dart
┃ ┃ ┣ 📂domain
┃ ┃ ┃ ┣ 📂entities
┃ ┃ ┃ ┃ ┣ 📜register_request.dart
┃ ┃ ┃ ┃ ┗ 📜register_response.dart
┃ ┃ ┃ ┣ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜base_authentication_repository.dart
┃ ┃ ┃ ┗ 📂use_cases
┃ ┃ ┃ ┃ ┗ 📜register_usecase.dart
┃ ┃ ┗ 📂presentation
┃ ┃ ┃ ┣ 📂controller
┃ ┃ ┃ ┃ ┣ 📜auth_cubit.dart
┃ ┃ ┃ ┃ ┗ 📜auth_state.dart
┃ ┃ ┃ ┣ 📂pages
┃ ┃ ┃ ┃ ┗ 📜auth_screen.dart
┃ ┃ ┃ ┗ 📂widgets
┃ ┃ ┃ ┃ ┗ 📂login
┃ ┃ ┃ ┃ ┃ ┣ 📜auth_background.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜auth_form.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜auth_header.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜forget_password.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜login_account.dart
┃ ┣ 📂news
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┣ 📂data_sources
┃ ┃ ┃ ┃ ┣ 📜endpoints.dart
┃ ┃ ┃ ┃ ┗ 📜news_remote_data_source.dart
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜news_repository.dart
┃ ┃ ┣ 📂domain
┃ ┃ ┃ ┣ 📂entities
┃ ┃ ┃ ┃ ┣ 📜newa_request.dart
┃ ┃ ┃ ┃ ┗ 📜news_response.dart
┃ ┃ ┃ ┣ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜base_news_repository.dart
┃ ┃ ┃ ┗ 📂use_cases
┃ ┃ ┃ ┃ ┣ 📜get_categories.dart
┃ ┃ ┃ ┃ ┗ 📜get_news_usecase.dart
┃ ┃ ┗ 📂presentation
┃ ┃ ┃ ┣ 📂controller
┃ ┃ ┃ ┃ ┣ 📂categories
┃ ┃ ┃ ┃ ┃ ┣ 📜categories_cubit.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜categories_state.dart
┃ ┃ ┃ ┃ ┗ 📂news
┃ ┃ ┃ ┃ ┃ ┣ 📜news_cubit.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜news_state.dart
┃ ┃ ┃ ┣ 📂pages
┃ ┃ ┃ ┃ ┣ 📜home_screen.dart
┃ ┃ ┃ ┃ ┗ 📜news_details.dart
┃ ┃ ┃ ┗ 📂widgets
┃ ┃ ┃ ┃ ┣ 📂home_screen
┃ ┃ ┃ ┃ ┃ ┣ 📜categories_data.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜categories_widget.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜category_item.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜news_list_widget.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜product_item.dart
┃ ┃ ┃ ┃ ┗ 📂news_details
┃ ┃ ┃ ┃ ┃ ┣ 📜cusom_button.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜custom_text.dart
┃ ┗ 📜splash_screen.dart
┗ 📜main.dart
# Critical Thinking Questions
1. How did you approach the design and implementation of the authentication feature considering mobile-specific challenges such as limited screen space and touch input?
   The authentication feature was designed with mobile-specific challenges in mind, focusing on a streamlined user interface that leverages biometric authentication (fingerprint, face ID) to minimize the need for complex input. The UI components are optimized for touch input with large, easily tappable buttons and concise forms to fit within the limited screen space.

2. Can you explain the rationale behind your choice of mobile design pattern(s) for the application? How did they help in addressing the unique challenges of mobile development?
   The Bloc Pattern was chosen for state management due to its separation of business logic and UI, making the code more modular and testable. This pattern helps manage complex state changes efficiently and ensures a reactive UI, which is crucial for mobile applications that need to respond quickly to user interactions and state changes.

3. What strategies did you employ to optimize database performance and storage efficiency for mobile environments? How did these strategies address the constraints of mobile devices?
   To optimize database performance and storage efficiency, I used efficient queries, indexing, and data caching strategies. Sqflite was chosen for local storage due to its lightweight nature and support for complex queries. Data was selectively synchronized with Firebase Firestore to balance performance and storage constraints, ensuring minimal local storage usage while maintaining data consistency.

4. How did you ensure data consistency and integrity across online and offline modes in the database integration and offline support section? What trade-offs did you make to achieve this?
   Data consistency and integrity were ensured using background synchronization tasks managed by WorkManager. Conflict resolution strategies, such as last-write-wins and user intervention, were employed to handle discrepancies. The trade-off was the added complexity in managing offline states and ensuring seamless synchronization without compromising user experience.

5. How did you incorporate error handling and user feedback mechanisms to enhance the user experience in the networking and data handling features? What were the key considerations?
   Error handling was implemented at multiple levels, including network request retries, graceful degradation, and user notifications for network failures. User feedback mechanisms included visual indicators like loaders and snack bars to inform users of ongoing processes and errors. Key considerations were to ensure that the app remains responsive and provides clear, actionable feedback to users in case of errors.

#Conclusion
This project demonstrates the implementation of advanced mobile development techniques to address critical challenges in networking, authentication, and database management. The structured approach and design patterns ensure a scalable, maintainable, and user-friendly application.
