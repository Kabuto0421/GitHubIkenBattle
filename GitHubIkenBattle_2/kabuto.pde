// 新しいキャラクタークラスの雛形を作成するためのサンプルコード
// このクラスを使って、キャラクターのステータスを設定し、描画する方法を示しています。星マークがついていないところはコピペのままで大丈夫です。


//決めてもらうもの　＜クラス名＞、＜属性＞、＜ステータス＞、＜見た目＞
//クラス名は好きな名前をつけてあげてください。
class KabutoCharacter extends Character {
  // (コンストラクタ：キャラクターの初期化を行う)
  KabutoCharacter(float x, float y, CharacterCountManager countManager) {
    // (スーパークラス（Character）のコンストラクタを呼び出す。)
    //キャラクター名、位置、属性を設定する
    
    /*☆ここは設定してください。⭐☆*/
    super("Kabuto Character", x, y, 2, countManager); // 属性0はFire(炎), 属性1はWater(水), 属性2はGrass(草)
    /*☆                   ⭐☆*/
  }

  // キャラクターのステータスを初期化するメソッド
  void initializeStats() {
    /*☆ここは設定してください。⭐☆*/
    //全部で合計200までしか値は振れません。
    this.hp = 198;           // HPを100に設定 (HPは1〜200まで)
    this.attackPower =1;   // 攻撃力を50に設定 (攻撃力は1〜100まで)
    this.speed = 1;         // 速度を50に設定 (速度は1〜100まで)
    /*                    ⭐☆*/
    
    //どれか一つでも満たさない要素があるとエラーを吐きます。
  }

  // キャラクターの表示メソッド：キャラクターを画面に描画する。
  /* ここのキャラクターを表示するプログラムは好きな描画プログラムを使って構いません。しかし, x,yを用いて描画してください。*/
  void display() {
   fill(0);
   float baseX = x;
   float baseY = y ;

rect(baseX + (192 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (186 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (180 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (174 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (168 - 134), baseY + (225 - 120), 10, 10);
rect(baseX + (162 - 134), baseY + (225 - 120), 10, 10);
rect(baseX + (154 - 134), baseY + (220 - 120), 10, 10);
rect(baseX + (146 - 134), baseY + (220 - 120), 10, 10);
rect(baseX + (139 - 134), baseY + (210 - 120), 10, 10);
rect(baseX, baseY + (200 - 120), 10, 10);
rect(baseX, baseY + (190 - 120), 10, 10);
rect(baseX, baseY + (180 - 120), 10, 10);
rect(baseX, baseY + (170 - 120), 10, 10);
rect(baseX + (138 - 134), baseY + (160 - 120), 10, 10);
rect(baseX + (142 - 134), baseY + (150 - 120), 10, 10);
rect(baseX + (148 - 134), baseY + (140 - 120), 10, 10);
rect(baseX + (152 - 134), baseY + (130 - 120), 10, 10);
rect(baseX + (160 - 134), baseY, 10, 10); // 左の耳
rect(baseX + (168 - 134), baseY + (130 - 120), 10, 10);
rect(baseX + (172 - 134), baseY + (140 - 120), 10, 10);
rect(baseX + (182 - 134), baseY + (145 - 120), 10, 10);
rect(baseX + (192 - 134), baseY + (145 - 120), 10, 10);
rect(baseX + (202 - 134), baseY + (145 - 120), 10, 10);
rect(baseX + (212 - 134), baseY + (145 - 120), 10, 10);
rect(baseX + (222 - 134), baseY + (140 - 120), 10, 10);
rect(baseX + (226 - 134), baseY + (130 - 120), 10, 10);
rect(baseX + (234 - 134), baseY, 10, 10); // 右の耳
rect(baseX + (242 - 134), baseY + (130 - 120), 10, 10);
rect(baseX + (246 - 134), baseY + (140 - 120), 10, 10);
rect(baseX + (252 - 134), baseY + (150 - 120), 10, 10);
rect(baseX + (256 - 134), baseY + (160 - 120), 10, 10);
rect(baseX + (260 - 134), baseY + (170 - 120), 10, 10);
rect(baseX + (260 - 134), baseY + (180 - 120), 10, 10);
rect(baseX + (260 - 134), baseY + (190 - 120), 10, 10);
rect(baseX + (260 - 134), baseY + (200 - 120), 10, 10);
rect(baseX + (255 - 134), baseY + (210 - 120), 10, 10);
rect(baseX + (248 - 134), baseY + (220 - 120), 10, 10);
rect(baseX + (240 - 134), baseY + (220 - 120), 10, 10);
rect(baseX + (234 - 134), baseY + (225 - 120), 10, 10);
rect(baseX + (228 - 134), baseY + (225 - 120), 10, 10);
rect(baseX + (222 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (216 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (210 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (204 - 134), baseY + (230 - 120), 10, 10);
rect(baseX + (198 - 134), baseY + (230 - 120), 10, 10);

  }
}
