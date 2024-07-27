# Silicloudy的百宝箱

这是一个为**Minecraft Java版多人游戏**编写的数据包。

主要添加了多人游戏相关数据显示，同时为解决多人游戏权限问题，添加了任何人都可使用的部分命令。

## 版本信息
数据包版本：48【游戏版本：1.21（24w21a及以上）】
*数据包在低于24w21a的版本无法工作*

## 功能及其命令

**需要权限等级≥2：（单人游戏管理员/作弊模式）**

1. 玩家数据追踪显示【包含：玩家死亡数显示（右侧计分板）；玩家生命值显示（Tab栏）；玩家经验等级显示（玩家名下方）】

    `/function minecraft:dis_playerdata`
    
    禁用：`/function minecraft:redis_playerdata`

1. 启用下文**无需权限等级**命令 `/function minecraft:trigger`

    禁用：`/function minecraft:remove_trigger`

**无需权限等级（需要权限等级≥0）：**

*此列命令需要先使用`/function minecraft:trigger`启用*

1. 快捷功能：灵魂出窍（多人游戏可能有bug）`/trigger free_camera`
1. 快捷功能：玩家坐标广播 `/trigger broadcast`
1. 快捷功能：自杀（二次确认） `/trigger kill`
1. 快捷功能：清除物品栏（二次确认） `/trigger clear`

## 其他命令

显示数据包信息 `/function minecraft:info`
