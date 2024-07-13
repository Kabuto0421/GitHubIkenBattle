class FireCharacter extends Character {
  FireCharacter(float x, float y, CharacterCountManager countManager) {
    super("Fire Character", x, y, 0, countManager); // 属性0: Fire
  }

  void initializeStats() {
    this.hp = 60; // 1から200の範囲に制限
    this.attackPower = 100; // 1から100の範囲に制限
    this.speed = 40; // 1から100の範囲に制限
  }

  void display() {
    fill(255, 0, 0);
    stroke(200, 0, 0);
    strokeWeight(3);
    beginShape();
    vertex(x, y);
    vertex(x + 25, y - 40);
    vertex(x + 50, y);
    vertex(x + 35, y + 50);
    vertex(x + 15, y + 50);
    endShape(CLOSE);
  }
}

class WaterCharacter extends Character {
  WaterCharacter(float x, float y, CharacterCountManager countManager) {
    super("Water Character", x, y, 1, countManager); // 属性1: Water
  }

  void initializeStats() {
    this.hp = 80; // 1から200の範囲に制限
    this.attackPower = 100; // 1から100の範囲に制限
    this.speed = 10; // 1から100の範囲に制限
  }

  void display() {
    fill(0, 0, 255, 150);
    stroke(0, 0, 200);
    strokeWeight(2);
    ellipse(x + 25, y + 25, 60, 60);
    ellipse(x + 25, y + 25, 40, 40);
    ellipse(x + 25, y + 25, 20, 20);
  }
}

class GrassCharacter extends Character {
  GrassCharacter(float x, float y, CharacterCountManager countManager) {
    super("Grass Character", x, y, 2, countManager); // 属性2: Grass
  }

  void initializeStats() {
    this.hp = 110; // 1から200の範囲に制限
    this.attackPower = 10; // 1から100の範囲に制限
    this.speed = 80; // 1から100の範囲に制限
  }

  void display() {
    fill(0, 255, 0);
    stroke(0, 200, 0);
    strokeWeight(3);
    beginShape();
    vertex(x + 25, y);
    vertex(x + 35, y + 25);
    vertex(x + 50, y + 15);
    vertex(x + 40, y + 35);
    vertex(x + 50, y + 50);
    vertex(x + 25, y + 40);
    vertex(x, y + 50);
    vertex(x + 10, y + 35);
    vertex(x, y + 15);
    vertex(x + 15, y + 25);
    endShape(CLOSE);
  }
}

class FireWarrior extends Character {
  FireWarrior(float x, float y, CharacterCountManager countManager) {
    super("Fire Warrior", x, y, 0, countManager); // 属性0: Fire
  }

  void initializeStats() {
    this.hp = 80; // 1から200の範囲に制限
    this.attackPower = 70; // 1から100の範囲に制限
    this.speed = 50; // 1から100の範囲に制限
  }

  void display() {
    fill(255, 69, 0);
    stroke(200, 0, 0);
    strokeWeight(3);
    rect(x, y, 50, 50);
  }
}

class WaterMage extends Character {
  WaterMage(float x, float y, CharacterCountManager countManager) {
    super("Water Mage", x, y, 1, countManager); // 属性1: Water
  }

  void initializeStats() {
    this.hp = 70; // 1から200の範囲に制限
    this.attackPower = 70; // 1から100の範囲に制限
    this.speed = 60; // 1から100の範囲に制限
  }

  void display() {
    fill(0, 191, 255, 150);
    stroke(0, 0, 200);
    strokeWeight(2);
    ellipse(x + 25, y + 25, 50, 50);
  }
}

class GrassSpider extends Character {
  GrassSpider(float x, float y, CharacterCountManager countManager) {
    super("Grass Spider", x, y, 2, countManager); // 属性2: Grass
  }

  void initializeStats() {
    this.hp = 80; // 1から200の範囲に制限
    this.attackPower = 60; // 1から100の範囲に制限
    this.speed = 60; // 1から100の範囲に制限
  }

  void display() {
    fill(34, 139, 34);
    stroke(0, 100, 0);
    strokeWeight(3);
    beginShape();
    vertex(x + 25, y);
    vertex(x + 30, y + 15);
    vertex(x + 45, y + 15);
    vertex(x + 35, y + 25);
    vertex(x + 40, y + 40);
    vertex(x + 25, y + 30);
    vertex(x + 10, y + 40);
    vertex(x + 15, y + 25);
    vertex(x + 5, y + 15);
    vertex(x + 20, y + 15);
    endShape(CLOSE);
  }
}
