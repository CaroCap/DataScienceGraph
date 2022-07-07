Table table = loadTable("TA_POP_2009_F.csv", "header,csv");

println(table.getRowCount() + " total rows in table");

int frequency = 0;
String city = "";
String name = "";

int frequencyMax = 0;

for (TableRow row : table.rows()) {
  city = row.getString("tx_descr_fr");
  name = row.getString("TX_FST_NAME");
  frequency = row.getInt("MS_FREQUENCY");

  //if (
  //int en1958 = row.getInt("1958");

  println(city + " " + name + " " + frequency);
}

//écran
size(800,800);
background(140,11,118);

//corps
stroke(211,152,200);
strokeWeight(5);
fill(255,196,245);
if (frequency > 0) {
  circle(400,400,600);
}

 println(frequency);
