# Mobile Development Challenge

## Selected Sections
1. Advanced Networking and Data Handling
2. Secure Authentication and User Management
3. Robust Database Integration and Offline Support
## Run the Project

1. **Install Dependencies:**
   ```bash
   flutter pub get

2. **Run the Project:**
   ```bash
   flutter run

## Project Structure
 ```
📦lib
 ┣ 📂core
 ┃ ┣ 📂error
 ┃ ┃ ┣ 📜exceptions.dart
 ┃ ┃ ┗ 📜failure.dart
 ┃ ┣ 📂protobuf
 ┃ ┃ ┣ 📂news_request
 ┃ ┃ ┃ ┣ 📜news.pb.dart
 ┃ ┃ ┃ ┣ 📜news.pbenum.dart
 ┃ ┃ ┃ ┣ 📜news.pbjson.dart
 ┃ ┃ ┃ ┗ 📜news.pbserver.dart
 ┃ ┃ ┗ 📂news_response
 ┃ ┃ ┃ ┣ 📜news_response.pb.dart
 ┃ ┃ ┃ ┣ 📜news_response.pbenum.dart
 ┃ ┃ ┃ ┣ 📜news_response.pbjson.dart
 ┃ ┃ ┃ ┗ 📜news_response.pbserver.dart
 ┃ ┣ 📂service
 ┃ ┃ ┣ 📂local
 ┃ ┃ ┃ ┣ 📂interface
 ┃ ┃ ┃ ┃ ┗ 📜i_simple_user_data.dart
 ┃ ┃ ┃ ┗ 📜user_data_factory.dart
 ┃ ┃ ┣ 📂remote
 ┃ ┃ ┃ ┣ 📜api_consumer.dart
 ┃ ┃ ┃ ┣ 📜dio_consumer.dart
 ┃ ┃ ┃ ┣ 📜dio_interceptor.dart
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
 ┃ ┃ ┃ ┃ ┃ ┣ 📜news_item.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜news_list_widget.dart
 ┃ ┃ ┃ ┃ ┗ 📂news_details
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cusom_button.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜custom_text.dart
 ┃ ┗ 📜splash_screen.dart
 ┣ 📂proto
 ┃ ┣ 📜news.proto
 ┃ ┗ 📜news_response.proto
 ┣ 📂scripts
 ┃ ┣ 📜flutter_build_apk
 ┃ ┣ 📜flutter_build_dev_apk
 ┃ ┣ 📜flutter_build_ipa
 ┃ ┣ 📜flutter_build_pro_apk
 ┃ ┣ 📜flutter_build_pro_appbundle
 ┃ ┣ 📜flutter_build_pro_ipa
 ┃ ┣ 📜flutter_build_runner
 ┃ ┣ 📜flutter_build_tst_apk
 ┃ ┗ 📜protoc
 ┗ 📜main.dart
 ```
## Project Diagram
![alt text](https://github.com/essam939/nyt_task/blob/main/diagram.png?raw=true)

## Detailed Description
# Advanced Networking and Data Handling
1. Networking Layer: Built with Dio, handling HTTP requests and networking breakdowns.
2. Data Caching: Worked with shared_preferences and custom caching strategies to handle dynamic caching based on network conditions and user preference.
3. Serializing data: Protocol Buffers are applied to promote efficiency in data transmission and parsing.

# Secure Authentication and User Management
1. Multi-Factor Authentication: Integrated local_auth for biometric authentication and OTP for secondary authentication.
2. OAuth 2.0: Firebase Authentication has been implemented to support OAuth 2.0.
3. End-to-End Encryption: Flutter_secure_storage along with AES encryption at the core delivers security to the storage and transfer of data.
# Robust Database Integration and Offline Support
1. Database Integration: sqflite for local storage; Firebase Firestore for distributed database support.
2. Offline Synchronization: Workmanager is used for handling background tasks for offline synchronization.
3. Conflict Resolution: Various strategies for conflict resolution have been developed to ensure the integrity of data in the offline mode.

# Design Pattern: Clean Architecture
Clean Architecture was chosen to be able to make the codebase maintainable, scalable, and testable by separating different concerns. Basically, it breaks the project down into different layers:
1. Presentation Layer: This layer holds the UI and controllers with Cubits/Bloc for state management.
2. Domain Layer: This is where all business logic goes; use cases and entities.
3. Data Layer: Manages data operations, including data sources and repositories.

# Critical Thinking Questions
1. How did you approach the design and implementation of the authentication feature considering mobile-specific challenges such as limited screen space and touch input?

   The authentication feature was designed to understand mobile-specific challenges in providing users with a streamlined interface enabled by biometric authentication, fingerprint or face ID-based, which minimizes the need for complex input. The UI elements are tailored to touch input, using big and far-apart buttons and concise forms so that they can fit within the small screen space.

2. Can you explain the rationale behind your choice of mobile design pattern(s) for the application? How did they help in addressing the unique challenges of mobile development?

   It implemented the Bloc Pattern for state management, hence separating business logic from UI to make the code modular and testable. The pattern handles difficult state changes efficiently, having a reactive UI, which is very important in mobile apps that need quick responses in view of user interaction and state changes.

3. What strategies did you employ to optimize database performance and storage efficiency for mobile environments? How did these strategies address the constraints of mobile devices?

   I applied efficient techniques of querying, indexing, and data caching to optimize database performance for efficient storage. Sqflite was chosen for local storage because it is lightweight and has ad-hoc complex querying capabilities. Data was successfully synchronized with Firebase Firestore, balancing performance versus the constraints of storage to consume very minimal local storage while ensuring consistency of data

4. How did you ensure data consistency and integrity across online and offline modes in the database integration and offline support section? What trade-offs did you make to achieve this?

   Ensured data consistency and integrity using background synchronization tasks managed by WorkManager. Then, use conflict resolution strategies such as last-write-wins and user intervention for handling discrepancies. This adds complexity in managing offline states and thus makes seamless synchronization without any degradation of the user experience.

5. How did you incorporate error handling and user feedback mechanisms to enhance the user experience in the networking and data handling features? What were the key considerations?

   It has implemented error handling at several levels: network request retries, graceful degradation, and user notifications in case of failure of the network. Among others, mechanisms for user feedback would include visual indicators, such as loaders and snack bars, for letting users know that something is processing or if an error has occurred. Key considerations would be to make sure that the app remains responsive and provides clear, actionable feedback to users in case of errors.
