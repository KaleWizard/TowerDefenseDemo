
TurretBase tri;
Text triText;
TurretBase quad;
Text quadText;
TurretBase pent;
Text pentText;

void initializeSidebar() {
  tri = new TurretBase(1);
  tri.position = new PVector(125, 275);
  triText = new Text("$" + str(typeOneCost), 225, 250, 50, color(255));
  
  quad = new TurretBase(2);
  quad.position = new PVector(125, 525);
  quadText = new Text("$" + str(typeTwoCost), 225, 500, 50, color(255));
  
  pent = new TurretBase(3);
  pent.position = new PVector(125, 775);
  pentText = new Text("$" + str(typeThreeCost), 225, 750, 50, color(255));
}

void drawSidebar() {
  noStroke();
  fill(0);
  rect(0, 0, 400, height);
  updateMoney();
  playerMoneyText.render();
  noStroke();
  fill(#E9EBEF);
  for (int i = 0; i < 3; i++) {
    rect(50, 200 + 250 * i, 150, 150);
  }
  tri.render();
  triText.render();
  quad.render();
  quadText.render();
  pent.render();
  pentText.render();
}

void updateMoney() {
  playerMoneyText.setString("$" + str(playerMoney));
}
