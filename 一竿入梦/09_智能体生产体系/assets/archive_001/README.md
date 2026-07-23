# 档案001视觉素材目录

本目录只保存档案001《无声湖停口事件》的专属视觉素材。老姚、小黄、万水竿的项目级最终参考图应放入上级 `common/` 目录，不再重复存放在本目录。建议保留原始生成图，不要覆盖；筛选后的最终参考图另存为 `selected_` 开头的文件。

## 放置位置

| 素材 | 目录 | 建议文件名 |
|---|---|---|
| 老姚档案特殊状态图（如有） | `characters/laoyao/` | `laoyao_archive_001_expression.png` |
| 小黄档案特殊状态图（如有） | `characters/xiaohuang/` | `xiaohuang_archive_001_alert.png` |
| 老莽头设定图（如暂存） | `characters/laomangtou/` | `laomangtou_exploration.png` |
| 万水竿档案特殊状态图（如有） | `props/wanshuigan/` | `wanshuigan_archive_001_ripple.png` |
| 异常鳞片设定图 | `evidence/scale/` | `scale_front_back.png`、`selected_scale_evidence.png` |
| 无声湖白天基准图 | `scenes/lake/` | `lake_day_base.png` |
| 无声湖夜间钓位图 | `scenes/lake/` | `lake_night_fishing_spot.png`、`selected_lake_night_reference.png` |
| 无声湖夜间空场/水纹图 | `scenes/lake/` | `lake_night_empty_ripple.png` |
| 水下环境基准图 | `scenes/underwater/` | `underwater_base.png` |
| 水下边缘暗影图 | `scenes/underwater/` | `underwater_edge_shadow.png` |
| 水下回放截图图 | `scenes/underwater/` | `underwater_replay_frame.png` |
| 预设色卡图 | `color/` | `archive_001_palette_preview.png` |
| 最终锁定色卡图 | `color/` | `archive_001_palette_locked.png` |

## 当前建议优先放入

```text
../common/characters/laoyao/selected_laoyao_reference.png
../common/characters/xiaohuang/selected_xiaohuang_reference.png
../common/props/wanshuigan/selected_wanshuigan_reference.png
evidence/scale/selected_scale_evidence.png
scenes/lake/selected_lake_night_reference.png
scenes/underwater/underwater_base.png
scenes/underwater/underwater_edge_shadow.png
color/archive_001_palette_preview.png
```

## 文件要求

- 优先使用 PNG 或 JPG，文件名使用英文、数字和下划线。
- `selected_` 代表后续生成镜头默认调用的最终参考图。
- 同一素材有多张候选图时全部保留，但只能有一张 `selected_` 主参考图。
- 不要把视频、草稿提示词或截图说明混入图片目录；视频放到 `assets/archive_001/video/`，说明写在本文件或对应审核记录中。
- 老莽头当前只作为暂存素材，不纳入档案001实体角色参考。
- 项目通用素材统一查看：`../README.md`。
