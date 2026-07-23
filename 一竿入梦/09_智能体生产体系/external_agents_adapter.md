# 外部 AI 短片 Agent 接入适配层

接入日期：2026-07-15  
外部项目路径：`/Users/yao/Projects/Codex/AI短片`  
适用项目：《一竿入梦》V2.1

## 1. 接入结论

可以接入。

外部 `AI短片` 项目提供的是短剧生产、观众心理、分镜提示词、Seedance 2.0、视觉一致性、剪辑节奏和发布包装能力；《一竿入梦》提供的是世界观、人物、档案结构、钓鱼专业边界和伪纪录片规则。

接入方式采用：

```text
能力复用
  -> 项目适配
  -> 世界观隔离
  -> 档案001试跑
  -> 固化流程
```

禁止把外部短片项目的人物、世界观、题材风格、豫剧/战争/其他项目设定直接带入《一竿入梦》。

## 2. 可接入能力清单

| 外部能力 | 外部位置 | 接入到本项目 | 接入等级 |
|---|---|---|---|
| AI短片总控编排 | `skills/ai-short-orchestrator/SKILL.md` | `agents/showrunner_orchestrator.md` | 可直接参考 |
| 钓鱼短剧包 | `skills/ai-fishing-short-drama/SKILL.md` | `short_video_strategy_agent` + `seedance_director_agent` | 高度可用，需V2改写 |
| Seedance 2.0 | `skills/seedance-20/SKILL.md` 或 `seedance-2.0/SKILL.md` | `seedance_director_agent` + `templates/seedance_prompt_template.md` | 高度可用 |
| 观众留存心理 | `skills/audience-retention-psychology/SKILL.md` | `short_video_strategy_agent` | 可直接参考 |
| 微短剧剧本 | `skills/screenplay-master/SKILL.md` | `novel_agent` 的短剧化输出 | 部分可用 |
| 分镜提示词 | `skills/visual-storyboard-prompter/SKILL.md` | `seedance_director_agent` | 可直接参考 |
| 视觉一致性 | `skills/visual-consistency-keeper/SKILL.md` | 角色/水域/装备一致性检查 | 可直接参考 |
| 剪辑节奏 | `skills/short-video-editing-rhythm/SKILL.md` | 后续新增剪辑节奏包 | 可直接参考 |
| 发布包装 | `skills/publishing-psychology-packager/SKILL.md` | 标题、封面、评论、话题、A/B版本 | 可直接参考 |

## 3. 钓鱼短剧 Skill 的 V2.0 改写规则

外部 `ai-fishing-short-drama` 原始方向偏：

```text
夜钓入梦 + 系统绑定 + 怪鱼关卡 + 万水竿 + 河南轻喜剧
```

《一竿入梦》V2.0 改写为：

```text
民间摄制组调查异常鱼情 + 万水竿有限反应 + 证据链 + 伪纪录片无限流
```

映射规则：

| 外部概念 | 本项目 V2.0 映射 |
|---|---|
| 第XXX关 | 档案XXX |
| 关卡名称 | 异常水域事件名 |
| 系统提示 | 万水竿反应 / 老莽头半截提醒 |
| 进入关卡 | 进入调查水域 / 接到异常线索 |
| 目标鱼 | 目标鱼 / 未知鱼情 / 异常证据对象 |
| 通关结果 | 获得证据 / 局部破局 / 放流 / 封存异常 |
| 下一关钩子 | 下一档案证据 |
| 系统字幕 | 摄像机回放 / 收音异常 / 档案字幕 |

禁止保留：

- 可见系统面板。
- 任务奖励。
- 经验值。
- 商城。
- 战斗力。
- 固定“睡着穿越”。
- 系统直接给答案。

## 4. 标准接入流程

当用户要求制作《一竿入梦》某一档案的短视频、Seedance 分镜、发布包装或完整生产包时，按以下顺序：

```text
1. 读取本项目母文件
   - docs/00_world_bible.md
   - docs/01_character_bible.md
   - docs/02_archive_catalog.md
   - docs/03_fish_species_rules.md
   - docs/04_compliance_rules.md

2. 判断任务类型
   - 档案故事
   - 60秒短视频
   - Seedance分镜
   - 视觉一致性
   - 剪辑节奏
   - 发布包装
   - 质量审核

3. 读取对应外部能力
   - 留存：audience-retention-psychology
   - 钓鱼短剧：ai-fishing-short-drama
   - 分镜：visual-storyboard-prompter
   - Seedance：seedance-20
   - 一致性：visual-consistency-keeper
   - 剪辑：short-video-editing-rhythm
   - 发布：publishing-psychology-packager

4. 执行 V2.0 改写
   - 系统关卡 -> 档案调查
   - 系统提示 -> 万水竿/老莽头有限提示
   - 爽点捕获 -> 证据回报 + 专业修正
   - 怪物露出 -> 克制异常证据

5. 输出到本项目 outputs/
```

## 5. 推荐输出路径

| 输出类型 | 本项目路径 |
|---|---|
| 档案故事 | `outputs/stories/` |
| 短视频脚本 | `outputs/scripts/` |
| Seedance分镜 | `outputs/storyboards/` |
| 生成提示词 | `outputs/prompts/` |
| 审核报告 | `outputs/reviews/` |
| 留存报告 | `outputs/retention/` |
| 剪辑节奏 | `outputs/editing/` |
| 发布包装 | `outputs/publishing/` |
| 视觉一致性 | `outputs/consistency/` |

当前项目尚未创建 `retention/`、`editing/`、`publishing/`、`consistency/`，需要首次使用时创建。

## 6. 档案001试跑建议

优先用档案001《无声湖停口事件》测试接入。

建议执行顺序：

```text
showrunner_orchestrator
  -> novel_agent：确认档案故事
  -> audience-retention-psychology：诊断3秒/15秒/30秒/结尾
  -> ai-fishing-short-drama：转成钓鱼短剧包，但执行V2.0映射
  -> visual-storyboard-prompter：生成逐镜头提示词
  -> seedance-20：压缩为Seedance 2.0可执行提示词
  -> visual-consistency-keeper：检查老姚/小黄/万水竿/无声湖一致性
  -> short-video-editing-rhythm：生成剪辑节奏
  -> publishing-psychology-packager：生成标题封面发布包
  -> quality_review_agent：最终审核
```

## 7. 冲突处理

如果外部短片规则与《一竿入梦》V2.0 冲突，按以下优先级处理：

1. 合规与生态保护。
2. 钓鱼专业事实和物理逻辑。
3. 《一竿入梦》世界观母文件。
4. 档案故事因果与人物动机。
5. 短视频留存与传播效率。
6. 商业植入。
7. 视觉奇观与特效。

外部规则里凡是要求“强系统感”“系统字幕”“关卡奖励”“强怪兽露出”的内容，必须先改写为《一竿入梦》的伪纪录片证据链。

## 8. 是否需要移动项目

不必须移动。

当前可以直接通过路径读取外部 `AI短片` 项目的 skill 和 agent 文档，作为能力库接入。如果后续要频繁运行外部 CLI，可考虑把《一竿入梦》整体放到 `AI短片/content_projects/一竿入梦/`，但仍必须保持《一竿入梦》自己的目录结构和 V2.0 母文件。
