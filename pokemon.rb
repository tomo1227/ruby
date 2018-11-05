
class Pokemon
  attr_accessor :hp, :attack, :name
  def initialize(hp = 0, attack = 0, name = "未定義")
    @hp = hp; @attack = attack; @name = name
  end
end

class Battle 
  def initialize(poke1  = "未定義" , poke2 = "未定義")
    @count = 0; @poke1 = poke1; @poke2 = poke2
  end
  def disp(n1,n2,h1,h2)
      @count += 1
      p "-----"
      p "第#{@count}戦"
      p "-----"
      p "#{n1}の残りHP: #{h1}"
      p "#{n2}の残りHP: #{h2}"
      sleep 1
  end
  def gameStart
    name1 = @poke1.name
    name2 = @poke2.name
    attack1 = @poke1.attack
    attack2 = @poke2.attack
    hp1 = @poke1.hp
    hp2 = @poke2.hp
    
    p "*********************************"
    p "戦闘開始"
    p "*********************************"

    loop {    
      if hp1 > hp2
        hp2 = hp2 - attack1
        self.disp(name1, name2,hp1, hp2)
        break if hp1 < 0 || hp2 < 0
      else
        hp1 = hp1 - attack2
        self.disp(name1, name2,hp1, hp2)
        break if hp1 < 0 || hp2 < 0
      end
    }
    sleep 1
    p "*********************************"
    p "決勝！！！"
    p "*********************************"
    if hp2 > 0
      p "#{name1}瀕死、、#{name2}の勝利！！"
    else 
      p "#(name2)瀕死、、#{name1}の勝利！！"
      end
  end
end
pikachu = Pokemon.new(30, 5, "ピカチュウ") 
squirtle = Pokemon.new(50, 8, "ゼニガメ")
battle = Battle.new(pikachu.clone, squirtle.clone)
battle.gameStart