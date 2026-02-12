# REVIEW_CREATIVE.md
## Advisor Review - Creative & Marketing Templates

**Reviewer:** Template Advisor  
**Date:** 2026-02-12  
**Scope:** 5 Creative/Marketing Templates  
**Target Score:** 9.5/10+

---

## 📊 TỔNG QUAN ĐÁNH GIÁ

| Template | Overall | Clarity | Actionability | Completeness | Currentness | Safety | Tools |
|----------|---------|---------|---------------|--------------|-------------|--------|-------|
| ArtPrompt_Pro | **7.5/10** | 8 | 7 | 8 | 8 | 8 | 6 |
| BedtimeStory_Pro | **7.2/10** | 7 | 7 | 8 | 8 | 8 | 6 |
| GiftGenius_Pro | **7.3/10** | 8 | 7 | 7 | 8 | 8 | 6 |
| TravelArchitect_Pro | **7.4/10** | 8 | 7 | 8 | 8 | 7 | 6 |
| ViralShortsGen_Pro | **7.8/10** | 8 | 8 | 7 | 9 | 8 | 7 |

---

## 🎨 1. ArtPrompt_Pro.md

### Current Score Breakdown
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | 8/10 | Framework PEARL rõ ràng, nhưng chưa liên kết chặt với Steps |
| Actionability | 7/10 | Thiếu template prompt fill-in-the-blank |
| Completeness | 8/10 | Đủ elements nhưng thiếu visual guide |
| Currentness | 8/10 | Midjourney v6 hiện tại, cần cập nhật SDXL/Flux |
| Safety | 8/10 | Copyright warnings đầy đủ |
| Tools Integration | 6/10 | Chỉ liệt kê, chưa có tool-chain cụ thể |

### 🔴 HIGH PRIORITY Issues (Fix ngay)

#### Issue 1.1: Typos Ngôn ngữ lặp lại
- **Location:** Dòng 30, 119, nhiều chỗ khác
- **Problem:** "Ngườii" (2 chữ i), "yêu thícht" (dòng 119)
- **Impact:** Mất chuyên nghiệp, ảnh hưởng credibility
- **Fix:** Global search & replace "Ngườii" → "Ngườii"

#### Issue 1.2: PEARL Framework chưa được liên kết với Steps
- **Location:** Section Instructions (Steps 1-6)
- **Problem:** Framework PEARL được giới thiệu nhưng không được đề cập trong các Steps. Ngườii dùng không biết Step nào mapping với chữ cái nào.
- **Current:** Steps độc lập với framework
- **Expected:** Mỗi Step nên có PEARL tag: "Step 1 (P - Prompt/Subject)", "Step 3 (L - Lighting)"
- **Fix:** Thêm PEARL mapping vào mỗi Step title

#### Issue 1.3: Thiếu Platform-Specific Prompt Templates
- **Location:** Step 5 - Technical Parameters
- **Problem:** Chỉ liệt kê parameters, không có fill-in-the-blank template cho từng platform
- **Current:** "--ar (aspect ratio), --v (version)..."
- **Expected:** 
  ```
  Midjourney Template:
  [Subject], [Style], [Lighting], [Composition] --ar [ratio] --v 6 --s [stylize] --q 2
  
  DALL-E Template:
  [Detailed description]. Style: [style]. Lighting: [lighting]. Composition: [composition].
  ```

### 🟡 MEDIUM PRIORITY Issues

#### Issue 1.4: Thiếu Negative Prompt Library
- **Location:** Step 6
- **Problem:** Chỉ có ví dụ 1 negative prompt, không có categorized library
- **Expected:** 
  - Common negatives (universal)
  - Portrait negatives (hands, face distortion)
  - Style-specific negatives (photorealism vs illustration)
  - Platform-specific (MJ không cần nhiều như SD)

#### Issue 1.5: Chưa cập nhật AI Models mới nhất
- **Location:** Technical Parameters section
- **Problem:** 
  - Chưa mention Flux (Black Forest Labs) - SOTA hiện tại
  - Chưa mention Ideogram 2.0/3.0 (text rendering tốt)
  - Stable Diffusion chưa specify SDXL vs SD 1.5 vs SD 3
- **Fix:** Thêm section "Emerging Models" hoặc update Platform list

#### Issue 1.6: Thiếu Style Reference Images Workflow
- **Location:** Step 2
- **Problem:** Không hướng dẫn sử dụng --sref (Midjourney) hoặc IP-Adapter (SD)
- **Impact:** Users không biết cách maintain style consistency
- **Fix:** Thêm Step 2.5: Style Consistency với reference images

#### Issue 1.7: Tool Integration chưa actionable
- **Location:** Tools Integration section
- **Problem:** "Web Search: Tìm reference artists" - nhưng không hướng dẫn cụ thể search query nào
- **Expected:** 
  ```
  Web Search Query Template:
  "[artist name] art style characteristics [medium]"
  "[style] photography lighting techniques"
  ```

### 🟢 LOW PRIORITY Issues

#### Issue 1.8: Thiếu Cost Comparison Table
- **Problem:** Cost implications chỉ là bullet list, không có comparison matrix
- **Expected:** Table so sánh chi phí/100 images cho từng platform

#### Issue 1.9: Variations chưa có specific workflow
- **Problem:** Variations chỉ mô tả use case, không có steps cụ thể để trigger mode đó

### ✅ Suggested Improvements (Để đạt 9.5/10)

1. **Add PEARL Quick Reference Card** ở đầu template - cheat sheet có thể copy
2. **Thêm "Prompt Strength Test"** - Checklist để verify prompt quality trước khi generate
3. **Update với Flux/Ideogram** - Các model mới nhất 2025
4. **Thêm Troubleshooting Visual Guide** - Ví dụ: "Nếu kết quả như [X], thêm [Y] vào prompt"
5. **Tạo Prompt Builder Tool** - Interactive form để user fill và auto-generate final prompt

---

## 🌙 2. BedtimeStory_Pro.md

### Current Score Breakdown
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | 7/10 | STORY framework chưa clear mapping, nhiều typos |
| Actionability | 7/10 | Thiếu story templates theo độ tuổi |
| Completeness | 8/10 | Đủ steps nhưng thiếu age-specific guidance |
| Currentness | 8/10 | OK |
| Safety | 8/10 | Warnings đầy đủ |
| Tools Integration | 6/10 | TTS integration chưa cụ thể |

### 🔴 HIGH PRIORITY Issues

#### Issue 2.1: Nhiều Typos Ngôn ngữ nghiêm trọng
- **Location:** Dòng 30 "Ngườii", Dòng 70 "Ngườii", Dòng 111 "tìm thấy rồi!", Dòng 119 "Ngườii"
- **Problem:** Lặp lại lỗi chính tả "Ngườii" (2 chữ i), "nhớ lợi" → "nhớ lại"
- **Fix:** Proofread toàn bộ, đặc biệt phần Example Usage

#### Issue 2.2: STORY Framework không được sử dụng trong Steps
- **Location:** Description và Steps
- **Problem:** Framework STORY (Setting, Theme, Objectives, Rhythm, Yield) được giới thiệu nhưng:
  - Không có mapping với Steps
  - Không giải thích Yield là gì
  - Objectives và Rhythm không rõ trong instructions
- **Current:** Steps 1-7 độc lập
- **Expected:** 
  - Step 1: Profile (để xác định Objectives)
  - Step 2: Theme (T)
  - Step 3: Setting (S)
  - Step 5: Rhythm (R) - pacing guidance
  - Step 6: Yield (Y) - outcome/moral

#### Issue 2.3: Thiếu Age-Specific Guidelines chi tiết
- **Location:** Prerequisites và Steps
- **Problem:** Chỉ có "Age-appropriate" chung chung, không có:
  - Vocabulary limits theo độ tuổi (3-5, 6-8, 9-12)
  - Sentence complexity guidelines
  - Theme appropriateness by age (fear handling khác nhau)
  - Story length by attention span
- **Expected:** Table hoặc section riêng cho từng age group

#### Issue 2.4: Example Story không follow chính xác Steps
- **Location:** Example Usage (Ví dụ Mia)
- **Problem:** 
  - Step 1 có "Fear: Afraid of the dark" nhưng trong Steps không có hướng dẫn xử lý fear
  - Step 7 "Cozy Ending" trong example có "*Kết thúc có hậu*" nhưng không phải là sleepy ending thuần túy
  - Thiếu "Good deed of the day" format trong template chuẩn
- **Fix:** Align example với Steps hoặc update Steps để match example tốt

### 🟡 MEDIUM PRIORITY Issues

#### Issue 2.5: Thiếu Story Templates/Blueprints
- **Location:** Instructions
- **Problem:** Không có story structure templates để user fill-in-the-blanks
- **Expected:** 
  ```markdown
  ## Story Template (Ages 4-6)
  Once upon a time, there was [character] who loved [favorite thing].
  One day, [character] discovered [gentle challenge].
  [Character] felt [emotion], but remembered [comforting thought].
  With [help from friend/object], [character] [resolution].
  And then [character] [cozy bedtime action].
  The end. Sleep tight!
  ```

#### Issue 2.6: TTS Integration chưa actionable
- **Location:** Tools Integration
- **Problem:** "TTS để tạo audio version" nhưng không hướng dẫn:
  - Voice selection (giọng nào phù hợp bedtime story)
  - Pacing/speed settings
  - Background music integration
  - File export formats
- **Fix:** Thêm TTS Best Practices section

#### Issue 2.7: Thiếu Cultural Adaptation Guidance
- **Location:** Safety Notes
- **Problem:** "Stories nên phù hợp cultural context" nhưng không giải thích cụ thể
- **Expected:** Guidelines cho:
  - Cultural symbols/folklore adaptation
  - Name selection phù hợp
  - Holiday references
  - Family structure diversity

#### Issue 2.8: Variations chưa có implementation guide
- **Location:** Variations section
- **Problem:** Mô tả 3 variations nhưng không có:
  - Cách trigger/kích hoạt từng mode
  - Differences trong Steps cho từng mode
  - Examples cho từng variation

### 🟢 LOW PRIORITY Issues

#### Issue 2.9: Thiếu Interactive Elements Guide
- **Location:** Pro Tips
- **Problem:** Tip 2 mention "sound effects, actions" nhưng không có library/examples

#### Issue 2.10: Story Series không có continuity guide
- **Location:** Pro Tips Tip 1
- **Problem:** Không hướng dẫn maintain consistency across stories

### ✅ Suggested Improvements

1. **Create Age-Specific Matrix** - Table với vocabulary, themes, length cho từng độ tuổi
2. **Add Fear/Challenge Handling Framework** - Cách gentle resolve common childhood fears
3. **TTS Voice Recommendations** - Giọng nào soothing, tốc độ nào phù hợp
4. **Story Template Library** - 5+ fill-in-the-blank templates
5. **Cultural Sensitivity Checklist** - Before publishing story

---

## 🎁 3. GiftGenius_Pro.md

### Current Score Breakdown
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | 8/10 | PRESENT framework rõ, nhưng mapping chưa chặt |
| Actionability | 7/10 | Thiếu gift research templates |
| Completeness | 7/10 | Thiếu corporate gift etiquette |
| Currentness | 8/10 | OK |
| Safety | 8/10 | Cultural notes có nhưng chưa đủ |
| Tools Integration | 6/10 | Web search chưa có query templates |

### 🔴 HIGH PRIORITY Issues

#### Issue 3.1: Typos Ngôn ngữ
- **Location:** Dòng 30 "Ngườii", nhiều chỗ khác
- **Problem:** Lặp lại lỗi "Ngườii"
- **Fix:** Global replace

#### Issue 3.2: PRESENT Framework không mapping với Steps
- **Location:** Description và Instructions
- **Problem:** 
  - P = Person (Step 1)
  - R = Relationship (Step 2)
  - E = Event (chưa có dedicated Step - được lồng vào Step 2)
  - S = Spending limit (Step 3)
  - E = Expectations (không có Step riêng)
  - N = Niches (Step 4)
  - T = Timing (Step 3)
- **Confusion:** Chữ E lặp lại 2 lần (Event và Expectations)
- **Fix:** 
  - Đổi framework thành PRESNT hoặc giải thích rõ E đầu vs E sau
  - Hoặc đổi thành PERSON framework: Person, Event, Relationship, Spending, Options, Niches

#### Issue 3.3: Step "Event" và "Expectations" bị lẫn lộn
- **Location:** Step 2 và Step 3
- **Problem:** 
  - Occasion nằm trong Step 2 (Relationship Context)
  - Expectations không có Step riêng
  - Timing nằm trong Step 3 (Constraints)
- **Expected:** Mỗi chữ cái PRESENT nên có 1 Step tương ứng rõ ràng

#### Issue 3.4: Thiếu Gift Research Query Templates
- **Location:** Step 5-6 và Tools Integration
- **Problem:** "Web Search để check prices" nhưng không có search queries
- **Expected:** 
  ```markdown
  ## Web Search Query Templates
  - "[gift category] for [recipient type] [occasion] 2025"
  - "[interest] gifts under $[budget] reviews"
  - "best [category] for [age] year old [gender]"
  - "sustainable/eco-friendly [category] gifts"
  ```

#### Issue 3.5: Corporate Gift Etiquette thiếu chi tiết
- **Location:** Variation 1: Corporate Gift Mode
- **Problem:** Chỉ có 1 paragraph, không có:
  - Price limits by relationship level
  - Cultural business gift taboos
  - Company policies considerations
  - Branding guidelines
- **Expected:** Corporate Gift Dos and Don'ts list

### 🟡 MEDIUM PRIORITY Issues

#### Issue 3.6: Thiếu Gift Wrapping & Presentation Guide
- **Location:** Pro Tips
- **Problem:** Tip 4 nói "Presentation matters" nhưng không có guidance
- **Expected:** 
  - Wrapping style by occasion
  - DIY vs professional wrapping
  - Gift card message templates
  - Delivery method considerations

#### Issue 3.7: Cultural Gift-Giving Customs chưa đủ
- **Location:** Safety Notes
- **Problem:** "Cultural differences" được mention nhưng không có specific examples
- **Expected:** 
  - Colors to avoid (white in some Asian cultures, purple in some Latin American)
  - Number taboos
  - Gift-opening etiquette
  - Reciprocity expectations

#### Issue 3.8: Thiếu Digital Gift Options
- **Location:** Step 4-5
- **Problem:** Focus nặng về physical gifts, digital options chỉ mention subscriptions
- **Expected:** 
  - E-books/Audiobooks
  - Online courses
  - Digital art/commissions
  - Crypto/NFT (nếu appropriate)
  - App subscriptions
  - Virtual experiences

#### Issue 3.9: Budget Constraints không có Flexibility Guide
- **Location:** Step 3
- **Problem:** Không hướng dẫn khi budget thấp ($10-20) hoặc DIY options
- **Expected:** Budget tier breakdown với strategies cho mỗi tier

### 🟢 LOW PRIORITY Issues

#### Issue 3.10: Thiếu Gift Tracking/Follow-up
- **Problem:** Không có guidance cho sau khi tặng (follow-up etiquette)

### ✅ Suggested Improvements

1. **Fix PRESENT Framework** - Loại bỏ confusion với double E
2. **Create Gift Research Toolkit** - Search queries, price comparison sites, review aggregators
3. **Add Cultural Gift Guide Appendix** - Major cultures và their gift customs
4. **Digital Gifts Section** - Comprehensive digital options
5. **DIY/H homestead Gifts** - For ultra-low budgets

---

## ✈️ 4. TravelArchitect_Pro.md

### Current Score Breakdown
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | 8/10 | JOURNEY framework chưa rõ mapping |
| Actionability | 7/10 | Thiếu itinerary templates |
| Completeness | 8/10 | Example rất tốt nhưng chưa có templates |
| Currentness | 8/10 | OK |
| Safety | 7/10 | Thiếu specific location safety |
| Tools Integration | 6/10 | Maps integration chưa cụ thể |

### 🔴 HIGH PRIORITY Issues

#### Issue 4.1: Typos Ngôn ngữ
- **Location:** Dòng 30 "Ngườii", Dòng 8 "thờii gian" (2 chữ i)
- **Problem:** Lỗi chính tả lặp lại
- **Fix:** Global replace

#### Issue 4.2: JOURNEY Framework không mapping với Steps
- **Location:** Description và Instructions
- **Problem:** 
  - J = Joints (attractions) - không rõ trong Steps
  - O = Orientation (layout) - Step 1
  - U = Unique experiences - Step 5
  - R = Routes - Step 4
  - N = Nourishment - Step 3
  - E = Evening plans - không có Step riêng
  - Y = Yearnings (flexibility) - Step 6
- **Fix:** Thêm mapping hoặc đơn giản hóa framework

#### Issue 4.3: Thiếu Itinerary Templates/Formats
- **Location:** Expected Output
- **Problem:** Chỉ có 1 example (Lisbon) rất chi tiết nhưng không có:
  - Blank template để user fill
  - Different formats (compact vs detailed)
  - Quick-reference format
- **Expected:** 
  ```markdown
  ## Blank Itinerary Template
  ### Day 1: [Theme]
  | Time | Activity | Location | Notes |
  |------|----------|----------|-------|
  | 08:00 | [Breakfast] | [Area] | [Reservation?] |
  ```

#### Issue 4.4: Thiếu Real-time Information Verification Workflow
- **Location:** Tools Integration
- **Problem:** Web search được mention nhưng không có:
  - What to verify (hours, prices, closures)
  - When to verify (how close to travel date)
  - How to handle outdated info
- **Expected:** Pre-trip verification checklist

#### Issue 4.5: Safety Section quá Generic
- **Location:** Safety Notes
- **Problem:** 
  - "Don't ignore local safety warnings" - không actionable
  - Không có country-specific resources
  - Không có emergency contact template
- **Expected:** 
  - Embassy registration
  - Emergency contact card template
  - Travel insurance requirements
  - Common scams by region

### 🟡 MEDIUM PRIORITY Issues

#### Issue 4.6: Thiếu Transportation Optimization
- **Location:** Step 4 và Example
- **Problem:** Chỉ có "group by neighborhood" nhưng không có:
  - Route optimization algorithms
  - Multi-modal transport planning
  - Cost comparison transport options
- **Expected:** Transport planning subsection

#### Issue 4.7: Weather Backup Plans chưa đủ
- **Location:** Example và Troubleshooting
- **Problem:** Chỉ có generic "indoor alternatives"
- **Expected:** 
  - Rain day itinerary template
  - Extreme weather protocols
  - Seasonal considerations guide

#### Issue 4.8: Budget Tracking không được tích hợp
- **Location:** Example có Budget Breakdown nhưng không có:
  - Real-time tracking method
  - Cost-saving strategies
  - Hidden costs warnings
- **Expected:** Budget tracking template hoặc link đến BudgetTracker_Pro

#### Issue 4.9: Food Allergies/Dietary không được xử lý chi tiết
- **Location:** Prerequisites và Example
- **Problem:** Example có "Pescatarian" nhưng không có:
  - Translation cards cho allergies
  - Restaurant communication tips
  - Safe food choices by cuisine
- **Expected:** Dietary restriction handling guide

#### Issue 4.10: Maps Tool Integration chưa cụ thể
- **Location:** Tools Integration
- **Problem:** "Maps: Route planning" nhưng không hướng dẫn:
  - Custom map creation (Google My Maps)
  - Offline maps setup
  - Layer management (food, sights, hotels)

### 🟢 LOW PRIORITY Issues

#### Issue 4.11: Thiếu Post-Trip Documentation
- **Problem:** Không có guidance để archive/refine itinerary sau chuyến đi

### ✅ Suggested Improvements

1. **JOURNEY-Step Mapping** - Clear alignment hoặc simplify framework
2. **Blank Itinerary Templates** - 3 formats: detailed, compact, mobile-friendly
3. **Pre-Trip Verification Checklist** - What to verify 1 week, 3 days, 1 day before
4. **Safety Resource Appendix** - By region/country type
5. **Maps Setup Guide** - Google My Maps creation tutorial

---

## 🎬 5. ViralShortsGen_Pro.md

### Current Score Breakdown
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | 8/10 | Tốt, format 2-column rất rõ |
| Actionability | 8/10 | Examples chi tiết, dễ follow |
| Completeness | 7/10 | Thiếu batch creation workflow |
| Currentness | 9/10 | 2025 trends, rất cập nhật |
| Safety | 8/10 | Copyright warnings tốt |
| Tools Integration | 7/10 | Có sử dụng tools nhưng chưa tối ưu |

### 🔴 HIGH PRIORITY Issues

#### Issue 5.1: Format không nhất quán với các template khác
- **Location:** Toàn bộ document
- **Problem:** 
  - Không có Metadata header chuẩn (thiếu --- borders)
  - Version format khác (2.0.0 vs các template khác)
  - "Council Approved: ✅" trong khi các template khác là "Pending"
  - Thiếu One-Line Pitch section chuẩn
- **Expected:** Align format với MASTER_TEMPLATE

#### Issue 5.2: Prerequisites thiếu chi tiết
- **Location:** Prerequisites section
- **Problem:** 
  - "Basic understanding of target platform" - không define "basic" là gì
  - Thiếu technical requirements (camera settings, lighting basics)
- **Expected:** 
  - Platform-specific prerequisites
  - Minimum tech requirements
  - Knowledge check questions

#### Issue 5.3: Step 1 Trend Intelligence thiếu Query Templates
- **Location:** Step 1
- **Problem:** 
  ```
  1. Search "[niche] trends TikTok 2025"
  ```
  Nhưng không có hướng dẫn cụ thể làm sao để identify patterns
- **Expected:** 
  - Trend analysis framework
  - What to look for checklist
  - How to validate trends (not just fads)

### 🟡 MEDIUM PRIORITY Issues

#### Issue 5.4: Thiếu Batch Creation Workflow
- **Location:** Toàn bộ template
- **Problem:** Template tập trung 1 video, không có:
  - Content calendar integration
  - Series planning
  - Repurposing content across platforms
- **Expected:** "Creating 30 Days of Content" section

#### Issue 5.5: Analytics/Performance Review không được đề cập
- **Location:** Expected Output
- **Problem:** Có "Performance estimate" nhưng không có:
  - How to measure actual performance
  - When to iterate vs when to pivot
  - A/B testing guidance
- **Expected:** Post-publish analysis workflow

#### Issue 5.6: Thiếu Collaboration/Team Workflow
- **Problem:** Template giả định solo creator, không có:
  - Client approval workflow
  - Team collaboration (editor, designer)
  - Brand guideline integration

#### Issue 5.7: Music/Audio Resources chưa cụ thể
- **Location:** Safety Notes và Examples
- **Problem:** 
  - Mention "Epidemic Sound, Artlist" nhưng không có:
  - How to search for trending sounds
  - Audio editing basics
  - Voiceover recording tips

#### Issue 5.8: Thiếu Thumbnail/Title Optimization
- **Location:** Step 4 Production Metadata
- **Problem:** Chỉ có "Cover text suggestion" 1 dòng
- **Expected:** 
  - Thumbnail design principles
  - Title formula templates
  - CTR optimization tips

### 🟢 LOW PRIORITY Issues

#### Issue 5.9: Platform Algorithm Details có thể outdated nhanh
- **Location:** Platform Differences section
- **Problem:** 2025 trends nhưng algorithms change liên tục
- **Expected:** Disclaimer hoặc link đến official resources

#### Issue 5.10: Thiếu Monetization Guidance
- **Location:** N/A
- **Problem:** Không có guidance cho sponsored content, affiliate integration

### ✅ Suggested Improvements

1. **Format Alignment** - Đồng bộ với MASTER_TEMPLATE
2. **Batch Creation Guide** - Workflow cho 30 ngày content
3. **Post-Performance Analysis** - Analytics interpretation
4. **Thumbnail & Title Optimization** - Visual CTR guide
5. **Audio Production Guide** - Voice recording, sound selection

---

## 📋 TỔNG KẾT VÀ RECOMMENDATIONS

### Common Issues Across All Templates

| Issue | Count | Severity |
|-------|-------|----------|
| Typos "Ngườii" | 5/5 templates | 🔴 High |
| Framework-Step Mapping | 4/5 templates | 🔴 High |
| Tool Query Templates | 5/5 templates | 🟡 Medium |
| Format Consistency | 1/5 templates | 🟡 Medium |

### Priority Fix List

#### 🔴 HIGH (Fix trước 2026-02-15)
1. **Global Typos Fix** - "Ngườii" → "Ngườii" tất cả templates
2. **Framework-Step Mapping** - ArtPrompt, BedtimeStory, GiftGenius, TravelArchitect
3. **Add Fill-in-the-Blank Templates** - Tất cả templates cần blank formats
4. **ViralShorts Format Alignment** - Đồng bộ với MASTER_TEMPLATE

#### 🟡 MEDIUM (Fix trước 2026-02-20)
5. **Tool Query Templates** - Web search queries cho tất cả templates
6. **Age-Specific Guidelines** - BedtimeStory
7. **Cultural Guidelines** - GiftGenius, TravelArchitect
8. **Safety Section Expansion** - TravelArchitect

#### 🟢 LOW (Fix trước 2026-02-28)
9. **Cost/Comparison Tables** - ArtPrompt, GiftGenius
10. **Post-Usage Workflows** - Tất cả templates
11. **Batch/Campaign Modes** - ViralShorts, ArtPrompt

### Target Scores After Fixes

| Template | Current | Target | Key Fixes Needed |
|----------|---------|--------|------------------|
| ArtPrompt_Pro | 7.5 | 9.2 | Framework mapping, Flux update, templates |
| BedtimeStory_Pro | 7.2 | 9.0 | Age guidelines, story templates, typos |
| GiftGenius_Pro | 7.3 | 9.1 | PRESENT fix, cultural guide, digital gifts |
| TravelArchitect_Pro | 7.4 | 9.0 | Blank templates, safety expansion, JOURNEY fix |
| ViralShortsGen_Pro | 7.8 | 9.3 | Format alignment, batch workflow, analytics |

---

## 📝 APPENDIX: Specific Line References

### ArtPrompt_Pro.md
- Line 30: "Ngườii" → "Ngườii"
- Line 70: "Ngườii" → "Ngườii"
- Line 119: "yêu thícht" → "yêu thích"

### BedtimeStory_Pro.md
- Line 30: "Ngườii" → "Ngườii"
- Line 70: "Ngườii" → "Ngườii"
- Line 111: "nhớ lợi" → "nhớ lại"
- Line 119: "Ngườii" → "Ngườii"

### GiftGenius_Pro.md
- Line 30: "Ngườii" → "Ngườii"
- Line 85: "Ngườii" → "Ngườii" (multiple)

### TravelArchitect_Pro.md
- Line 8: "thờii gian" → "thờii gian"
- Line 30: "Ngườii" → "Ngườii"

### ViralShortsGen_Pro.md
- Format issues: Thiếu standard metadata borders

---

*Review completed. Ready for revision phase.*
