# 《一竿入梦》V2.1 守水者智能体生产体系

版本：v2.1  
启用日期：2026-07-15  
项目定位：一个懂钓鱼的异常水域调查员，用真实钓技追查怪鱼，也追查水域为何失去生命。

账号承诺：钓的是答案，不是战利品。

最高设计依据：`docs/05_v2_1_守水者框架设计规范.md`（含2026-07-17结构增补）。
阶段实施记录：`docs/06_v2_1_守水者框架实施计划.md`；当前执行状态以本README、`docs/00_world_bible.md`和`docs/02_archive_catalog.md`为准。

## 1. V2.1 总结论

V2.0 不推翻 V1 的核心资产，但对叙事外壳进行约 40%-50% 重构。

### V1 原方案

老姚夜钓空军后睡着，进入系统创造的游戏关卡，依靠万水竿完成全球怪鱼挑战。

### V2.0试跑方案（已封存）

民间摄制组跟随钓鱼人老姚调查全球不同水域的异常鱼情。一根来历不明的旧鱼竿不断产生异常反应，摄像机也记录下当事人当时没有看见的水下证据。老姚以为自己在寻找怪鱼，后来却发现怪鱼也在通过鱼线观察他。

### V2.1对外一句话定位

钓鱼人误入全球神秘水域，靠真实钓技追查100起怪鱼事件。

### 内部创作定位

个人钓鱼日常 + 异常水域调查 + 守水者选择 + 伪纪录片悬疑 + 无限流长线谜团。

## 2. 项目目录

```text
09_智能体生产体系/
  README.md
  docs/
    00_world_bible.md
    01_character_bible.md
    02_archive_catalog.md
    03_fish_species_rules.md
    04_compliance_rules.md
    05_v2_1_守水者框架设计规范.md
    06_v2_1_守水者框架实施计划.md
  agents/
    novel_agent.md
    short_video_strategy_agent.md
    seedance_director_agent.md
    quality_review_agent.md
    showrunner_orchestrator.md
  templates/
    novel_chapter_template.md
    short_video_script_template.md
    retention_checklist.md
    seedance_prompt_template.md
  external_agents_adapter.md
  data/
    fish_species.json
    water_areas.json
    fishing_knowledge.json
    equipment_rules.json
  outputs/
    stories/
    scripts/
    storyboards/
    prompts/
    reviews/
```

## 3. V2.1数据流

```text
世界观与卷纲
  -> 小说正文级大纲
  -> 小说Agent生成完整档案故事
  -> 专业/因果/合规审核
  -> 短视频Agent传播改编
  -> Seedance导演Agent生成秒级分镜与提示词
  -> 质量审核Agent验收
  -> 发布与数据复盘
  -> 只反向优化短视频策略，不随意修改世界观
```

## 4. 冲突优先级

1. 法律、平台合规与生态保护。
2. 钓鱼专业事实和物理逻辑。
3. 世界观母文件的锁定设定。
4. 单集故事因果与人物动机。
5. 短视频留存与传播效率。
6. 商业植入。
7. 视觉奇观与特效。

## 5. 当前执行顺序

1. 本文件与V2.1设计规范作为当前总入口。
2. 当前先执行百档案小说规划：三层世界模型 -> 主回流历史 -> 十卷卷级答案 -> 70现水/20回声/10汇流分配 -> 第一卷重编。
3. 任何正式档案必须先完成档案类型、水域记忆模式、实体来源路径、伏笔接力和核验数据。
4. 新第一卷10档案通过用户审核后，再重做档案001正文级大纲和完整故事。
5. 故事通过专业、因果、合规和价值审核后，才进入短视频与Seedance。
6. V2.0方案与输出保留在原位置，并由 `09_归档/V2_0_档案001试跑资产索引_2026-07-15.md` 统一登记。
7. V1方案继续封存在 `09_归档/V1_原方案_2026-07-11/`。
8. 外部 AI 短片能力接入规则见 `external_agents_adapter.md`，但不得覆盖V2.1正史。
