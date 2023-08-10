# 启用trigger
scoreboard objectives add free_camera trigger {"text":"快捷功能：灵魂出窍","color":"green","italic":true}
scoreboard players set 4 free_camera 4
scoreboard objectives add player_pos dummy {"text":"临时计分板：玩家位置","color":"gray","italic":true}
scoreboard objectives add broadcast trigger {"text":"快捷功能：位置广播","color":"green","italic":true}
scoreboard players set 1 broadcast 1
scoreboard objectives add kill trigger {"text":"快捷功能：自杀","color":"red","italic":true}
scoreboard objectives add clear trigger {"text":"快捷功能：清除物品栏","color":"red","italic":true}