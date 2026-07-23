# 《一竿入梦》视觉素材管理方案

## 总原则

视觉素材分为两层：

```text
assets/common/       项目通用素材
assets/archive_001/  档案001专属素材
assets/archive_002/  档案002专属素材
assets/archive_003/  档案003专属素材
```

后续每个档案都沿用同样的目录结构，避免不同剧情之间混用场景、证据物和异常表现。

## 通用素材目录

```text
common/
  characters/
    laoyao/       老姚最终角色参考图
    xiaohuang/    小黄狗最终角色参考图
  props/
    wanshuigan/   万水竿最终道具参考图
  color/          全项目锁定色卡
```

通用素材必须满足：

- 已通过角色或道具一致性审核。
- 后续剧情默认沿用，不随单个档案随意修改。
- 新版本不得覆盖旧版本，使用版本号或 `selected_` 标记。

## 单档案素材目录

例如档案001：

```text
archive_001/
  characters/
    laomangtou/  老莽头暂存或探索图
  props/
    wanshuigan/  档案001特殊状态图（如有）
  evidence/
    scale/       异常鳞片
  scenes/
    lake/        无声湖白天、夜间、空场
    underwater/  水下摄像机视角
  color/         档案001色卡预览或锁定版
```

## 归属判断

放入 `common/`：

- 老姚最终脸型、发型、基础服装和身份参考图。
- 小黄最终犬种、毛色、耳朵和尾巴参考图。
- 万水竿最终基础外观、台钓手竿结构和“水”刻纹参考图。
- 经过项目级确认的最终色卡。

放入 `archive_001/`：

- 无声湖场景。
- 水下摄像机画面。
- 异常鳞片。
- 档案001专属水纹、证据物和镜头参考图。

## 调用优先级

```text
单档案专属素材 > 项目通用素材 > 临时生成素材
```

如果单档案素材与通用素材发生冲突，必须在审核记录中说明，不得静默替换通用角色或道具设定。

## 生成前置约束

任何新图片、色卡、分镜或视频生成前，必须先：

1. 确认所属档案和素材目录。
2. 检查 `common/` 是否已有可复用参考图。
3. 读取对应 Agent 和外部 Skill。
4. 读取当前档案的色卡、风格和光效设定。
5. 在输出中记录调用链、参考图路径和生成用途。
6. 通过视觉一致性与质量审核后，才能使用 `selected_` 命名。

默认调用关系：

```text
视觉设定图：visual-storyboard-prompter
视觉一致性：visual-consistency-keeper
色卡：script-color-style-card
Seedance：seedance-20 + seedance_director_agent
最终审核：quality_review_agent
总控调度：showrunner_orchestrator
```
