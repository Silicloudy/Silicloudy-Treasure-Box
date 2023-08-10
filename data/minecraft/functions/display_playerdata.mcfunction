# 启用数据展示（死亡数、生命值、经验等级）
scoreboard objectives add Deaths deathCount {"text":"死亡数 ∥ Deaths","color":"red"}
scoreboard objectives add Health health {"text":"生命值 ∥ Health","color":"green"}
scoreboard objectives add Level level {"text":"level","color":"yellow","bold":true}

# 设置数据展示位置
scoreboard objectives setdisplay sidebar Deaths
scoreboard objectives setdisplay list Health
scoreboard objectives setdisplay belowName Level