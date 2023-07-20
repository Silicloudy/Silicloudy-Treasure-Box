# 启用trigger
scoreboard objectives add spectator trigger {"text":"模式切换：旁观","color":"white","italic":true}
scoreboard objectives add survival trigger {"text":"模式切换：生存","color":"white","italic":true}
scoreboard objectives add kill trigger {"text":"快捷功能：自杀","color":"white","italic":true}
scoreboard objectives add clear trigger {"text":"快捷功能：清除物品栏","color":"white","italic":true}
scoreboard objectives add player_pos dummy {"text":"临时计分板：玩家位置","color":"gray","italic":true}
scoreboard objectives add broadcast trigger {"text":"快捷功能：位置广播","color":"white","italic":true}
scoreboard players set 1 broadcast 1
