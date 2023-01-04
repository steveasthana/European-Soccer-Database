import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

// represents a procedure or a function call
class Request {
  Statement stmt;
  Connection conn;

  // constructor that takes in a connection (the connection should be to the DB)
  Request(Connection conn) throws SQLException {
    // creates a statement by default when a procedure object is created
    this.stmt = conn.createStatement();
    this.conn = conn;
  }

  // Helpers for displaying data into the console/command window

  //Method that displays the fields of a table
  public ArrayList<String> displayFields(ResultSetMetaData t) throws SQLException {
    // make a variable to store the column names
    ArrayList<String> result = new ArrayList<String>();
    // prints the fields of the table
    System.out.print("fields: ");
    try {
      // loops through metadata and displays column names
      for (int i = 1; i <= (t.getColumnCount()); i++) {
        // adds column name to local variable
        result.add(t.getColumnName(i));
        if (i == t.getColumnCount()) {
          System.out.print(t.getColumnName(i));
        }
        else {
          System.out.print(t.getColumnName(i) + ", ");
        }
      }
    }
    finally { }
    // returns a list with the column names
    return result;
  }

  // method that displays the given data
  public void displayData(ResultSet rs, ArrayList<String> colNames) throws SQLException {
    System.out.print("\nData: ");
    System.out.print("\n");
    try {
      while (rs.next()) {
        // temporary space to hold the data
        String data = "";
        // gets the data and adds to temporary space
        for (String col : colNames) {
          data = data + rs.getString(col) + ", ";
        }
        // remove extra unnecessary characters at the end of string
        data = data.substring(0, data.length() - 2);
        // prints out the data
        System.out.print("     " + data);
        System.out.print("\n");
      }
    }
    // closes the statement and the cursor
    finally {
      rs.close();
    }
  }

  //Method gets the column name -- This is for a function 
  public String getFields(ResultSetMetaData t) throws SQLException {
    // make a variable to store the column names
    String result = "";
    try {
      // there is a single field because function returns a single value
      result = result + (t.getColumnName(1));
    }
    finally { }
    // returns a list with the column names
    return result;
  }

  //method that single value data -- This is for a function
  public void displayResult(ResultSet rs, String colNames) throws SQLException {
    System.out.print("\nResult: ");
    try {
      // checks if a tuple exists
      if (rs.next()) {
        // get the result from result set, its a single result because its a function
        System.out.print(rs.getString(colNames));
      }
    }
    // closes the statement and the cursor
    finally {
      rs.close();
    }
  }

  // Procedures:

  // READ OP
  // returns the given FAN ID given the user name
  public String getUserID(String username) throws SQLException {
    // make a query
    String result = "";
    String query = "call getfanid('" + username + "');";
    // makes a cursor to traverse the data
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      if (rs.next()) {
        result = (rs.getString("user_id"));
      }
    }
    finally {
      // closes the statement and the result set
      this.stmt.close();
      rs.close(); 
    }
    return result;
  }

  // READ OP
  // returns a list will all the active (non-sacked) coaches
  public ArrayList<String> getCoachesIDs() throws SQLException {
    ArrayList<String> result = new ArrayList<String>();
    String query = "call teams_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    while (rs.next()) {
      result.add(rs.getString("team_coach"));
    }
    return result;
  }

  //READ OP
  // return a list with all team ids
  public ArrayList<String> getTeamIDs() throws SQLException {
    ArrayList<String> result = new ArrayList<String>();
    String query = "call teams_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    while (rs.next()) {
      result.add(rs.getString("team_id"));
    }
    return result;
  }

  //READ OP
  // return a list with all game ids
  public ArrayList<String> getGameIDs() throws SQLException {
    ArrayList<String> result = new ArrayList<String>();
    String query = "call games_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    while (rs.next()) {
      result.add(rs.getString("game_id"));
    }
    return result;
  }
  
  // READ OP
  // return a list with all the player ids i transfer market
  public ArrayList<String> getPlayerInTM() throws SQLException {
    ArrayList<String> result = new ArrayList<String>();
    String query = "call tm_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    while (rs.next()) {
      result.add(rs.getString("player_id"));
    }
    return result;
  }

  // READ OP
  // returns a teams roster/ Input is the team's name
  public void displayRoster(String teamName) throws SQLException {
    // make a query
    String query = "call roster('" + teamName + "');";
    // makes a cursor to traverse the data
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      // displays the fields of table
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      // displays the data
      this.displayData(rs, colNames);
    }
    finally {
      // closes the statement and the result set
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns the teams in specified league/ Input must be league's name
  public void leagueTeams(String leagueName) throws SQLException {
    String query = "call league_teams('" + leagueName + "');";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns the leagues standings (top 5 teams based on wins)/ Input is the league's name
  public void leagueStandings(String leagueName) throws SQLException {
    String query = "call standings('" + leagueName + "');";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns the top 10 most voted players
  public void mostVotedPlayer() throws SQLException {
    String query = "call top10_player_votes();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  //returns the top 10 most voted leagues
  public void mostVotedLeague() throws SQLException {
    String query = "call top10_league_votes();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  //returns the top 10 most voted leagues
  public void mostVotedTeam() throws SQLException {
    String query = "call top10_teams_votes();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all the coaches that have been sacked at least once this year
  public void coachesSacked() throws SQLException {
    String query = "call current_sacked();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all the players in the DB
  public void allPlayers() throws SQLException {
    String query = "call players_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all the fans in the DB
  public void allFans() throws SQLException {
    String query = "call fans_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all administrators in DB
  public void allAdmins() throws SQLException {
    String query = "call admins_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all archived games in DB
  public void allAG() throws SQLException {
    String query = "call ag_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all coaches in DB
  public void allCoaches() throws SQLException {
    String query = "call coaches_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // READ OP
  // returns all games in DB
  public void allGames() throws SQLException {
    String query = "call games_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }  

  // READ OP
  // returns all teams in DB
  public void allTeams() throws SQLException {
    String query = "call teams_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }  

  // READ OP
  // returns all leagues in DB
  public void allLeagues() throws SQLException {
    String query = "call leagues_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }  

  // READ OP
  // returns all players in transfer market in DB
  public void allTM() throws SQLException {
    String query = "call tm_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      ArrayList<String> colNames = this.displayFields(rs.getMetaData()); 
      this.displayData(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  //READ OP
  // gets users and passwords and introduces them to a hash map
  public HashMap<String, String> getFanLogins() throws SQLException {
    // makes a hash map
    HashMap<String, String> logins = new HashMap<String, String>();
    // prepare and call query
    String query = "call userandpass();";
    ResultSet rs = this.stmt.executeQuery(query);

    // puts all user_names and passwords in hash map
    try {
      while (rs.next()) {
        logins.put(rs.getString("user_name"), rs.getString("user_password"));
      }
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }

    // returns the hash map
    return logins;
  }

  // READ OP
  // gets users and passwords and introduces them to a hash map
  public HashMap<String, String> getAdminLogins() throws SQLException {
    HashMap<String, String> logins = new HashMap<String, String>();
    String query = "call adminlogin();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      while (rs.next()) {
        logins.put(rs.getString("user_name"), rs.getString("user_password"));
      }
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
    return logins;
  }

  // READ OP
  // gets all the team names and adds them to an array
  public ArrayList<String> getTeamNames() throws SQLException {
    ArrayList<String> names = new ArrayList<String>();
    String query = "call teams_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      while (rs.next()) {
        names.add(rs.getString("team_name"));
      }
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
    return names;
  }

  //READ OP
  // gets all the league names and adds them to an array
  public ArrayList<String> getLeagueNames() throws SQLException {
    ArrayList<String> names = new ArrayList<String>();
    String query = "call leagues_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      while (rs.next()) {
        names.add(rs.getString("league_name"));
      }
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
    return names;
  }

  // READ OP
  // gets all the player ids and adds them to an array
  public ArrayList<String> getPlayerID() throws SQLException {
    ArrayList<String> names = new ArrayList<String>();
    String query = "call players_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      while (rs.next()) {
        names.add(rs.getString("player_id"));
      }
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
    return names;
  }

  // READ OP
  // gets all the fan ids
  public ArrayList<String> getFanID() throws SQLException {
    ArrayList<String> result = new ArrayList<String>();
    String query = "call fans_select();";
    ResultSet rs = this.stmt.executeQuery(query);
    while (rs.next()) {
      result.add(rs.getString("user_id"));
    }
    return result;
  }

  // INSERT OP
  // adds a player to the transfer_market table/ This activates a trigger/ Input: player id
  public void add2Transfers(String playerID, int price) throws SQLException {
    String query = "call transfer('" + playerID + "'," + String.valueOf(price) + ");";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not add player into table");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  //INSERT OP
  // insert a new player into the DB / INPUT: ID, FIRST, LAST, AGE, POSITION, TEAM NAME
  public void insert2Players(String playerID, String first, String last, String age, 
      String pos, String team) throws SQLException {
    String query = "call insert_player('"+ playerID +"', '" + first + "', '" + last + "', " 
        + age + ", '"+ pos + "', '" + team + "');";
    try {
      this.stmt.executeQuery(query); 
      System.out.print("Request Completed.\n");
    }
    finally {
      this.stmt.close();
    }
  }

  // INSERT OP
  // inserts a new team into the DB /Input ID, NAME, COACH ID, LEAGUE NAME
  public void insert2Teams(String teamID, String teamName, String teamCoach, 
      String teamLeague) throws SQLException {
    String query = "call insert_team('"+ teamID +"', '" + teamName + "', '" + teamCoach + "', '" 
        + teamLeague + "');";
    try {
      this.stmt.executeQuery(query); 
      System.out.print("Request Completed.\n");
    }
    finally {
      this.stmt.close();
    }
  }

  //INSERT OP
  // inserts a new game into DB/ Inputs: id, team1 name, team2 name, goals team1, goals team2
  public void insert2Games(String gameID, String team1, String team2, String goal1, String goal2) throws SQLException {
    String query = "call insert_game('"+ gameID + "', '" + team1 + "', '" + team2 + "', " + goal1 + ", " + goal2 + ");";
    try {
      this.stmt.executeQuery(query); 
      System.out.print("Request Completed.\n");
    }
    finally {
      this.stmt.close();
    }
  }

  // UPDATE OP
  // Sacks the current manager/ This activates a trigger/ Input: team name
  public void sackManager(String teamName) throws SQLException {
    String query = "call sack('" + teamName + "');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete the request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // UPDATE OP
  // lets fan vote for a league/ Input: league name and the user ID
  public void voteLeague(String leagueName, String fanID) throws SQLException {
    String query = "call vote_for_league('" + leagueName + "', " + "'" + fanID +"');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // UPDATE OP
  // lets fan vote for a team/ Input: team name and the user ID
  public void voteTeam(String teamName, String fanID) throws SQLException {
    String query = "call vote_for_team('" + teamName + "', " + "'" + fanID +"');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // UPDATE OP
  // lets fan vote for a team/ Input: player ID and the user ID
  public void votePlayer(String playerID, String fanID) throws SQLException {
    String query = "call vote_for_player('" + playerID + "', " + "'" + fanID +"');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // DELETE OP
  // deletes a fan (not administrator) from the database/ Input: user ID
  public void remove(String fanID) throws SQLException {
    String query = "call delete_fan('" + fanID + "');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");

    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // DELETE + UPDATE OP
  // allows the admin to move a player from transfer market to a team
  public void buyFromTransferMarket(String playerID, String teamName) throws SQLException {
    String query = "call buy('" + playerID + "', '" + teamName + "');";
    try {
      this.stmt.execute(query);
      System.out.println("Request was completed");
    }
    catch (SQLException e) {
      System.out.println("ERROR: Could not complete request");
      e.printStackTrace();
    }
    finally {
      stmt.close();
    }
  }

  // Functions: 

  // calculates the probability of team winning a game/ Input: team name
  public void winProb(String teamName) throws SQLException {
    // prepares the query
    String query = "select win_probability('" + teamName + "');";
    // executes the query
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      // gets the field names
      String colNames = this.getFields(rs.getMetaData()); 
      // gets the data that was returned by function
      this.displayResult(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // calculate the chances to win best Player by votes/ Input: player id
  public void playerByVotes(String playerId) throws SQLException {
    String query = "select best_player_chance('" + playerId + "');";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      String colNames = this.getFields(rs.getMetaData()); 
      this.displayResult(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // calculates the chances to win best Team by votes/ Input: team name
  public void teamByVotes(String teamName) throws SQLException {
    String query = "select best_team_chance('" + teamName + "')";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      String colNames = this.getFields(rs.getMetaData()); 
      this.displayResult(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // calculates the chances to win best league by votes/ Input: league name
  public void leagueByVotes(String leagueName) throws SQLException {
    String query = "select best_league_chance('" + leagueName + "')";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      String colNames = this.getFields(rs.getMetaData()); 
      this.displayResult(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    }
  }

  // returns which team is more likely to win a match between themselves
  public void compareTeams(String team1, String team2) throws SQLException {
    String query = "select compare_teams('" + team1 + "', '" + team2 + "')";
    ResultSet rs = this.stmt.executeQuery(query);
    try {
      String colNames = this.getFields(rs.getMetaData()); 
      this.displayResult(rs, colNames);
    }
    finally {
      this.stmt.close();
      rs.close(); 
    } 
  }
}
