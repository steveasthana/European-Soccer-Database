import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

public class Project {
  //Name of the MySQL account to use 
  private final String userName = "root";

  // Password for the MySQL account
  private final String password = "13072000david";

  // the name of the computer running MySQL
  private final String serverName = "localhost";

  // the port of MySQL server
  private final int portNumber = 3306;

  // the name of the database we are testing
  private final String dbName = "european_soccer";

  //establishes a connection with MySQL server
  public Connection getConnection() throws SQLException {
    Connection conn = null;
    Properties connectionProps = new Properties();
    // Establishes connection properties
    connectionProps.put("user", this.userName);
    connectionProps.put("password", this.password);
    // gets connection with the login information to database
    conn = DriverManager.getConnection("jdbc:mysql://"
        + this.serverName + ":" + this.portNumber + "/" + 
        this.dbName + "?characterEncoding=UTF-8&useSSL=false",
        connectionProps);
    // returns the connection
    return conn;
  }

  // request the user to login to the application
  public ArrayList<String> loginRequest(HashMap<String, String> admins, 
      HashMap<String, String> fans, Scanner reader) {
    System.out.println("During LOGIN, if you wish to quit the application enter: QUIT");
    String pass;
    String user;
    boolean active = true;
    boolean active1 = true;
    ArrayList<String> info = new ArrayList<String>();

    // checks if the login info is correct, keep asking for login until correct or QUIT
    while (active) {
      System.out.print("Enter a username: ");
      user = reader.next(); 

      // checks if the login is for an admin
      if (admins.containsKey(user)) {
        while (active1) {
          System.out.print("Enter a password: ");
          pass = reader.next();
          if (admins.get(user).equals(pass)) {
            System.out.print("\nLogin succeful. You are logged in as ADMIN\n");
            active = false;
            active1 = false;
            info.add(user);
            info.add("admin");
            return info;
          }
          else if (pass.equals("QUIT")) {
            active = false;
            active1 = false;
            return null;
          } 
        }
      }

      // checks if the login is for a fan
      else if (fans.containsKey(user)) {
        while (active1) {
          System.out.print("Enter a password: ");
          pass = reader.next();
          if (fans.get(user).equals(pass)) {
            System.out.print("\nLogin succeful. Welcome to European Soccer !\n");
            active = false;
            active1 = false;
            info.add(user);
            info.add("fan");
            return info;
          }
          else if (pass.equals("QUIT")) {
            active = false;
            active1 = false;
            return null;
          } 
        }
      }

      // quit condition
      else if (user.equals("QUIT")) {
        active = false;
        active1 = false;
        return null;
      }
    }
    return null;
  }

  // runs the main interface of the application (fan view)
  public void mainInterface(Scanner reader, Connection conn, String user) 
      throws SQLException {
    String option;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4"));
    boolean active = true;

    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Vote (1)");
      System.out.println("- Browse Data (2)");
      System.out.println("- Calculate a probability (3)");
      System.out.println("- Quit Application (4)");
      System.out.print("Enter the corresponding number: ");
      option = reader.next();

      if ((select.contains(option))) {
        switch (Integer.parseInt(option)) {
        case 1: 
          this.votesView(reader, conn, user);
          break;
        case 2: 
          this.dataView(reader, conn);
          break;
        case 3: 
          this.probViewer(reader, conn);
          break;
        case 4: // to quit
          active = false;
          break;
        } 
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // gives all the voting options
  public void votesView(Scanner reader, Connection conn, String user) 
      throws SQLException {
    boolean active = true;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4"));
    String answer;
    String option1;

    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Vote for a team (1)");
      System.out.println("- Vote for a league (2)");
      System.out.println("- Vote for a player (3)");
      System.out.println("- Return to main menu (4)");
      System.out.print("Enter the corresponding number: ");
      option1 = reader.next();

      if (select.contains(option1)) {
        switch (Integer.parseInt(option1)) {

        case 1: // updates the users team
          System.out.print("Please enter a team name: ");
          answer = reader.next();
          // checks if the name is valid, if valid proceeds to call procedure
          if (new Request(conn).getTeamNames().contains(answer)) {
            new Request(conn).voteTeam(answer, user);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name");
          }
          break;

        case 2: // updates the users league
          System.out.print("Please enter a league name: ");
          answer = reader.next();
          if (new Request(conn).getLeagueNames().contains(answer)) {
            new Request(conn).voteLeague(answer, user);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid league name");
          }
          break;

        case 3: // updates the users player
          System.out.print("Please enter a player id: ");
          answer = reader.next();
          if (new Request(conn).getPlayerID().contains(answer)) {
            new Request(conn).votePlayer(answer, user);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid player id");
          }
          break;

        case 4: // return to main menu
          active = false;
          break;
        }
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // gives all the read options for fans
  public void dataView(Scanner reader, Connection conn) throws SQLException {
    boolean active = true;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4", "5", "6",
        "7", "8", "9", "10", "11", "12", "13", "14"));
    String answer;
    String option;

    while (active) {

      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Look at a team's roster (1)");
      System.out.println("- Look at the teams in a league (2)");
      System.out.println("- Look at the team standings in a league (3)");
      System.out.println("- Check the most voted players (4)");
      System.out.println("- Check the most voted leagues (5)");
      System.out.println("- Check the most voted teams (6)");
      System.out.println("- Coaches that have been sacked this year (7)");
      System.out.println("- Look at all the players (8)");
      System.out.println("- Look at all the coaches (9)");
      System.out.println("- Look at all the games played (10)");
      System.out.println("- Look at all the teams (11)");
      System.out.println("- Look at all the leagues (12)");
      System.out.println("- Look at the transfer market (13)");
      System.out.println("- Return to the main menu (14)");
      
      System.out.println("\nEnter the corresponding number from the current set of options (READ OPTIONS): ");
      option = reader.next();

      if (select.contains(option)) {
        switch (Integer.parseInt(option)) {
        case 1: 
          System.out.print("Please enter a team name: ");
          answer = reader.next();
          // checks if the name is valid, if valid proceeds to call procedure
          if (new Request(conn).getTeamNames().contains(answer)) {
            new Request(conn).displayRoster(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name. Please select the same option if you want to try again.");
          }
          break;

        case 2: 
          System.out.print("Please enter a league name: ");
          answer = reader.next();
          if (new Request(conn).getLeagueNames().contains(answer)) {
            new Request(conn).leagueTeams(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid league name. Please select the same option if you want to try again.");
          }
          break;

        case 3: 
          System.out.print("Please enter a league name: ");
          answer = reader.next();
          if (new Request(conn).getLeagueNames().contains(answer)) {
            new Request(conn).leagueStandings(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid league name. Please select the same option if you want to try again.");
          }
          break;

        case 4: 
          new Request(conn).mostVotedPlayer();
          break;

        case 5: 
          new Request(conn).mostVotedLeague();
          break;

        case 6: 
          new Request(conn).mostVotedTeam();
          break;

        case 7: 
          new Request(conn).coachesSacked();
          break;

        case 8: 
          new Request(conn).allPlayers();
          break;

        case 9: 
          new Request(conn).allCoaches();
          break;

        case 10: 
          new Request(conn).allGames();
          break;

        case 11: 
          new Request(conn).allTeams();
          break;

        case 12: 
          new Request(conn).allLeagues();
          break;

        case 13: 
          new Request(conn).allTM();
          break;

        case 14: // return to main menu
          active = false;
          break;
        }
      }

      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // gives all the functions available to fans
  public void probViewer(Scanner reader, Connection conn) throws SQLException {
    boolean active = true;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4", "5", "6"));
    String answer;
    String answer2;
    String option1;

    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Calculate the winning chances of a team (1)");
      System.out.println("- Compare two teams based on who is most likely to win (2)");
      System.out.println("- Calculate the chances of a player being selected best player (by votes) (3)");
      System.out.println("- Calculate the chances of a team being selected best team (by votes) (4)");
      System.out.println("- Calculate the chances of a league being selected best league (by votes) (5)");
      System.out.println("- Return to main menu (6)");
      System.out.println("Enter the corresponding number: ");
      option1 = reader.next();

      if (select.contains(option1)) {
        switch (Integer.parseInt(option1)) {

        case 1: 
          System.out.print("Please enter a team name: ");
          answer = reader.next();
          if (new Request(conn).getTeamNames().contains(answer)) {
            new Request(conn).winProb(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name");
          }
          break;

        case 2: 
          System.out.print("Please enter a team name: ");
          answer = reader.next();
          System.out.print("Please enter another team name: ");
          answer2 = reader.next();
          ArrayList<String> teams = new Request(conn).getTeamNames();
          if (teams.contains(answer) && teams.contains(answer2)) {
            new Request(conn).compareTeams(answer, answer2);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name");
          }
          break;

        case 3: 
          System.out.print("Please enter a player id: ");
          answer = reader.next();
          if (new Request(conn).getPlayerID().contains(answer)) {
            new Request(conn).playerByVotes(answer);
            System.out.print("\n");
          }
          else {
            System.out.print("Invalid player name: ");
          }
          break;

        case 4: 
          System.out.print("Please enter a team name: ");
          answer = reader.next();
          if (new Request(conn).getTeamNames().contains(answer)) {
            new Request(conn).teamByVotes(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name");
          }
          break;

        case 5: 
          System.out.print("Please enter a league name: ");
          answer = reader.next();
          if (new Request(conn).getLeagueNames().contains(answer)) {
            new Request(conn).leagueByVotes(answer);
            System.out.print("\n");
          }
          else {
            System.out.print("Invalid league name: ");
          }
          break;

        case 6: // return to main menu
          active = false;
          break;
        }
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // runs the main interface for administrators
  public void adminInterface(Scanner reader, Connection conn) throws SQLException {
    String option;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4", "5"));
    boolean active = true;

    // allows the user to enter inputs
    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- CREATE/INSERT (1)");
      System.out.println("- READ (2)");
      System.out.println("- UPDATE (3)");
      System.out.println("- DELETE (4)");
      System.out.println("- Quit application (5)");
      System.out.print("Enter the corresponding number: ");
      option = reader.next();

      // takes you to corresponding view
      if ((select.contains(option))) {
        switch (Integer.parseInt(option)) {
        case 1: 
          this.insertView(reader, conn);
          break;
        case 2: 
          this.readView(reader, conn);
          break;
        case 3: 
          this.updateView(reader, conn);
          break;
        case 4: 
          this.deleteView(reader, conn);
          break;
        case 5: // to quit
          active = false;
          break;
        } 
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // displays all the insert options for admin 
  public void insertView(Scanner reader, Connection conn) throws SQLException {
    String option;
    String answer;
    String answer1;
    String answer2;
    String answer3;
    String answer4;
    String answer5;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4", "5"));
    boolean active = true;

    // allows the user to enter an input
    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Insert a new player (1)");
      System.out.println("- Insert a new team (2)");
      System.out.println("- Insert a new game/match (3)");
      System.out.println("- Insert player into transfer market (4)");
      System.out.println("- Return to main menu (5)");
      System.out.print("Please enter a corresponding number: ");
      option = reader.next();

      if (select.contains(option)) {
        switch (Integer.parseInt(option)) {

        case 1: 
          System.out.print("Create a new player id: ");
          answer = reader.next();
          // checks that the playerID exits
          if (new Request(conn).getPlayerID().contains(answer)) {
            System.out.print("That ID already exists\n");
            break;
          }
          System.out.print("Enter the first name: ");
          answer1 = reader.next();
          System.out.print("Enter the last name: ");
          answer2 = reader.next();
          System.out.print("Enter an age: ");
          answer3 = reader.next();
          // checks that its an integer
          try {
            Integer.parseInt(answer3);
          }
          catch (NumberFormatException e) {
            System.out.print("Age must be a number\n");
            break;
          }
          System.out.print("Enter a field postion: ");
          answer4 = reader.next();
          System.out.print("Enter a team name: ");
          answer5 = reader.next();
          // checks that the team name is valid
          if (!(new Request(conn).getTeamNames().contains(answer5))) {
            System.out.print("Not a valid team name\n");
            break;
          }
          new Request(conn).insert2Players(answer, answer1, answer2, answer3, answer4, answer5);
          break;
        case 2: 
          System.out.print("Create a new team id: ");
          answer = reader.next();
          // checks that the team id is valid
          if (new Request(conn).getTeamIDs().contains(answer)) {
            System.out.print("The ID already exists\n");
            break;
          }
          System.out.print("Insert the team name: ");
          answer1 = reader.next();
          // checks that the team name is valid
          if (new Request(conn).getTeamNames().contains(answer1)) {
            System.out.print("That team already exists\n");
            break;
          }
          System.out.print("Insert a coach ID: ");
          answer2 = reader.next();
          // checks if the coach id is valid
          if (new Request(conn).getCoachesIDs().contains(answer2)) {
            System.out.print("Another team has that coach.\n");
            break;
          }
          System.out.print("Insert a league name: ");
          answer3 = reader.next();
          // checks that the league name is valid
          if (!(new Request(conn).getLeagueNames().contains(answer3))) {
            System.out.print("Invaid league name.\n");
            break;
          }
          new Request(conn).insert2Teams(answer, answer1, answer2, answer3);
          break;
        case 3: 
          System.out.print("Create a new game id: ");
          answer = reader.next();
          // checks that the game id does not already exist
          if (new Request(conn).getGameIDs().contains(answer)) {
            System.out.print("The id already exists.\n");
            break;
          }
          System.out.print("Enter the home team's name: ");
          answer1 = reader.next();
          System.out.print("Enter the away team's name: ");
          answer2 = reader.next();
          // checks that both team names are valid
          ArrayList<String> team = new Request(conn).getTeamNames();
          if (!(team.contains(answer1)) || !(team.contains(answer2))) {
            System.out.print("One of the team names is incorrect.\n");
            break;
          }
          System.out.print("Enter home team's goals after full time: ");
          answer3 = reader.next();
          System.out.print("Enter away team's goals after full time: ");
          answer4 = reader.next();
          // checks that inputs are integers
          try {
            Integer.parseInt(answer3);
            Integer.parseInt(answer4);
          }
          catch (NumberFormatException e) {
            System.out.print("The number of goals needs to be a number.\n");
            break;
          }
          new Request(conn).insert2Games(answer, answer1, answer2, answer3, answer4);
          break;
        case 4: 
          System.out.print("Enter the player id: ");
          answer = reader.next();
          // checks that the id does not already exist
          if (!(new Request(conn).getPlayerID().contains(answer))) {
            System.out.print("Not a valif id.\n");
            break;
          }
          System.out.print("Enter a price for the player: ");
          answer1 = reader.next();
          // checks that input is an integer
          try {
            Integer.parseInt(answer1);
          }
          catch (NumberFormatException e) {
            System.out.print("Price must be a number.\n");
            break;
          }
          new Request(conn).add2Transfers(answer, Integer.parseInt(answer1));
          break;
        case 5: // return to main menu
          active = false;
          break;
        }
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // displays all the read options for admin
  public void readView(Scanner reader, Connection conn) throws SQLException {
    boolean active = true;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2", "3", "4", "5", "6",
        "7", "8", "9", "10"));
    String option;

    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- View all players (1)");
      System.out.println("- View all coaches (2)");
      System.out.println("- View all games/matches (3)");
      System.out.println("- View all teams (4)");
      System.out.println("- View all leagues(5)");
      System.out.println("- View trasnfer market (6)");
      System.out.println("- View all admins (7)");
      System.out.println("- View all fans (8)");
      System.out.println("- View archived games (9)");
      System.out.println("Return to main menu (10)");
      System.out.print("\nEnter the corresponding number: ");
      option = reader.next();

      // each case calls a method to display appropriate data
      if (select.contains(option)) {
        switch (Integer.parseInt(option)) {
        case 1: 
          new Request(conn).allPlayers();
          break;

        case 2: 
          new Request(conn).allCoaches();
          break;

        case 3: 
          new Request(conn).allGames();
          break;

        case 4: 
          new Request(conn).allTeams();
          break;

        case 5: 
          new Request(conn).allLeagues();
          break;

        case 6: 
          new Request(conn).allTM();
          break;

        case 7: 
          new Request(conn).allAdmins();
          break;

        case 8: 
          new Request(conn).allFans();
          break;

        case 9: 
          new Request(conn).allAG();
          break;

        case 10: // return to main menu
          active = false;
          break;
        }
      }

      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // displays all the update options for admin
  public void updateView(Scanner reader, Connection conn) throws SQLException {
    String option;
    ArrayList<String> select = new ArrayList<String>(Arrays.asList("1", "2"));
    boolean active = true;
    String answer;

    // allows user to enter inputs
    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Sack a manager (1)");
      System.out.println("Return to main menu (2)");
      System.out.println("Enter the corresponding number: ");
      option = reader.next();
      
      if ((select.contains(option))) {
        
        switch (Integer.parseInt(option)) {
        case 1: 
          System.out.println("Please enter a team name");
          answer = reader.next();
          // checks if the team name exists in DB
          if (new Request(conn).getTeamNames().contains(answer)) {
            new Request(conn).sackManager(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid team name.");
          }
          break;
        case 2: 
          active = false;
          break;
        } 
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // displays all the delete options for admin
  public void deleteView(Scanner reader, Connection conn) throws SQLException {
    String option;
    String answer;
    String answer2;
    // keeps track of available options
    ArrayList<String> options = new ArrayList<String>(Arrays.asList("1", "2", "3"));
    boolean active = true;

    // allows user to pick an option
    while (active) {
      System.out.println("\nWhat do you wish to do?");
      System.out.println("- Delete a fan from database (1)");
      System.out.println("- Buy a player from transfer market (2)");
      System.out.println("- Return to main menu (3)");
      System.out.println("Enter the corresponding number: ");
      option = reader.next();

      if ((options.contains(option))) {
        // all options available
        switch (Integer.parseInt(option)) {

        case 1: 
          System.out.print("Please enter the user id");
          answer = reader.next();
          // checks if the user id exists first
          if (new Request(conn).getFanID().contains(answer)) {
            new Request(conn).remove(answer);
            System.out.print("\n");
          }
          else {
            System.out.println("User id not found");
          }
          break;

        case 2: 
          System.out.print("Please enter a player id: ");
          answer = reader.next();
          // checks if the player is in the transfer market
          if (!(new Request(conn).getPlayerInTM().contains(answer))) {
            System.out.print("Player is not in the market.\n");
            break;
          }
          System.out.println("Please enter a team name: ");
          answer2 = reader.next();
          // checks if the inputs are valid
          if (new Request(conn).getPlayerID().contains(answer) && 
              new Request(conn).getTeamNames().contains(answer2)) {
            new Request(conn).buyFromTransferMarket(answer, answer2);
            System.out.print("\n");
          }
          else {
            System.out.println("Invalid player id or team name.\n");
          }
          break;
        case 3: // option to return to main menu
          active = false;
          break;
        } 
      }
      else {
        System.out.print("Invalid Input. Select an option again.\n\n");
      }
    }
  }

  // runs the program
  public void run() throws SQLException {
    Connection conn = null;
    String user = null;
    ArrayList<String> login_success = null;
    // opens a reader so that user can input values
    Scanner reader = new Scanner(System.in);
    reader.useDelimiter(System.getProperty("line.separator"));
    HashMap<String, String> admins = new HashMap<String, String>();
    HashMap<String, String> fans = new HashMap<String, String>();
    try {
      // makes a connection to DB
      conn = this.getConnection(); 
      // gets all admin logins
      admins = new Request(conn).getAdminLogins();
      // gets all fan logins
      fans = new Request(conn).getFanLogins();
      // login_succes is a list with the type of login (fan or admin) and the user name
      login_success = this.loginRequest(admins, fans, reader);
      if (!(login_success == null)) {
        user = new Request(conn).getUserID(login_success.get(0)); 
      }
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not connect to the databse\n");
      e.printStackTrace();
    }
    if (login_success == null) {
      // do nothing
    }
    // go to main interface (fans only)
    else if (login_success.get(1) == "fan") {
      this.mainInterface(reader, conn, user);
    }
    // go to administrator's interface (administrator only)
    else if (login_success.get(1) == "admin") {
      this.adminInterface(reader, conn);
    }
    // closes the reader
    reader.close();
  }

  // to initialize application
  public static void main(String[] args) throws SQLException {
    Project app = new Project();
    // runs application
    app.run();
    System.out.println("\n\nSystem: ... Application terminated ...");
  }
}