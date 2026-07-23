# 档案001 Seedance 2.0 分镜

版本：外部 AI 短片 Agent 接入试跑版  
参考能力：visual-storyboard-prompter + seedance-20  
目标：80秒竖屏伪纪录片短剧

## 制作目标

把《无声湖停口事件》做成一条证据感强、异常克制、钓鱼动作可信的竖屏短剧。镜头要像民间摄制组临场记录，不像电影预告片，也不出现游戏HUD或玄幻光柱。

## 统一视觉设定

- 画幅：9:16。
- 风格：民间钓鱼纪录片，低照度夜景，轻微手持，高ISO细噪点。
- 色彩：黑水、冷白夜钓灯、旧鱼竿淡蓝水纹，整体克制。
- 角色：老姚为接地气钓鱼人，不夸张英雄化；小黄保持真实小狗行为。
- 异常：通过声音消失、水纹、暗影、鱼线方向和鳞片证据表现，不完整露怪。

## 角色一致性提示词

```text
老姚，30岁左右中国男性钓鱼人，接地气，夜钓服或户外夹克，头灯或夜钓灯环境，手上有真实钓鱼装备，表情嘴硬但紧张，动作熟练不夸张，保持同一脸型发型服装。
```

```text
小黄，中小型黄狗，双垂耳，卷尾金钱尾，真实宠物犬比例，紧张时后退低哼，不说话，不拟人，不变形。
```

```text
万水竿，旧鱼竿，握把磨损，竿身有细小水纹，异常时只出现极淡蓝色水纹和轻微震动，不发光柱，不像武器。
```

## 场景一致性提示词

```text
无声湖夜钓点，黑色湖面，岸边简易钓位，鱼护、钓箱、竿架、夜钓灯，远处暗树影，水面偶尔有鱼星，低照度纪录片质感，环境真实，不出现城市霓虹和奇幻建筑。
```

## 镜头表

| 镜头编号 | 时长 | 景别 | 机位 | 镜头运动 | 画面主体 | 动作 | 情绪目标 | 转场 |
|---|---:|---|---|---|---|---|---|---|
| A001-001 | 3秒 | 特写 | 低角度水面 | 轻微手持 | 六支浮漂 | 浮漂同时静止，水面无波 | 异常瞬间 | 声音先行 |
| A001-002 | 5秒 | 中近景 | 平视 | 轻推 | 老姚和空鱼护 | 老姚举空鱼护嘴硬 | 人物反差 | 硬切 |
| A001-003 | 7秒 | 全景到近景 | 侧拍 | 跟拍 | 小黄 | 小黄停步、后退、低哼 | 第二证据 | 动作接动作 |
| A001-004 | 8秒 | 手部特写 | 俯拍 | 固定 | 老姚双手和线组 | 换饵、调漂、试底 | 专业可信 | 硬切 |
| A001-005 | 8秒 | 中景 | 平视 | 轻微横移 | 漂相和鱼星 | 漂不动，远处鱼星冒起 | 判断不稳 | 声音变闷 |
| A001-006 | 8秒 | 水下主观 | 固定 | 轻微漂移 | 摄像机画面边缘 | 暗影一帧闪过 | 认知修正 | 闪切 |
| A001-007 | 10秒 | 极特写 | 手持近贴 | 缓慢推进 | 万水竿握把 | 淡蓝水纹浮现，竿梢轻震 | 规则介入 | 低频声桥 |
| A001-008 | 11秒 | 中近景 | 侧后方 | 跟拍 | 老姚控竿 | 改试中上层，鱼线横向走 | 紧张验证 | 动作接动作 |
| A001-009 | 10秒 | 中景到特写 | 低角度 | 快切+回弹 | 竿尖和老姚 | 竿弯后突然一松，老姚后撤 | 跑鱼与证据 | 硬切 |
| A001-010 | 10秒 | 微距 | 俯拍 | 固定 | 钩尖鳞片 | 鳞片滴水，回放7秒水纹 | 证据回报 | 回放叠化 |

## 逐镜头提示词

### A001-001

中文：

```text
9:16竖屏，夜钓湖面，六支浮漂在黑色水面上同时静止，水面没有波纹，低照度纪录片质感，轻微手持，冷白夜钓灯反光，画面安静压迫，不出现字幕水印，不出现游戏界面。
```

English:

```text
9:16 vertical documentary night fishing shot, six fishing floats suddenly still on a black lake surface, no ripples, low-light handheld camera, cold white fishing lamp reflections, quiet oppressive mood, realistic grain, no subtitles, no game UI.
```

### A001-002

中文：

```text
夜钓岸边，中近景，30岁左右中国钓鱼人老姚举着空鱼护，表情嘴硬又尴尬，旁边有钓箱和竿架，真实户外钓鱼服，轻微手持推进，民间纪录片质感。
```

English:

```text
vertical documentary medium close shot, Chinese angler in his 30s holding an empty fish basket, stubborn embarrassed expression, fishing box and rod stand beside him, realistic outdoor fishing clothes, subtle handheld push-in.
```

### A001-003

中文：

```text
夜晚湖岸，小黄狗停在离水边几米处，双垂耳，卷尾，身体后退，低头警觉看向黑水，老姚在画面边缘回头，手持跟拍，真实宠物犬动作，不拟人。
```

English:

```text
night lakeside handheld shot, small yellow dog with floppy ears and curled tail stops several meters from the water, steps backward and stares at the dark lake, the angler turns in the frame edge, realistic dog behavior, not anthropomorphic.
```

### A001-004

中文：

```text
手部特写，老姚熟练换饵、调漂、压低竿梢试底，真实钓鱼线组和浮漂，冷白夜钓灯照亮手和鱼线，镜头固定，动作清楚，不变换装备。
```

English:

```text
close-up of hands changing bait and adjusting the float, realistic fishing rig and line, cold night fishing lamp lighting the hands, locked camera, clear practical action, no gear changes.
```

### A001-005

中文：

```text
湖面中景，浮漂仍然不动，远处有小鱼星冒起，老姚的竿尖在前景轻微晃动，环境声变闷，低照度真实夜钓，不出现怪物。
```

English:

```text
medium shot of the lake surface, float still motionless, small fish bubbles appear in the distance, rod tip slightly moving in foreground, muffled ambience, realistic low-light night fishing, no monster visible.
```

### A001-006

中文：

```text
水下摄像机画面，浑暗湖水，画面边缘有一帧模糊暗影快速掠过，主体不完整露出，设备噪点和水中悬浮颗粒，真实水下低清晰度。
```

English:

```text
underwater camera view in dark murky lake water, a blurred shadow flashes briefly at the edge of the frame, never fully revealed, device noise and suspended particles, realistic low-visibility underwater footage.
```

### A001-007

中文：

```text
旧鱼竿握把极特写，磨损握把和竿身细纹，极淡蓝色水纹从竿身表面浮现，手指微微收紧，竿梢轻震，克制异常，不发光柱，不像武器。
```

English:

```text
extreme close-up of an old worn fishing rod handle, subtle blue water-ripple marks emerge on the rod surface, fingers tighten slightly, rod tip vibrates faintly, restrained supernatural detail, no magic beam, not weapon-like.
```

### A001-008

中文：

```text
侧后方中近景，老姚改试中上层，竿身弯曲合理，鱼线从竿梢连续延伸到水面并被横向拖动，老姚后脚稳住，表情突然认真，手持跟拍。
```

English:

```text
medium close side-back shot, angler tests mid-upper water layer, rod bends realistically, fishing line runs continuously from rod tip to water and is pulled sideways, angler braces his back foot, focused expression, handheld tracking.
```

### A001-009

中文：

```text
低角度中景，竿尖弯起后突然回弹，老姚后撤半步稳住身体，水面只有闷响和短暂涟漪，没有完整鱼体，真实受力和动作连续。
```

English:

```text
low-angle medium shot, rod tip bends then snaps back, angler steps back half a step to steady himself, water surface gives a dull splash and brief ripple, no full fish body shown, realistic force and continuous motion.
```

### A001-010

中文：

```text
微距证据镜头，钩尖挂着一枚湿润异常鳞片，鳞片表面有细小线状磨痕，水滴落下，随后叠化到7秒处水面边缘水纹回放，纪录片证据感，不血腥。
```

English:

```text
macro evidence shot, fishing hook holding a wet strange scale with fine line scratches, water droplet falls, dissolve into replay of subtle ripple at the frame edge from second 7, documentary evidence mood, no gore.
```

## 统一负面提示词

```text
变脸，服装突变，现代无关物品，游戏HUD，系统面板，字幕水印，玄幻光柱，怪兽正脸，血腥捕杀，鱼线断裂不连续，鱼竿弯曲不合理，畸形手，重复人物，塑料皮肤，过度电影预告片风格，背景杂乱污染
```

```text
face changes, inconsistent costume, unrelated modern objects, game HUD, system panel, random subtitles, watermark, fantasy beam, monster close-up, gore, trophy hunting, broken line continuity, unrealistic rod bend, deformed hands, duplicate character, plastic skin, trailer-style overdrama, messy background
```

## 工具适配建议

- Seedance 2.0：每个镜头保持一个可见动作，优先 3-10 秒短镜头，鱼线方向和竿弧要写清。
- 即梦/可灵：如单镜生成不稳，拆成“浮漂静止”“老姚反应”“收音断层”三个短镜。
- Midjourney/图片工具：优先生成封面、老姚定妆、小黄、万水竿特写、异常鳞片证据图。
