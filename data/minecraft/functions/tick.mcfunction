#---------- trigger实现 ----------#

# 对所有玩家开放trigger权限
scoreboard players enable @a spectator
scoreboard players enable @a survival
scoreboard players enable @a kill
scoreboard players enable @a clear
scoreboard players enable @a broadcast

## [模式切换：旁观]
gamemode spectator @a[scores={spectator=1..}]
scoreboard players set @a[scores={spectator=1..}] spectator 0

## [模式切换：旁观]
gamemode survival @a[scores={survival=1..}]
scoreboard players set @a[scores={survival=1..}] survival 0

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

## [快捷功能：位置广播]
# 坐标记录
execute if score @p[scores={broadcast=1..}] broadcast = 1 broadcast store result score x player_pos run data get entity @p[scores={broadcast=1..}] Pos[0]
execute if score @p[scores={broadcast=1..}] broadcast = 1 broadcast store result score y player_pos run data get entity @p[scores={broadcast=1..}] Pos[1]
execute if score @p[scores={broadcast=1..}] broadcast = 1 broadcast store result score z player_pos run data get entity @p[scores={broadcast=1..}] Pos[2]
# 信息提示
execute if score @p[scores={broadcast=1..}] broadcast = 1 broadcast run tellraw @a [{"text":"玩家位置广播：x=","extra":[{"score":{"objective":"player_pos","name":"x"}}],"color":"green"},{"text":" y=","extra":[{"score":{"objective":"player_pos","name":"y"}}]},{"text":" z=","extra":[{"score":{"objective":"player_pos","name":"z"}}]}]
# 重置计数
scoreboard players set @a[scores={broadcast=1..}] broadcast 0