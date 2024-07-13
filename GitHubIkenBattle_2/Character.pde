import java.util.HashMap;
import java.util.ArrayList;

// キャラクターのそれぞれの
class CharacterCountManager {
  private HashMap<String, Integer> countMap = new HashMap<String, Integer>();

  // 次のキャラクターインスタンスのカウントを取得するメソッド
  public int getNextCount(String namePrefix) {
    int count = countMap.getOrDefault(namePrefix, 0) + 1;
    countMap.put(namePrefix, count);
    return count;
  }
}

// キャラクターの基本クラス
abstract class Character {
  String name;           // キャラクターの名前
  int hp;                // キャラクターのHP（1から200の範囲に制限）
  int attackPower;       // キャラクターの攻撃力（1から100の範囲に制限）
  float speed;           // キャラクターの速度（1から100の範囲に制限）
  float luck;            // 幸運値（隠しパラメータ）
  float dodgeChance;     // 回避率
  float criticalChance;  // クリティカルヒット率
  float x, y;            // キャラクターの位置
  int attribute;         // キャラクターの属性: 0=Fire, 1=Water, 2=Grass

  // コンストラクタ
  Character(String namePrefix, float x, float y, int attribute, CharacterCountManager countManager) {
    this.name = namePrefix + " " + countManager.getNextCount(namePrefix);
    this.x = x;
    this.y = y;
    this.attribute = attribute;
    initializeStats();    // ステータスの初期化
    validateStats();      // ステータスのバリデーション
    finalizeStats();      // ステータスの最終計算
  }

  // 各キャラクタークラスで実装するステータスの初期化メソッド
  abstract void initializeStats();

  // ステータスの最終計算メソッド
  void finalizeStats() {
    this.luck = calculateLuck(hp, attackPower, speed);
    this.dodgeChance = calculateDodgeChance();
    this.criticalChance = calculateCriticalChance();
  }

  // ステータスのバリデーションメソッド
  void validateStats() {
    if (hp < 1 || hp > 200) {
      throw new IllegalArgumentException(name + "のHPが範囲外です: " + hp);
    }
    if (attackPower < 1 || attackPower > 100) {
      throw new IllegalArgumentException(name + "の攻撃力が範囲外です: " + attackPower);
    }
    if (speed < 1 || speed > 100) {
      throw new IllegalArgumentException(name + "の速度が範囲外です: " + speed);
    }
    int totalPoints = hp + attackPower + (int) speed;
    if (totalPoints > 200) {
      throw new IllegalArgumentException(name + "のパラメータの合計が200を超えています: " + totalPoints);
    }
  }

  // 幸運値をHP、攻撃力、速度から計算するメソッド
  float calculateLuck(int hp, int attackPower, float speed) {
    return (hp + speed) / attackPower;
  }

  // 回避率を計算するメソッド
  float calculateDodgeChance() {
    return min(0.3, luck * 0.005); // 最大回避率30%
  }

  // クリティカルヒット率を計算するメソッド
  float calculateCriticalChance() {
    return min(0.2, luck * 0.0025); // 最大クリティカル率20%
  }

  // 攻撃メソッド
  boolean attack(Character target, ArrayList<String> battleLog) {
    if (random(1) < target.dodgeChance) {
      battleLog.add(target.name + " は攻撃を回避した！！");
      return false;
    }
    int damage = calculateDamage(target, battleLog);
    target.takeDamage(damage);
    battleLog.add(name + " が " + target.name + " に " + damage + " ダメージを与えた！");
    return true;
  }

  // ダメージ計算メソッド
  int calculateDamage(Character target, ArrayList<String> battleLog) {
    int damage = attackPower;
    if (random(1) < criticalChance) {
      damage *= 2; // クリティカルヒット
      battleLog.add("クリティカルヒット！ " + name + " が " + target.name + " に " + damage + " ダメージを与えた！");
    }
    if (attribute == 0 && target.attribute == 1) { // Fire vs Water
      damage *= 0.5;
    } else if (attribute == 0 && target.attribute == 2) { // Fire vs Grass
      damage *= 2.0;
    } else if (attribute == 1 && target.attribute == 0) { // Water vs Fire
      damage *= 2.0;
    } else if (attribute == 1 && target.attribute == 2) { // Water vs Grass
      damage *= 0.5;
    } else if (attribute == 2 && target.attribute == 0) { // Grass vs Fire
      damage *= 0.5;
    } else if (attribute == 2 && target.attribute == 1) { // Grass vs Water
      damage *= 2.0;
    }
    return damage;
  }

  // ダメージを受けるメソッド
  void takeDamage(int damage) {
    hp -= damage;
    if (hp < 0) {
      hp = 0;
    }
  }

  // ステータスを表示するメソッド
  void displayStatus() {
    println(name + " - HP: " + hp + ", Attack Power: " + attackPower);
  }

  // 各キャラクタークラスで実装する描画メソッド
  abstract void display();

  // ターゲットに向かって移動するメソッド
  void moveTowards(Character target) {
    float dx = target.x - x;
    float dy = target.y - y;
    float distance = dist(x, y, target.x, target.y);
    if (distance > speed) {
      x += speed * dx / distance;
      y += speed * dy / distance;
    }
  }
  
  // スキルを使用するメソッド
  void useSkill(Character target, ArrayList<String> battleLog) {
    attack(target, battleLog);
  }
}
