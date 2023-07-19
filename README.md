# Aceve的百宝箱

这是一个为**Minecraft Java版多人游戏**编写的数据包

## 版本信息
数据包版本：15【游戏版本：1.20（23w18a）及以上】
向下兼容：10-14【游戏版本：低至1.19（22w11a）】
*低于「向下兼容」的版本未经测试，该数据包可能会无法工作*

## 功能及其命令

**需要权限等级≥2：**
1. 玩家数据追踪显示（包含下列2.3.4.功能） `/function minecraft:display_playerdata`

   禁用：`/function minecraft:remove_display_playerdata`
1. 死亡数显示（右侧计分板） `/function minecraft:display_playerdata_deaths`

   禁用：`/function minecraft:remove_display_playerdata_deaths`
1. 生命值显示（Tab栏） `/function minecraft:display_playerdata_health`

   禁用：`/function minecraft:remove_display_playerdata_health`
1. 经验显示（玩家名下方）`/function minecraft:display_playerdata_xp`

   禁用：`/function minecraft:remove_display_playerdata_xp`
1. 启用下文**无需权限等级**命令 `/function minecraft:trigger`

   禁用：`/function minecraft:remove_trigger`

**无需权限等级（需要权限等级≥0）：**
*此列命令需要先使用命令`/function minecraft:trigger`启用*
1. 模式切换：旁观 `/trigger spectator`
1. 模式切换：生存 `/trigger survival`
1. 快捷功能：自杀（双重确认） `/trigger kill`
1. 快捷功能：清除物品栏（双重确认） `/trigger clear`
1. 快捷功能：玩家坐标广播 `/trigger broadcast`

## 其他命令

1. 显示数据包信息 `/function minecraft:info`
2. ？？？ `/function minecraft:tips`
