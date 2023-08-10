#---------- trigger实现 ----------#

## [trigger权限开放]
scoreboard players enable @a free_camera
scoreboard players enable @a kill
scoreboard players enable @a clear
scoreboard players enable @a broadcast

## [快捷功能：灵魂出窍]
# 用标记记录原坐标
execute at @p[scores={free_camera=1}] run summon minecraft:marker ~ ~ ~
scoreboard players add @p[scores={free_camera=1}] free_camera 1
# 切换旁观模式、信息提示
gamemode spectator @p[scores={free_camera=2}]
tellraw @p[scores={free_camera=2}] {"text":"<ATB> Tips：再次使用此触发器以切回","color":"green"}
scoreboard players add @p[scores={free_camera=2}] free_camera 1
# 返回原位、切换生存模式、删除标记
execute as @e[type=minecraft:marker,limit=1,sort=nearest] run tp @p[scores={free_camera=4}] @s
gamemode survival @a[scores={free_camera=4}]
execute if score @p[scores={free_camera=4}] free_camera = 4 free_camera run kill @e[type=minecraft:marker,limit=1,sort=nearest]
# 重置计数
scoreboard players set @a[scores={free_camera=4}] free_camera 0

## [快捷功能：位置广播]
# 坐标记录
execute if score @p[scores={broadcast=1}] broadcast = 1 broadcast store result score x player_pos run data get entity @p[scores={broadcast=1}] Pos[0]
execute if score @p[scores={broadcast=1}] broadcast = 1 broadcast store result score y player_pos run data get entity @p[scores={broadcast=1}] Pos[1]
execute if score @p[scores={broadcast=1}] broadcast = 1 broadcast store result score z player_pos run data get entity @p[scores={broadcast=1}] Pos[2]
# 信息提示
execute if score @p[scores={broadcast=1}] broadcast = 1 broadcast run tellraw @a [{"translate":"<ATB> 玩家%s广播了自己的位置：","with":[{"selector":"@p[scores={broadcast=1}]","color":"yellow"}],"color":"green"},{"text":"x=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"x"}}]},{"text":" y=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"y"}}]},{"text":" z=","color":"yellow","extra":[{"score":{"objective":"player_pos","name":"z"}}]}]
# 重置计数
scoreboard players set @a[scores={broadcast=1}] broadcast 0

## [快捷功能：自杀]
# 危险功能的提示与重置
tellraw @a[scores={kill=1}] {"text":"！注意：你正在使用危险功能，请再次使用触发器以确认！","color":"red"}
tellraw @a[scores={kill=1}] {"translate":"※误触？没事，%s ^-^","with":[{"text":"点此以重置该提示","underlined":"true","bold":"true","clickEvent":{"action":"run_command","value":"/trigger kill set -1"},"color":"yellow"}],"color":"yellow"}
scoreboard players set @a[scores={kill=1}] kill 2
# 重置提示反馈
tellraw @a[scores={kill=-1}] {"text":"※你已重制该功能的提示","color":"green"}
scoreboard players set @a[scores={kill=-1}] kill 0
# 功能实现
kill @a[scores={kill=3..}]
scoreboard players set @a[scores={kill=3..}] kill 0

## [快捷功能：清除物品栏]
# 危险功能的提示与重置
tellraw @a[scores={clear=1}] {"text":"！注意：你正在使用危险功能，请再次使用触发器以确认！","color":"red"}
tellraw @a[scores={clear=1}] {"translate":"※误触？没事，%s ^-^","with":[{"text":"点此以重置该提示","underlined":"true","bold":"true","clickEvent":{"action":"run_command","value":"/trigger clear set -1"},"color":"yellow"}],"color":"yellow"}
scoreboard players set @a[scores={clear=1}] clear 2
# 重置提示反馈
tellraw @a[scores={clear=-1}] {"text":"※你已重制该功能的提示","color":"green"}
scoreboard players set @a[scores={clear=-1}] clear 0
# 功能实现
clear @a[scores={clear=3..}]
scoreboard players set @a[scores={clear=3..}] clear 0