# E-Book Portal

## Requirements
- Java 11
- Apache Tomcat 9
- MySQL 8
- Maven 3.8+

## Database
1. Open MySQL Workbench.
2. Run `database.sql`.
3. Default connection is configured in `src/main/java/com/DB/DBConnect.java`:
   - Database: `ebook_app`
   - Username: `root`
   - Password: `1234`

## Build and Run
1. Open the project as a Maven project in Eclipse/IntelliJ.
2. Run `mvn clean package`.
3. Deploy `target/Ebook-App.war` on Tomcat 9.
4. Open `http://localhost:8080/Ebook-App/`.

## Login
- Admin: `admin@gmail.com` / `1234`
- Sample user: `shivam@gmail.com` / `1234`

## Notes
- Uses `javax.servlet`, therefore use Tomcat 9, not Tomcat 10/11.
- Uploaded book images are stored in the deployed `book` directory.
