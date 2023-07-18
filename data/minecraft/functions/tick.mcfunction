#---------- trigger实现 ----------#

# 对所有玩家开放trigger权限
scoreboard players enable @a spectator
scoreboard players enable @a survival
scoreboard players enable @a kill

## [模式切换：旁观]
gamemode spectator @a[scores={spectator=1..}]
scoreboard players set @a[scores={spectator=1..}] spectator 0

## [模式切换：旁观]
gamemode survival @a[scores={survival=1..}]
scoreboard players set @a[scores={survival=1..}] survival 0

## [快捷功能：自杀]
# 危险功能的提示与重置
tellraw @a[scores={kill=2}] {"text":"！注意：你正在使用危险功能，请再次使用触发器以确认！","color":"red"}
tellraw @a[scores={kill=2}] {"translate":"※误触？没事，%s ^-^","with":[{"text":"点此以重置该提示","underlined":"true","bold":"true","clickEvent":{"action":"run_command","value":"/trigger kill set 0"},"color":"yellow"}],"color":"yellow"}
scoreboard players set @a[scores={kill=2}] kill 3
# 重置提示反馈
tellraw @a[scores={kill=0}] {"text":"※你已重制该功能的提示","color":"green"}
scoreboard players set @a[scores={kill=0}] kill 1
# 功能实现
kill @a[scores={kill=4..}]
scoreboard players set @a[scores={kill=4..}] kill 1