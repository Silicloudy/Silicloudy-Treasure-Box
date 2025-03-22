#---------- trigger实现 ----------#

## [trigger权限开放]
function minecraft:open_trigger {objective:free_camera}
function minecraft:open_trigger {objective:kill}
function minecraft:open_trigger {objective:clear}
function minecraft:open_trigger {objective:pos_query}
function minecraft:open_trigger {objective:broadcast}

## [快捷功能：灵魂出窍]
# 用标记记录原坐标
execute at @p[scores={free_camera=1}] run summon minecraft:marker ~ ~ ~
scoreboard players add @p[scores={free_camera=1}] free_camera 1
# 切换旁观模式、信息提示
gamemode spectator @p[scores={free_camera=2}]
tellraw @p[scores={free_camera=2}] {"text":"<SCTB> Tips：再次使用此触发器以切回","color":"green"}
scoreboard players add @p[scores={free_camera=2}] free_camera 1
# 返回原位、切换生存模式、删除标记
execute as @e[type=minecraft:marker,limit=1,sort=nearest] run tp @p[scores={free_camera=4}] @s
gamemode survival @a[scores={free_camera=4}]
execute if score @p[scores={free_camera=4}] free_camera = 4 free_camera run kill @e[type=minecraft:marker,limit=1,sort=nearest]
# 重置计数
scoreboard players set @a[scores={free_camera=4}] free_camera 0

## [快捷功能：坐标查询]
# 坐标记录
execute if score @p[scores={pos_query=1}] pos_query = 1 number store result score x player_pos run data get entity @p[scores={pos_query=1}] Pos[0]
execute if score @p[scores={pos_query=1}] pos_query = 1 number store result score y player_pos run data get entity @p[scores={pos_query=1}] Pos[1]
execute if score @p[scores={pos_query=1}] pos_query = 1 number store result score z player_pos run data get entity @p[scores={pos_query=1}] Pos[2]
# 信息提示
execute if score @p[scores={pos_query=1}] pos_query = 1 number run tellraw @p[scores={pos_query=1}] [{"translate":"<SCTB> 当前玩家%s位置：","with":[{"selector":"@p[scores={pos_query=1}]","color":"yellow"}],"color":"aqua"},{"text":"x=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"x"}}]},{"text":" y=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"y"}}]},{"text":" z=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"z"}}]}]
# 重置计数
scoreboard players set @a[scores={pos_query=1}] pos_query 0

## [快捷功能：位置广播]
# 坐标记录
execute if score @p[scores={broadcast=1}] broadcast = 1 number store result score x player_pos run data get entity @p[scores={broadcast=1}] Pos[0]
execute if score @p[scores={broadcast=1}] broadcast = 1 number store result score y player_pos run data get entity @p[scores={broadcast=1}] Pos[1]
execute if score @p[scores={broadcast=1}] broadcast = 1 number store result score z player_pos run data get entity @p[scores={broadcast=1}] Pos[2]
# 信息提示
execute if score @p[scores={broadcast=1}] broadcast = 1 number run tellraw @a [{"translate":"<SCTB> 玩家%s广播了自己的位置：","with":[{"selector":"@p[scores={broadcast=1}]","color":"yellow"}],"color":"gold"},{"text":"x=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"x"}}]},{"text":" y=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"y"}}]},{"text":" z=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"z"}}]}]
# 重置计数
scoreboard players set @a[scores={broadcast=1}] broadcast 0

## [快捷功能：自杀]
# 危险功能的提示与重置
tellraw @a[scores={kill=1}] {"text":"！注意：此项为危险功能，请再次使用触发器以二次确认。","color":"red"}
tellraw @a[scores={kill=1}] {"translate":"※误触请%s","with":[{"text":"点此","underlined":true,"bold":true,"clickEvent":{"action":"run_command","value":"/trigger kill set -1"},"hoverEvent":{"action":"show_text","value":{"text":"重置[快捷功能：自杀]二次确认"}},"color":"yellow"}],"color":"yellow"}
scoreboard players set @a[scores={kill=1}] kill 2
# 重置提示反馈
tellraw @a[scores={kill=-1}] {"text":"※你已重制该功能的二次确认。","color":"green"}
scoreboard players set @a[scores={kill=-1}] kill 0
# 功能实现
kill @a[scores={kill=3..}]
scoreboard players set @a[scores={kill=3..}] kill 0

## [快捷功能：清除物品栏]
# 危险功能的提示与重置
tellraw @a[scores={clear=1}] {"text":"！注意：此项为危险功能，请再次使用触发器以二次确认。","color":"red"}
tellraw @a[scores={clear=1}] {"translate":"※误触请%s","with":[{"text":"点此","underlined":true,"bold":true,"clickEvent":{"action":"run_command","value":"/trigger clear set -1"},"color":"yellow"}],"hoverEvent":{"action":"show_text","value":{"text":"重置[快捷功能：清除物品栏]二次确认"}},"color":"yellow"}
scoreboard players set @a[scores={clear=1}] clear 2
# 重置提示反馈
tellraw @a[scores={clear=-1}] {"text":"※你已重制该功能的二次确认。","color":"green"}
scoreboard players set @a[scores={clear=-1}] clear 0
# 功能实现
clear @a[scores={clear=3..}]
scoreboard players set @a[scores={clear=3..}] clear 0