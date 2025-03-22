# 启用trigger
scoreboard objectives add free_camera trigger {"text":"快捷功能：灵魂出窍","color":"aqua","italic":true}
scoreboard players set 4 free_camera 4

scoreboard objectives add player_pos dummy {"text":"临时计分板：玩家位置","color":"gray","italic":true}
scoreboard objectives add number dummy {"text":"临时计分板：数字常量","color":"gray","italic":true}
scoreboard players set 1 number 1
scoreboard players set 2 number 2
scoreboard players set 3 number 3
scoreboard players set 4 number 4

scoreboard objectives add pos_query trigger {"text":"快捷功能：坐标查询","color":"aqua","italic":true}
scoreboard objectives add broadcast trigger {"text":"快捷功能：位置广播","color":"gold","italic":true}

scoreboard objectives add kill trigger {"text":"快捷功能：自杀","color":"red","italic":true}
scoreboard objectives add clear trigger {"text":"快捷功能：清除物品栏","color":"red","italic":true}