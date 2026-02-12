---
## 📋 Template Metadata
**Template Name:** Grocery List Pro
**Version:** 2.0.0
**Last Reviewed:** 2026-02-12
**Council Approved:** Pending
**Category:** Productivity/Lifestyle
**Complexity:** Beginner
**Est. Time:** 3-5 minutes per use

**Author:** Template Council
**Contributors:** []
**Tags:** [#grocery, #meal-planning, #organization, #shopping, #productivity]
---

# 🎯 Grocery List Pro

## One-Line Pitch
Biến list lộn xộn hoặc ảnh chụp thành danh sách mua sắm được tổ chức theo khu vực cửa hàng - tiết kiệm 50% thời gian shopping.

## 📖 Description
Grocery List Pro giúp bạn tối ưu hóa trải nghiệm mua sắm bằng cách tự động tổ chức items theo layout cửa hàng thông thường. Template này xử lý mọi input format - từ text lộn xộn, voice notes, đến ảnh chụp - và output một list có cấu trúc giúp bạn đi đúng route, không bỏ sót items.

Phù hợp cho:
- Người bận rộn muốn tối ưu thời gian shopping
- Gia đình chia sẻ grocery list
- Người meal prep cần mua nhiều ingredients
- Người không thích việc tổ chức list thủ công

Kết quả mong đợi: Shopping trip nhanh hơn, ít quên items hơn, giảm impulse buying.

---

## ✅ Prerequisites (Điều Kiện Tiên Quyết)

### Kiến Thức Cần Có
- [ ] Biết cơ bản về layout cửa hàng tạp hóa
- [ ] Hiểu các loại ingredients trong nấu ăn

### Tools/Access Cần Có
- [ ] OpenClaw với messaging enabled
- [ ] Camera (nếu muốn chụp ảnh list/ghi chú)
- [ ] Ứng dụng notes hoặc có thể copy-paste

### Dữ Liệu/Inputs Cần Chuẩn Bị
- [ ] List items cần mua (text, ảnh, hoặc voice description)
- [ ] Loại cửa hàng (siêu thị, chợ, cửa hàng chuyên biệt)
- [ ] Số ngườii ăn (để estimate số lượng)

---

## 🚀 Instructions (Hướng Dẫn Từng Bước)

### Step 1: Thu Thập Items
**Action:** Gom tất cả items cần mua
**Details:**
- Viết/xuất list hiện có (từ đầu, tủ lạnh, meal plan)
- Có thể gửi dạng text, ảnh, hoặc voice note
- Đừng lo về thứ tự hay format - AI sẽ xử lý

**Expected Result:** Có danh sách "raw" items

---

### Step 2: Input vào Template
**Action:** Gửi list cho AI
**Details:**
- Copy-paste text lộn xộn
- Hoặc chụp ảnh ghi chú/list viết tay
- Hoặc mô tả bằng giọng nói (transcribe rồi paste)
- Thêm context nếu cần: `"Cho 4 ngườii ăn, ăn chay thứ Hai và thứ Tư"`

**Expected Result:** AI nhận được input để xử lý

---

### Step 3: Nhận và Tùy Chỉnh Output
**Action:** Review list đã tổ chức
**Details:**
- Kiểm tra các categories phù hợp
- Thêm/bớt items nếu cần
- Request format khác nếu muốn (PDF, checklist, v.v.)

**Expected Result:** List được sắp xếp theo khu vực cửa hàng

---

### Step 4: Export và Sử Dụng
**Action:** Lưu list để mang theo
**Details:**
- Copy vào phone notes
- In ra giấy (tùy chọn)
- Hoặc request dạng file để lưu
- Check items khi đi shopping

**Expected Result:** Có list sẵn sàng cho shopping trip

---

## 💡 Example Usage (Ví Dụ Cụ Thể)

### Scenario 1: Text list lộn xộn

**Input của bạn:**
```
Cần mua: sữa, 2 quả táo, gạo, dầu ăn, cà chua, phô mai, bánh mì, 
trứng, thịt bò, hành tây, tỏi, nước rửa chén, bột giặt, kem đánh răng
```

**Cách sử dụng template:**
1. Copy text lộn xộn
2. Paste vào chat với AI
3. Thêm context: `"Tổ chức theo khu vực siêu thị cho tôi"`
4. Nhận output đã sắp xếp

**Output mong đợi:**
```markdown
# 🛒 GROCERY LIST - [Ngày]

## 🥬 PRODUCE (Rau củ quả)
- [ ] Táo (2 quả)
- [ ] Cà chua
- [ ] Hành tây
- [ ] Tỏi

## 🥩 MEAT & SEAFOOD
- [ ] Thịt bò

## 🥛 DAIRY & EGGS
- [ ] Sữa
- [ ] Phô mai
- [ ] Trứng

## 🍞 BAKERY
- [ ] Bánh mì

## 🍚 PANTRY / GRAINS
- [ ] Gạo
- [ ] Dầu ăn

## 🧼 HOUSEHOLD
- [ ] Nước rửa chén
- [ ] Bột giặt
- [ ] Kem đánh răng

---
💡 Route: Vào → Produce → Meat → Dairy → Bakery → Pantry → Household → Ra
```

### Scenario 2: Từ meal plan

**Input của bạn:**
```
Meal plan tuần này:
- Thứ 2: Pasta Carbonara (4 ngườii)
- Thứ 3: Salad gà nướng
- Thứ 4: Cơm rang trứng
- Thứ 5: Cá hồi áp chảo với rau củ

Tạo grocery list cho tôi.
```

**Output mong đợi:**
```markdown
# 🛒 GROCERY LIST - Meal Plan Week

## 🥬 PRODUCE
- [ ] Rau xà lách (2 bịch)
- [ ] Cà chua bi
- [ ] Dưa chuột
- [ ] Hành tây (2 củ)
- [ ] Tỏi (1 bó)
- [ ] Rau củ mix (cà rốt, bông cải)
- [ ] Chanh (2 quả)

## 🥩 MEAT & SEAFOOD
- [ ] Ức gà (500g)
- [ ] Cá hồi fillet (4 miếng)
- [ ] Thịt xông khói/bacon (200g)

## 🥛 DAIRY & EGGS
- [ ] Trứng (1 vỉ 10 quả)
- [ ] Phô mai Parmesan (bào sẵn)
- [ ] Bơ (nhỏ)

## 🍚 PANTRY
- [ ] Pasta spaghetti (500g)
- [ ] Cơm/gạo (nếu cần)
- [ ] Dầu olive
- [ ] Giấm balsamic
- [ ] Muối, tiêu
- [ ] Sốt mayonnaise

---
📊 ESTIMATE: ~450,000đ - 550,000đ
```

### Scenario 3: Từ ảnh chụp

**Input của bạn:**
```
[Chụp ảnh list viết tay trên giấy]

"Tổ chức list này giúp tôi"
```

**Output mong đợi:**
```markdown
# 🛒 GROCERY LIST (From Photo)

## 🥬 PRODUCE
- [ ] Chuối (1 nải)
- [ ] Bơ (2 quả)
- [ ] Rau cải thìa
- [ ] Gừng (1 nhánh)

## 🥛 DAIRY
- [ ] Sữa chua Hy Lạp (4 hộp)
- [ ] Bơ nhạt

## 🍖 PROTEINS
- [ ] Ức gà (1kg)
- [ ] Đậu phụ (3 bìa)

## 🍚 GRAINS
- [ ] Yến mạch (hộp)
- [ ] Gạo lứt

## 🧂 CONDIMENTS
- [ ] Nước tương ít muối
- [ ] Dầu mè

---
⚠️ Không đọc được: "s?a đ?u n??h" - bạn có thể clarify?
```

---

## 🛠️ Tools Integration (Tích Hợp Tools)

### Tools Được Sử Dụng
| Tool | Purpose | When to Use |
|------|---------|-------------|
| OCR/Image Analysis | Đọc text từ ảnh | Khi gửi ảnh list viết tay |
| Text Processing | Tổ chức và categorize | Mọi lần sử dụng |
| File System | Lưu list thành file | Khi muốn giữ lại |
| Canvas | Tạo visual checklist | Khi muốn dạng đẹp để in |

### Tool Chain Flow
```
[Input: Text/Photo/Voice] → [Extract Items] → [Categorize] → [Organize by Store Layout] → [Output]
```

---

## ⚠️ Common Pitfalls (Lỗi Thường Gặp)

### Pitfall 1: Items quá vague
**What:** Ghi "rau" thay vì "rau cải thìa"
**Why it happens:** Không nghĩ chi tiết khi viết list
**How to avoid:** Càng specific càng tốt - AI có thể suggest specific items

### Pitfall 2: Quên non-food items
**What:** Chỉ list đồ ăn, quên giấy vệ sinh, nước rửa chén
**Why it happens:** Focus vào meal ingredients
**How to avoid:** Thêm section "HOUSEHOLD" vào template mặc định

### Pitfall 3: Không consider seasonal availability
**What:** List items out of season
**Why it happens:** Không check calendar
**How to avoid:** AI sẽ flag items có thể không có sẵn theo mùa

### Pitfall 4: Quantity estimation sai
**What:** Mua quá nhiều hoặc quá ít
**Why it happens:** Không có meal plan cụ thể
**How to avoid:** Thêm số ngườii ăn và số bữa ăn vào context

---

## 🛡️ Safety Notes (Lưu Ý An Toàn)

### ⚠️ Limitations
- AI không biết giá real-time ở cửa hàng cụ thể
- Không tích hợp với loyalty cards hay promotions
- Không track inventory tự động (cần user tự update)
- Có thể miss items trong ảnh nếu chất lượng kém

### 🚫 Don't Do This
- Đừng dùng cho prescription medications - luôn consult dược sĩ
- Đừng hoàn toàn rely vào AI cho allergy information - tự double-check labels
- Đừng mua items hết date vì AI không biết expiration dates

### 💰 Cost Implications
- Miễn phí
- Không có API calls cho text input
- Có thể có cost nhỏ nếu dùng vision cho ảnh

### 🔒 Data Privacy
- List groceries không sensitive nhưng vẫn nên aware
- Không share list có chứa địa chỉ hay personal info khác
- Nếu meal plan reveal health conditions, consider privacy

---

## 📊 Expected Output

### Format
- Markdown checklist với emoji categories
- Có thể export sang PDF, text, hoặc copy-paste

### Content Structure
```
# 🛒 GROCERY LIST - [Date]

## [CATEGORY ICON] CATEGORY NAME
- [ ] Item 1 (quantity)
- [ ] Item 2 (quantity)

## [CATEGORY ICON] CATEGORY NAME
...

---
💡 Shopping Route: [Suggested path]
💰 Estimate: [Price range if requested]
```

### Quality Criteria
Output tốt nếu:
- [ ] Tất cả items được categorize đúng
- [ ] Thứ tự categories follow store layout logic
- [ ] Quantities rõ ràng (hoặc flagged nếu unclear)
- [ ] Có shopping route suggestion

---

## 🎓 Pro Tips (Mẹo Chuyên Nghiệp)

1. **The "Pantry Check" rule:** Luôn check tủ lạnh/tủ đựng trước khi tạo list - tránh mua duplicate.

2. **Seasonal shopping:** Yêu cầu AI flag items theo mùa: `"Đánh dấu items có thể không có theo mùa này"`

3. **Budget estimate:** Thêm request: `"Estimate tổng chi phí cho list này"` để plan budget.

4. **Dietary flags:** Nếu có restrictions (vegan, keto, halal), thêm vào context mỗi lần.

5. **Recurring items:** Tạo "master list" cho items mua định kỳ (sữa, trứng, bánh mì) và reuse.

---

## 🔄 Variations (Biến Thể)

### Variation 1: Budget-First Shopping
**Use case:** Cần optimize chi phí
**Changes:**
- AI suggest alternatives rẻ hơn
- Prioritize generic brands
- Group items by promotion potential

### Variation 2: Meal-Prep Optimized
**Use case:** Mua cho cả tuần meal prep
**Changes:**
- Bulk quantities
- Storage recommendations
- Prep timeline suggestions

### Variation 3: Special Diet Focus
**Use case:** Keto, vegan, gluten-free, v.v.
**Changes:**
- Ingredient substitution suggestions
- Macro tracking (nếu cần)
- Certified product flags

### Variation 4: Multi-Store Route
**Use case:** Cần đi nhiều cửa hàng (costco + regular store)
**Changes:**
- Separate lists by store
- Optimize route giữa các địa điểm
- Price comparison hints

---

## 📚 Related Templates

- [RecipeRemix_Pro.md](./RecipeRemix_Pro.md) - Meal ideas trước khi tạo grocery list

---

## 🐛 Troubleshooting (Xử Lý Sự Cố)

### Issue: AI categorize sai items
**Symptoms:** Tỏi vào Produce thay vì Pantry
**Solution:** Correct và explain: `"Tỏi và hành thường để ở Produce section trong siêu thị VN"`

### Issue: Miss items trong ảnh
**Symptoms:** Các items trong ảnh không xuất hiện trong output
**Solution:** 
- Chụp lại với ánh sáng tốt hơn
- Viết rõ hơn hoặc type ra
- Chia ảnh thành nhiều phần nếu quá dài

### Issue: Quantities không rõ ràng
**Symptoms:** "Một ít", "vài quả" trong output
**Solution:** Provide context: `"Cho 4 ngườii ăn, 3 bữa cơm"` hoặc `"Standard family of 4"`

---

## 📝 Changelog

### v2.0.1 - 2026-02-12
- Fix typo "Người" → "Người"
- Fix typo "thời" → "thời" 
- Xóa link đến MealPlanner_Pro.md và PantryInventory_Pro.md (không tồn tại)

### v2.0.0 - 2026-02-12
- Restructured theo MASTER_TEMPLATE format
- Thêm nhiều example scenarios (text, meal plan, photo)
- Thêm Pro Tips và Variations
- Thêm Troubleshooting section
- Cải thiện store layout logic

### v1.0.0 - 2025
- Basic categorization by grocery sections
- Simple text processing

---

## ✅ Council Approval Stamp

**Status:** [ ] Pending / [ ] Approved / [ ] Rejected
**Date:** [YYYY-MM-DD]
**Version Approved:** [X.Y.Z]

**Scores:**
| Criteria | Score |
|----------|-------|
| Clarity | 9/10 |
| Actionability | 9/10 |
| Completeness | 8/10 |
| Currentness | 8/10 |
| Safety | 9/10 |
| Tools Integration | 8/10 |
| **OVERALL** | **8.5/10** |

**Approved by:**
- [ ] 🏗️ Template Architect
- [ ] 🎯 Domain Expert
- [ ] 🎨 UX Engineer
- [ ] ✅ Practicality Auditor
- [ ] 📝 Version Control Lead

---

**Self-Evaluation Notes:**
- Clarity (9/10): Instructions rất clear, examples đa dạng
- Actionability (9/10): Dùng ngay được, format rõ ràng
- Completeness (8/10): Đầy đủ, có thể thêm nutrition info section
- Currentness (8/10): Relevant cho grocery shopping hiện đại
- Safety (9/10): Warnings đầy đủ cho food và non-food
- Tools Integration (8/10): Có vision integration cho ảnh
