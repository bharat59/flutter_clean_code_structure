# news_app_clean_architecture

News app demo with clean architecture.

## Packages used 

environment:
- sdk: '>=3.1.1 <4.0.0'

- cupertino_icons: ^1.0.0
- ionicons: ^0.2.2
- retrofit: ^3.3.0
- dio: ^4.0.6
- flutter_bloc: ^8.1.2
- flutter_hooks: ^0.18.5+1
- get_it: ^7.2.0
- floor: ^1.4.1
- equatable: ^2.0.5
- oktoast: ^3.3.1
- awesome_dio_interceptor: ^0.0.2+4
- auto_route: ^5.0.4
- lint: ^2.0.1
- auto_route_generator: ^5.0.3
- retrofit_generator: ^4.1.2
- floor_generator: ^1.4.1
- build_runner: ^2.3.3
- flutter_lints: ^2.0.0

## Clean Architecture

This Flutter project is structured following the Clean Architecture pattern. Clean Architecture is an architectural approach that separates the concerns of an application into distinct layers, making it highly maintainable, testable, and independent of external frameworks.

### Key Principles of Clean Architecture

1. **Separation of Concerns**: The Clean Architecture enforces a clear separation between the business rules, application use cases, and external frameworks or libraries. This separation makes it easier to modify or replace any component without affecting the rest of the application.

2. **Dependency Rule**: Dependencies flow inward. The inner layers of the architecture are independent and contain business logic, while the outer layers are responsible for technical details and frameworks.

3. **Testability**: Clean Architecture promotes a high degree of testability. The core business logic can be thoroughly tested without requiring the use of external dependencies.

4. **Maintainability**: Because the business logic is isolated from external frameworks, the application remains maintainable and adaptable to changing requirements or technologies.

### Layers in Clean Architecture

This Flutter project is organized into the following layers:

1. **Entities**: The innermost layer, containing business entities and core domain models. These entities represent the core business rules and contain no dependencies on external frameworks.

2. **Use Cases**: Also known as application or business logic layer, this layer defines application-specific use cases and interactors. It encapsulates the core business rules and use case logic.

3. **Repositories**: The repository layer defines interfaces for data sources, abstracting away specific data access methods. Repositories can be implemented with different data sources, such as databases, APIs, or in-memory data.

4. **Frameworks & Drivers**: The outermost layer, responsible for interacting with external frameworks, libraries, and the user interface (UI). This layer includes platform-specific code, user interfaces, and data sources like databases and APIs.

### Benefits of Clean Architecture in This Project

- **Modularity**: Clean Architecture ensures that the application is divided into discrete, interchangeable components, making it easier to maintain and scale.

- **Testability**: The separation of concerns allows for unit tests and UI tests to be written more effectively, ensuring the reliability of the application.

- **Independence**: The core business logic remains independent of external frameworks and libraries, reducing dependencies and making the application more adaptable.

- **Scalability**: As the project grows, the Clean Architecture structure provides a solid foundation for adding new features and extending the application.

By adhering to Clean Architecture principles, this project aims to maintain a high level of code quality, flexibility, and testability, ensuring its longevity and facilitating collaboration among developers.
