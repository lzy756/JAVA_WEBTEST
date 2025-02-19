# Web_Test Maven Webapp

## Overview
This project is a simple Java web application built using Maven. It demonstrates basic usage of servlets and JSPs to handle user information.

## Prerequisites
- Java 8 or higher
- Maven 3.6 or higher
- An IDE such as IntelliJ IDEA

## Project Structure
```
Web_Test/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── web/
│   │   │               └── UserServlet.java
│   │   ├── resources/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── user.jsp
│   └── test/
├── .gitignore
├── pom.xml
└── README.md
```

## Dependencies
The project uses the following dependencies:
- `junit:junit:3.8.1` for testing
- `javax.servlet:javax.servlet-api:4.0.1` for servlet support
- `javax.servlet:jstl:1.2` for JSP Standard Tag Library
- `org.apache.taglibs:taglibs-standard-spec:1.2.5` and `org.apache.taglibs:taglibs-standard-impl:1.2.5` for JSTL implementation

## Building the Project
To build the project, run the following command in the project root directory:
```sh
mvn clean install
```

## Running the Project
1. Deploy the generated WAR file (`target/Web_Test.war`) to a servlet container such as Apache Tomcat.
2. Access the application at `http://localhost:8080/Web_Test/user`.

## Usage
- The `UserServlet` handles POST requests to `/user` and forwards the user information to `user.jsp`.
- The `user.jsp` displays the user information or a message if no information is available.

[//]: # (## Code Formatting)

[//]: # (To format the code in IntelliJ IDEA:)

[//]: # (1. Open the file you want to format.)

[//]: # (2. Use the shortcut `Ctrl + Alt + L` &#40;Windows/Linux&#41; or `Cmd + Option + L` &#40;macOS&#41;.)

[//]: # (## License)
[//]: # (This project is licensed under the MIT License. See the `LICENSE` file for details.)