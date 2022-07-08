Table table;
Table tableData;
StringList filesToDownload = new StringList("TA_POP_2009_F", "TA_POP_2009_M", 
"TA_POP_2010_F", "TA_POP_2010_M", 
"TA_POP_2011_F", "TA_POP_2011_M", 
"TA_POP_2012_F", "TA_POP_2012_M", 
"TA_POP_2013_F", "TA_POP_2013_M", 
"TA_POP_2014_F", "TA_POP_2014_M", 
"TA_POP_2015_F", "TA_POP_2015_M",
"TA_POP_2016_F", "TA_POP_2016_M",
"TA_POP_2017_F", "TA_POP_2017_M",
"TA_POP_2018_F", "TA_POP_2018_M",
"TA_POP_2019_F", "TA_POP_2019_M",
"TA_POP_2020_F", "TA_POP_2020_M",
"TA_POP_2021_F", "TA_POP_2021_M",
"TA_POP_2022_F", "TA_POP_2022_M");
StringList cities = new StringList("Arlon", "Anvers", "Bruxelles", "Charleroi", "Gand", "Hasselt", "Liège", "Namur", "Ostende", "Tournai");  


void setup() {

  table = new Table();

  table.addColumn("ID");
  table.addColumn("CITY_FR");
  table.addColumn("FST_NAME");
  table.addColumn("MS_FREQUENCY");
  table.addColumn("YEAR");
  table.addColumn("GENDER");

  for (String file : filesToDownload){
      tableData = loadTable("data/"+file+".csv", "header,csv");
      println(file);      
      for (String city : cities){
        for (TableRow row : tableData.rows()) {
          if (city.equals(row.getString("CITY_FR"))){
            TableRow newRow = table.addRow();
            newRow.setInt("ID", table.lastRowIndex());
            newRow.setString("CITY_FR", city);
            newRow.setString("FST_NAME", row.getString("FST_NAME"));
            newRow.setInt("MS_FREQUENCY", row.getInt("MS_FREQUENCY"));
            newRow.setInt("YEAR", row.getInt("YEAR"));
            newRow.setString("GENDER", row.getString("GENDER"));
          }
        }
      }
  }

  saveTable(table, "data/FrstNamesBelgium.csv");
  println("c'est fini");
}
