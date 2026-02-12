---
## 📋 Template Metadata
**Template Name:** ArtPrompt Pro - AI Art Prompt Engineer
**Version:** 2.0.0
**Last Reviewed:** 2026-02-12
**Council Approved:** Pending
**Category:** Creative
**Complexity:** Intermediate
**Est. Time:** 3-5 minutes per prompt

**Author:** Template Council
**Contributors:** AI Art Community
**Tags:** [#ai-art, #prompt-engineering, #midjourney, #dalle, #stable-diffusion, #creativity]
---

# 🎨 ArtPrompt Pro

## One-Line Pitch
Biến ý tưởng đơn giản thành prompt AI art chuyên nghiệp, tối ưu cho Midjourney, DALL-E, và Stable Diffusion với khả năng kiểm soát style, lighting, và composition.

## 📖 Description
ArtPrompt Pro giúp bạn tạo ra các prompt AI art chất lượng cao từ những ý tưởng đơn giản. Template này sử dụng framework PEARL (Prompt Engineering for Artistic Rendering Logic) để đảm bảo mỗi prompt đều có đầy đủ các yếu tố: Subject, Style, Lighting, Composition, và Technical Parameters.

**Dành cho:**
- Artists muốn khám phá AI art
- Content creators cần hình ảnh nhanh
- Marketers tạo visual content
- Người mới muốn học prompt engineering

**Kết quả mong đợi:** Prompt chi tiết, sẵn sàng copy-paste vào Midjourney/DALL-E/Stable Diffusion, với tỷ lệ thành công cao ngay lần đầu.

---

## ✅ Prerequisites (Điều Kiện Tiên Quyết)

### Kiến Thức Cần Có
- [ ] Hiểu cơ bản về AI image generators (Midjourney/DALL-E/Stable Diffusion)
- [ ] Biết các khái niệm cơ bản: aspect ratio, lighting terms, art styles
- [ ] Familiar với negative prompts (cho Stable Diffusion)

### Tools/Access Cần Có
- [ ] OpenClaw với web search enabled (để tham khảo styles)
- [ ] Access ít nhất một AI art platform:
  - Midjourney (Discord)
  - DALL-E (ChatGPT Plus hoặc API)
  - Stable Diffusion (local hoặc online)
- [ ] (Optional) Image upscaler (Upscayl, Topaz Gigapixel)

### Dữ Liệu/Inputs Cần Chuẩn Bị
- [ ] Ý tưởng chính (concept/subject)
- [ ] Mood/feeling mong muốn
- [ ] Reference artists/styles (nếu có)
- [ ] Intended use case (social media, print, wallpaper...)

---

## 🚀 Instructions (Hướng Dẫn Từng Bước)

### Step 1: Xác Định Core Subject
**Action:** Phân tích và mô tả chi tiết chủ thể chính
**Details:**
- Xác định WHAT: "What is the main subject?"
- Thêm WHO: Character details (age, gender, expression, clothing)
- Thêm WHERE: Setting/environment
- Thêm ACTION: Đang làm gì? Pose như thế nào?

**Expected Result:** 1-2 câu mô tả chi tiết subject

---

### Step 2: Chọn Art Style
**Action:** Chọn và mô tả phong cách nghệ thuật
**Details:**
- Medium: digital art, oil painting, watercolor, 3D render, photography...
- Style reference: theo artist cụ thể hoặc art movement
- Detail level: hyper-realistic, stylized, minimalist, intricate...

**Expected Result:** Style description rõ ràng, có thể dùng artist names làm reference

---

### Step 3: Thiết Lập Lighting & Atmosphere
**Action:** Định nghĩa ánh sáng và mood
**Details:**
- Lighting type: golden hour, neon lights, studio lighting, volumetric lighting...
- Time of day: dawn, noon, sunset, night
- Weather/atmosphere: foggy, rainy, clear, misty...
- Color palette: warm tones, cool blues, vibrant, muted...

**Expected Result:** Mô tả lighting tạo được mood mong muốn

---

### Step 4: Xác Định Composition
**Action:** Chọn framing và camera angle
**Details:**
- Camera angle: eye-level, low angle, aerial view, close-up...
- Framing: wide shot, medium shot, extreme close-up...
- Perspective: isometric, fisheye, dutch angle...
- Focus: depth of field (bokeh, sharp focus)

**Expected Result:** Clear composition direction

---

### Step 5: Thêm Technical Parameters
**Action:** Thêm các thông số kỹ thuật platform-specific
**Details:**
- **Midjourney:** --ar (aspect ratio), --v (version), --s (stylize), --q (quality)
- **DALL-E:** Size (1024x1024, 1792x1024...), quality (standard/hd)
- **Stable Diffusion:** CFG scale, steps, sampler, seed
- **Flux/Ideogram:** Model selection, text rendering options
- **Universal:** Resolution hints (8k, highly detailed...)

**Fill-in-the-Blank Templates:**
```markdown
## Midjourney Template:
[Subject], [Style], [Lighting], [Composition] --ar [ratio] --v 6 --s [stylize] --q 2

## DALL-E Template:
[Detailed description]. Style: [style]. Lighting: [lighting]. Composition: [composition]. Quality: [hd/standard].

## Stable Diffusion Template:
Positive: [Subject], [Style], [Lighting], [Composition], [Quality tags]
Negative: [Common negatives], [Style-specific negatives], [Content-specific negatives]
CFG: [7-12], Steps: [20-50], Sampler: [DPM++ 2M Karras/Euler a]

## Flux Template:
[Detailed natural language description]. [Style modifiers]. [Technical quality tags].

## Ideogram Template (for text):
[Description with text in quotes]: "[TEXT]" - [Style], [Lighting], [Composition]
```

**Expected Result:** Complete prompt với đầy đủ parameters

---

### Step 6: (Optional) Tạo Negative Prompt
**Action:** Liệt kê những gì KHÔNG muốn xuất hiện
**Details:**
- Common negatives: blurry, low quality, deformed, extra limbs...
- Style-specific: oversaturated, watermark, signature...
- Content-specific: những elements không phù hợp với concept

**Expected Result:** Negative prompt list (chủ yếu cho Stable Diffusion)

---

## 💡 Example Usage (Ví Dụ Cụ Thể)

### Scenario: Tạo hình ảnh cyberpunk city

**Input của bạn:**
```
Subject: Futuristic Tokyo street at night
Mood: Mysterious, neon-lit, rainy
Style: Blade Runner aesthetic
Use: Wallpaper for desktop
```

**Cách sử dụng template:**

**Step 1 - Core Subject:**
"A narrow Tokyo street in 2087, wet asphalt reflecting neon signs, futuristic motorcycles parked along the sidewalk, a lone figure in a long coat walking away"

**Step 2 - Art Style:**
"Cyberpunk digital art, inspired by Syd Mead and Simon Stålenhag, highly detailed, intricate architectural details"

**Step 3 - Lighting & Atmosphere:**
"Neon pink and cyan lights casting reflections on wet ground, volumetric fog, rain droplets visible, dark night sky with holographic advertisements"

**Step 4 - Composition:**
"Low angle shot from street level, leading lines following the street into the distance, depth of field with foreground slightly blurred"

**Step 5 - Technical Parameters:**
```
Midjourney: --ar 16:9 --v 6 --s 750 --q 2
DALL-E: 1792x1024, hd quality
```

**Final Prompt:**
```
A narrow Tokyo street in 2087, wet asphalt reflecting neon signs, futuristic motorcycles parked along the sidewalk, a lone figure in a long coat walking away, cyberpunk digital art, inspired by Syd Mead and Simon Stålenhag, highly detailed, intricate architectural details, neon pink and cyan lights casting reflections on wet ground, volumetric fog, rain droplets visible, dark night sky with holographic advertisements, low angle shot from street level, leading lines following the street into the distance, depth of field with foreground slightly blurred, 8k resolution, cinematic composition --ar 16:9 --v 6 --s 750
```

**Negative Prompt (Stable Diffusion):**
```
blurry, low quality, deformed, ugly, duplicate, watermark, signature, text, logo, cropped, worst quality, low resolution, oversaturated, cartoon, anime
```

**Output mong đợi:**
Hình ảnh cyberpunk city chất lượng cao, sẵn sàng dùng làm wallpaper hoặc concept art.

---

## 🛠️ Tools Integration (Tích Hợp Tools)

### Tools Được Sử Dụng
| Tool | Purpose | When to Use |
|------|---------|-------------|
| Web Search | Tìm reference artists, styles, lighting techniques | Khi cần inspiration hoặc verify art style terms |
| Browser | Truy cập Midjourney/DALL-E/SD platforms | Khi ready để generate |
| File System | Lưu prompts và reference images | Archive successful prompts |
| Canvas | Preview và annotate generated images | Post-processing analysis |

### Tool Chain Flow
```
[Concept] → [Web Search: Reference] → [Prompt Construction] → [AI Generation] → [File Save: Prompt Archive]
```

---

## ⚠️ Common Pitfalls (Lỗi Thường Gặp)

### Pitfall 1: Prompt quá ngắn/vague
**What:** "A beautiful landscape" - không đủ detail
**Why it happens:** Ngại viết dài hoặc không biết mô tả thêm gì
**How to avoid:** Sử dụng PEARL framework, mỗi category ít nhất 1 descriptor

### Pitfall 2: Contradictory descriptions
**What:** "Photorealistic cartoon character" - oxymoron
**Why it happens:** Không hiểu rõ các style terms
**How to avoid:** Research style compatibility, dùng web search để verify

### Pitfall 3: Copying artists without context
**What:** Prompt chỉ là list tên artists không có cohesive vision
**Why it happens:** Nghĩ rằng nhiều artists = better result
**How to avoid:** Chọn 1-2 artists có style compatible, mô tả WHY chọn họ

### Pitfall 4: Ignoring platform limitations
**What:** Dùng Midjourney parameters trong DALL-E prompt
**Why it happens:** Không customize prompt cho từng platform
**How to avoid:** Luôn có version của prompt cho từng platform

---

## 🛡️ Safety Notes (Lưu Ý An Toàn)

### ⚠️ Limitations
- AI art generators có thể không hiểu complex spatial relationships
- Text trong hình ảnh thường bị garbled (trừ khi dùng specialized models)
- Consistent characters across multiple images rất khó
- Hands và facial features đôi khi bị deformed

### 🚫 Don't Do This
- Không dùng để generate NSFW content nếu không phù hợp context
- Không sử dụng tên artists sống để bán commercial work (copyright gray area)
- Không rely 100% vào AI cho client work mà không có backup plan
- Không spam prompts - respect rate limits của platforms

### 💰 Cost Implications
- **Midjourney:** $10-60/month subscription
- **DALL-E:** $0.04-0.08 per image (API) hoặc included trong ChatGPT Plus
- **Stable Diffusion:** Free (local) hoặc $0.001-0.01 per image (cloud)
- **Estimated cost per professional prompt run:** $0.10-0.50

### 🔒 Data Privacy
- Prompts và generated images có thể được dùng để train models (check TOS)
- Không upload sensitive/personal information vào prompts
- Commercial usage rights vary by platform - verify trước khi dùng cho client work

---

## 📊 Expected Output

### Format
Markdown text hoặc plain text, sẵn sàng copy-paste vào AI art platforms.

### Content Structure
```
[Subject Description], [Style], [Lighting], [Composition], [Technical Parameters]

Negative Prompt (nếu applicable):
[What to exclude]
```

### Quality Criteria
Output tốt nếu:
- [ ] Prompt có ít nhất 4/5 PEARL elements
- [ ] Không có contradictory terms
- [ ] Platform parameters đúng và current
- [ ] Có thể generate good result trong 1-3 attempts
- [ ] Negative prompt đầy đủ (cho SD)

---

## 🎓 Pro Tips (Mẹo Chuyên Nghiệp)

1. **Tip 1: Prompt Weights** - Trong Midjourney/SD, dùng :: để emphasize elements quan trọng hơn. Ví dụ: `forest::2 dark::1` = forest quan trọng gấp đôi dark.

2. **Tip 2: Seed Control** - Dùng cùng một seed với slight prompt variations để tạo consistent series.

3. **Tip 3: Style Transfer** - Bắt đầu với "in the style of [famous artwork]" để đạt được specific aesthetic nhanh chóng.

4. **Tip 4: Iterative Refinement** - Generate version 1, identify what's wrong, add negative prompts hoặc adjust descriptions thay vì start from scratch.

---

## 🔄 Variations (Biến Thể)

### Variation 1: Quick Prompt Mode
**Use case:** Cần prompt nhanh, không cần quá detailed
**Changes:** Skip Step 4-5, focus chỉ Subject + Style + 1-2 descriptors

### Variation 2: Commercial Asset Mode
**Use case:** Tạo assets cho commercial project với consistent style
**Changes:** Thêm style reference images ( Midjourney --sref), document mọi parameter để reproduce

### Variation 3: Experimental Mode
**Use case:** Khám phá creative possibilities, không cần specific output
**Changes:** Dùng abstract descriptors, combine unlikely elements, embrace randomness

---

## 📚 Related Templates

- [CharacterDesigner_Pro.md] - Tạo consistent character designs
- [LogoPrompt_Pro.md] - Prompts optimized cho logo generation
- [PhotoRestoration_Pro.md] - Enhance và restore old photos với AI

---

## 🐛 Troubleshooting (Xử Lý Sự Cố)

### Issue: Generated image không giống description
**Symptoms:** AI hiểu sai hoặc bỏ qua một số elements
**Solution:** 
- Thêm emphasis weights (::2) cho elements quan trọng
- Simplify prompt - quá dài có thể gây confusion
- Đưa important elements lên đầu prompt

### Issue: Quality quá thấp/blurry
**Symptoms:** Images lack detail, look compressed
**Solution:**
- Thêm "highly detailed, 8k, sharp focus, intricate"
- Increase quality parameters (--q 2, hd quality)
- Check platform không bị downgrade free tier

### Issue: Style không consistent
**Symptoms:** Mỗi generation ra style khác nhau
**Solution:**
- Use seed parameter để lock randomness
- Thêm specific artist references
- Tăng stylize parameter (Midjourney --s)

---

## 📝 Changelog

### v2.0.0 - 2026-02-12
- Complete rewrite theo MASTER_TEMPLATE format
- Added PEARL framework (Prompt Engineering for Artistic Rendering Logic)
- Expanded platform-specific guidance (Midjourney, DALL-E, Stable Diffusion)
- Added negative prompt section
- Included cost implications và privacy warnings

### v1.0.0 - 2026-01-15
- Initial simple template: "Convert user's idea to detailed prompt"

---

## ✅ Council Approval Stamp

**Status:** [ ] Pending / [ ] Approved / [ ] Rejected
**Date:** 2026-02-12
**Version Approved:** 2.0.0

**Scores:**
| Criteria | Score |
|----------|-------|
| Clarity | /10 |
| Actionability | /10 |
| Completeness | /10 |
| Currentness | /10 |
| Safety | /10 |
| Tools Integration | /10 |
| **OVERALL** | **/10** |

**Approved by:**
- [ ] 🏗️ Template Architect
- [ ] 🎯 Domain Expert
- [ ] 🎨 UX Engineer
- [ ] ✅ Practicality Auditor
- [ ] 📝 Version Control Lead
