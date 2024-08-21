Character[] characters;
ArrayList<Character> availableCharacters;
Character leftChar;
Character rightChar;
boolean isBattleOngoing = false;
boolean waitForEnter = false;
int leftCooldown = 0;
int rightCooldown = 0;
int battleTimeout = 600; // 戦闘が発生しない場合のタイムアウト
CharacterCountManager countManager = new CharacterCountManager();
PFont font;
ArrayList<String> battleLog = new ArrayList<String>(); // バトルログを保持するリスト

void setup() {
  size(960, 540);
  font = createFont("MS Gothic", 20);
  textFont(font);
  characters = new Character[15]; // キャラクターの数を設定します

  // 15個のキャラクターを個別に初期化します
  characters[0] = new KuzuCharacter(random(width / 2), random(height), countManager);
  characters[1] = new KabutoCharacter(random(width / 2), random(height), countManager);
  characters[2] = new SubutaCharacter(random(width / 2), random(height), countManager);
  characters[3] = new HappyWorldCharacter(random(width / 2), random(height), countManager);//3番目のキャラクターをみんなのキャラクターに書き換える(本当は競合が起きるからよくないけど)
  characters[4] = new WaterMage(random(width / 2), random(height), countManager);
  characters[5] = new GrassSpider(random(width / 2), random(height), countManager);
  characters[6] = new FireCharacter(random(width / 2), random(height), countManager);
  characters[7] = new WaterCharacter(random(width / 2), random(height), countManager);
  characters[8] = new GrassCharacter(random(width / 2), random(height), countManager);
  characters[9] = new FireWarrior(random(width / 2), random(height), countManager);
  characters[10] = new WaterMage(random(width / 2), random(height), countManager);
  characters[11] = new GrassSpider(random(width / 2), random(height), countManager);
  characters[12] = new FireCharacter(random(width / 2), random(height), countManager);
  characters[13] = new WaterCharacter(random(width / 2), random(height), countManager);
  characters[14] = new GrassCharacter(random(width / 2), random(height), countManager);
  
  availableCharacters = new ArrayList<Character>();
  for (Character c : characters) {
    availableCharacters.add(c);
  }
  
  selectNextBattle();
}

void draw() {
  background(255);
  
  if (isBattleOngoing) {
    // ターゲットに向かって移動
    leftChar.moveTowards(rightChar);
    rightChar.moveTowards(leftChar);
    
    // クールダウンタイム
    if (leftCooldown == 0 && dist(leftChar.x, leftChar.y, rightChar.x, rightChar.y) < 100) { // 戦闘範囲を広げる
      leftChar.useSkill(rightChar, battleLog);
      leftCooldown = calculateCooldown(leftChar.speed); // クールダウンを速度に基づいて設定
      if (rightChar.hp <= 0 && leftChar.hp <= 0) {
        battleLog.add("両者！相打ち！");
        isBattleOngoing = false;
        waitForEnter = true;
      } else if (rightChar.hp <= 0) {
        battleLog.add(rightChar.name + " が倒された！");
        isBattleOngoing = false;
        waitForEnter = true;
      }
    } else {
      leftCooldown--;
    }

    if (rightCooldown == 0 && dist(rightChar.x, rightChar.y, leftChar.x, leftChar.y) < 100) { // 戦闘範囲を広げる
      rightChar.useSkill(leftChar, battleLog);
      rightCooldown = calculateCooldown(rightChar.speed); // クールダウンを速度に基づいて設定
      if (rightChar.hp <= 0 && leftChar.hp <= 0) {
        battleLog.add("両者！相打ち！");
        isBattleOngoing = false;
        waitForEnter = true;
      } else if (leftChar.hp <= 0) {
        battleLog.add(leftChar.name + " が倒された！");
        isBattleOngoing = false;
        waitForEnter = true;
      }
    } else {
      rightCooldown--;
    }
    
    // バトルタイムアウトのチェック
    if (--battleTimeout <= 0) {
      battleLog.add("戦闘が発生しませんでした。次のバトルを開始します。");
      isBattleOngoing = false;
      waitForEnter = true;
    }
  }

  if (leftChar != null) leftChar.display();
  if (rightChar != null) rightChar.display();
  
  displayHealthBar(leftChar, 10, 10);
  displayHealthBar(rightChar, width - 110, 10);
  
  displayBattleLog(); // バトルログを表示
}

int calculateCooldown(float speed) {
  return int(map(speed, 1, 100, 180, 12)); // 速度1で180フレーム（3秒）、速度100で12フレーム（0.2秒）
}

void displayHealthBar(Character character, float x, float y) {
  float barWidth = 100;
  float barHeight = 10;
  float healthRatio = character.hp / 200.0; // HPの最大値を200に設定
  
  if (character.attribute == 0) {
    fill(255, 0, 0); // Fire
  } else if (character.attribute == 1) {
    fill(0, 0, 255); // Water
  } else {
    fill(0, 255, 0); // Grass
  }
  
  rect(x, y, barWidth * healthRatio, barHeight);
  noFill();
  stroke(0);
  rect(x, y, barWidth, barHeight);
  
  fill(0);
  textSize(12);
  text(character.name, x, y + 20);
  text("HP: " + character.hp, x, y + 35);
  text("攻撃力: " + character.attackPower, x, y + 50);
  text("速度: " + character.speed, x, y + 65);
  text("幸運値: " + character.luck, x, y + 80);
  text("クリティカル率: " + nf(character.criticalChance * 100, 0, 1) + "%", x, y + 95);
  text("回避率: " + nf(character.dodgeChance * 100, 0, 1) + "%", x, y + 110);
}

void selectNextBattle() {
  if (availableCharacters.size() < 2) {
    battleLog.add("バトルに利用可能なキャラクターがいません。");
    println("バトルに利用可能なキャラクターがいません。");
    return;
  }
  
  int leftIndex = int(random(availableCharacters.size()));
  leftChar = availableCharacters.remove(leftIndex);
  int rightIndex = int(random(availableCharacters.size()));
  rightChar = availableCharacters.remove(rightIndex);
  
  leftChar.x = width / 4;
  leftChar.y = height / 2;
  rightChar.x = 3 * width / 4;
  rightChar.y = height / 2;
  
  battleLog.add("新しいバトル: " + leftChar.name + " vs " + rightChar.name);
  println("新しいバトル: " + leftChar.name + " vs " + rightChar.name);
  isBattleOngoing = true;
  waitForEnter = false;
  leftCooldown = calculateCooldown(leftChar.speed); // 最初のクールダウンを設定
  rightCooldown = calculateCooldown(rightChar.speed); // 最初のクールダウンを設定
  battleTimeout = 600; // バトルタイムアウトをリセット
}

void displayBattleLog() {
  float logHeight = 150;
  fill(0);
  rect(0, height - logHeight, width, logHeight);
  noFill();
  stroke(255);
  rect(0, height - logHeight, width, logHeight);
  fill(255);
  textSize(16);
  int linesToShow = min(battleLog.size(), 8);
  for (int i = 0; i < linesToShow; i++) {
    text(battleLog.get(battleLog.size() - linesToShow + i), 10, height - logHeight + 20 + i * 18);
  }
}

void keyPressed() {
  if (waitForEnter && key == ENTER) {
    selectNextBattle();
  }
}
