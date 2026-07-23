# 档案001 Seedance 2.0 提示词包

版本：外部 AI 短片 Agent 接入试跑版 v2（中文主提示词）  
用途：将档案001拆成可逐条生成的 Seedance 2.0 短镜头提示词。

## 调用链记录

```text
showrunner_orchestrator
  -> seedance_director_agent
  -> external seedance-20
  -> visual-storyboard-prompter
  -> visual-consistency-keeper
  -> quality_review_agent
```

说明：本文件由上述 Agent/Skill 的规则整合生成；未调用 Seedance API，也未生成实际视频。中文提示词为默认执行层，英文提示词仅作为模型效果不稳定时的备用层。

## 项目级约束

```text
项目编号：yiganrumeng_archive_001
画幅：9:16竖屏
整体质感：低照度、手持摄影、民间钓鱼伪纪录片
整体情绪：克制悬疑，异常证据逐步增加
必须保持：老姚、旧鱼竿、淡蓝色水纹、小黄狗、黑色安静湖面、空鱼护、真实鱼线方向
禁止出现：游戏HUD、系统面板、魔法光柱、怪物正面特写、血腥、猎杀战利品、全程预告片式运镜
```

## Clip 01：湖突然无声

中文主提示词：

```text
9:16竖屏，民间钓鱼伪纪录片风格的夜钓远中景。黑色湖面上六支浮漂突然同时静止，水面没有涟漪，冷白色钓灯的倒影停在水面。手持摄影轻微晃动，低照度真实颗粒感。重点表现“整片湖像被按下静音键”，保持真实，不解释异常。不要字幕，不要游戏界面，不要幻想光效。
```

English fallback:

```text
9:16 vertical documentary night fishing shot. Six fishing floats suddenly become still on a black lake surface, with no ripples and cold white fishing lamp reflections. Subtle handheld movement, realistic low-light grain. Make the water feel like someone pressed mute. No subtitles, no game UI, no fantasy effect.
```

## Clip 02：老姚空军嘴硬

中文主提示词：

```text
9:16竖屏，手持伪纪录片中近景。三十多岁的中国钓鱼人老姚站在黑色湖边，手里举着空鱼护，旁边是钓箱和竿架。他表情尴尬又嘴硬，身边亮着夜钓灯，背景是黑色湖面。镜头缓慢推近，像摄制组在故意逗他。脸部、衣服、钓具保持真实且稳定，不改变人物外形。
```

English fallback:

```text
9:16 handheld documentary medium close shot. A grounded Chinese angler in his 30s, Lao Yao, holds an empty fish basket beside a fishing box and rod stand. He looks stubborn and embarrassed beside a night fishing lamp, with a black lake behind him. The camera gently pushes in as if the crew is teasing him. Keep face, clothes, and fishing gear realistic and stable.
```

## Clip 03：小黄拒绝靠近

中文主提示词：

```text
9:16竖屏，夜间湖岸手持镜头。一只耳朵耷拉、尾巴微卷的小黄狗在距离水边几米处突然停下，向后退两步，低下头，盯着黑色湖面。画面边缘能看到老姚的模糊身影回头。表现真实动物行为，紧张但不要超自然表情，不要让狗拟人化。
```

English fallback:

```text
9:16 night lakeside handheld shot. A small yellow dog with floppy ears and a curled tail stops several meters from the water, steps backward, lowers its head, and stares at the dark lake. The angler is blurred at the frame edge turning back. Real dog behavior, tense but not supernatural-looking. No anthropomorphic expression.
```

## Clip 04：常规判断失败

中文主提示词：

```text
9:16竖屏近景，冷色夜钓灯照亮老姚的双手。他更换鱼饵、调整浮漂，再压低竿梢测试水底。鱼钩、鱼线、浮漂、饵料和真实钓组清晰可见，动作连续，镜头固定，具有现场记录质感。后续镜头中的衣服、钓具和鱼竿保持一致，不要凭空更换装备。
```

English fallback:

```text
9:16 close-up under a cold night fishing lamp. The angler changes bait, adjusts the float, and lowers the rod tip to test the bottom. Real fishing rig, float, hook, line, and bait remain visible. Locked camera, clear practical movement, documentary texture. Keep clothes and fishing gear consistent with other shots.
```

## Clip 05：有鱼星但漂不动

中文主提示词：

```text
9:16竖屏湖面中景。前景的浮漂保持静止，远处却不断冒出细小鱼星，前景竿梢几乎不动。环境声像被压低，现场感觉不对劲。保持水面真实，只给出异常证据，不露出任何鱼或生物，不使用夸张特效。
```

English fallback:

```text
9:16 medium shot of a realistic lake surface. The foreground float remains motionless while small fish bubbles rise in the distance. The rod tip barely moves. The ambience feels muffled and wrong. Do not reveal any creature or use exaggerated effects.
```

## Clip 06：水下边缘暗影

中文主提示词：

```text
9:16竖屏水下摄像机画面。浑浊的黑色湖水中有悬浮颗粒和廉价设备噪点，一个模糊暗影只在画面最边缘快速闪过一帧，绝不完整露出。像廉价水下摄像机意外记录到的证据。不要怪物特写，不要清晰揭示生物形态。
```

English fallback:

```text
9:16 underwater camera view in dark murky lake water with suspended particles and cheap device noise. A blurred shadow flashes briefly at the extreme edge of the frame for one quick hint, never fully visible. It should feel like accidental evidence from a cheap underwater camera. No monster close-up.
```

## Clip 07：万水竿反应

中文主提示词：

```text
9:16竖屏极近景，拍摄一根磨旧的老鱼竿握柄。淡蓝色水纹痕迹在竿身表面慢慢浮现，老姚的手指轻微收紧，竿梢产生极小幅度的震动。镜头缓慢推近。异常必须克制，像物证变化，不像魔法。不要光柱，不要武器质感，不要游戏界面。
```

English fallback:

```text
9:16 extreme close-up of an old worn fishing rod handle. Subtle blue water-ripple marks slowly emerge across the rod surface, the angler's fingers tighten slightly, and the rod tip vibrates faintly. Slow push-in. Restrained supernatural evidence, no magic beam, no weapon look, no game interface.
```

## Clip 08：鱼线横着走

中文主提示词：

```text
9:16竖屏，手持伪纪录片侧后方中近景。老姚改试中上层水层，鱼竿真实弯曲，鱼线从竿梢连续延伸到湖面，并被横向拉动，不能凭空断开。老姚后脚撑住地面，突然收起嘴硬表情，进入专注状态。突出受力、鱼线方向和真实控竿动作。
```

English fallback:

```text
9:16 medium close side-back handheld documentary shot. The angler tests the mid-upper water layer. The rod bends realistically, and the fishing line runs continuously from the rod tip to the lake, pulled sideways without breaking. He braces his back foot and becomes focused. Emphasize physical line direction and rod tension.
```

## Clip 09：跑鱼但留下证据

中文主提示词：

```text
9:16竖屏低机位中景。鱼竿梢先弯下再突然回弹，老姚向后退半步稳住身体，湖面传来沉闷水声并出现短暂涟漪，但不露出完整鱼身。动作体现真实受力和失手瞬间，摄像机保持紧张的现场跟拍感，不要夸张甩竿。
```

English fallback:

```text
9:16 low-angle medium shot. The rod tip bends and then snaps back. The angler steps back half a step to steady himself. The water gives a dull splash and brief ripple, but no full fish body appears. Realistic force and continuous movement, tense documentary camera, no exaggerated casting.
```

## Clip 10：异常鳞片与回放

中文主提示词：

```text
9:16竖屏微距伪纪录片证据镜头。鱼钩上挂着一片湿润的异常鳞片，鳞片表面有像鱼线擦过的细密划痕，一滴水缓慢落下。随后溶接到前面画面边缘那道淡蓝色水纹的回放。不要血腥，不要战利品展示，只强调证据感。水纹形状必须与Clip 01和Clip 07保持一致。
```

English fallback:

```text
9:16 macro documentary evidence shot. A fishing hook holds a wet strange scale with fine scratches like fishing-line abrasion. One water droplet falls. Dissolve into a replay-like image of the subtle blue ripple at the frame edge from earlier. No gore, no trophy hunting, evidence-first mood. Keep the ripple shape consistent with Clips 01 and 07.
```

## 统一中文负面提示词

```text
游戏HUD，系统面板，任务奖励，经验值，商城，战斗力，魔法光柱，怪物正面特写，血腥，猎杀战利品，变脸，服装不一致，随机字幕，水印，Logo，手部变形，多余手指，鱼线连续性断裂，鱼竿弯曲不符合受力，重复人物，塑料皮肤，廉价角色扮演，杂乱背景，脸部过曝，电影预告片式过度戏剧化
```

## English fallback negative prompt

```text
game HUD, system panel, quest rewards, experience points, shop interface, combat power, magic beam, monster close-up, gore, trophy hunting, face change, inconsistent costume, random subtitles, watermark, logo, deformed hands, extra fingers, broken fishing line continuity, unrealistic rod bend, duplicate character, plastic skin, cheap cosplay, messy background, overexposed face, over-dramatic cinematic trailer style
```

## 中文声音提示

```text
开头是自然的夜间环境声、虫鸣和轻微水声；Clip 01六支浮漂同时静止时，环境声突然归零；Clip 06加入廉价水下设备的轻微电流噪声；Clip 07万水竿反应时加入低频震动；Clip 08加入台钓手竿竿梢轻微震动、主线拉水和线结摩擦的声音，不出现渔轮声音；Clip 10保留水滴声落下的清脆近声。配乐克制，不使用预告片式大气音乐。
```

## English fallback sound prompt

```text
Natural night ambience, insects and soft water at first. Sudden silence when the six floats stop in Clip 01. Faint electrical recorder noise in Clip 06. Low-frequency vibration from the old pole in Clip 07. Subtle tip vibration, main line cutting through water, and knot friction during the sideways pull in Clip 08; no fishing reel sound. Close water-droplet sound in the final macro evidence shot. Restrained score, no trailer-style orchestral swell.
```

## 拼接与连续性

- Clip 01和Clip 10是复播钩子，保留相同的淡蓝色水纹视觉特征。
- Clip 07的万水竿水纹必须与Clip 10回放水纹一致。
- Clip 08的鱼线方向必须从竿梢连续到水面，不能凭空断开。
- 老姚的脸型、发型、服装、钓箱和竿架在所有镜头中保持一致。
- 小黄只表现真实动物本能，不出现拟人化反应。
- 如生成失败，优先重试Clip 08和Clip 10；这两个镜头决定可信度。
