# ✅ Quick Evaluation Checklist

> Checklist nhanh để self-assess template trước khi submit

## 🎯 30-Second Check

Template của bạn có:
- [ ] **Goal rõ ràng** trong 1 câu?
- [ ] **Ví dụ cụ thể** (không phải `[placeholder]`)?
- [ ] **Step-by-step** instructions?
- [ ] **Safety warnings** (nếu template có risk)?

**Pass**: ≥ 4 checkboxes → Đủ điều kiện submit  
**Fail**: < 4 checkboxes → Cần improve trước

---

## 📋 Detailed Checklist (6 Criteria)

### 1. Clarity (Rõ ràng)
- [ ] Goal được stated trong 1 câu rõ ràng
- [ ] Description giải thích value proposition
- [ ] Không có jargon không giải thích
- [ ] Ngườimới hiểu được ngay lần đọc đầu

**Score**: ___/10

---

### 2. Actionability (Thực hành được)
- [ ] Có thể dùng ngay sau khi đọc
- [ ] Step-by-step instructions rõ ràng
- [ ] Có ít nhất 1 ví dụ cụ thể (không placeholder)
- [ ] Biết rõ "bước tiếp theo là gì"
- [ ] Có suggested prompt/template

**Score**: ___/10

---

### 3. Completeness (Đầy đủ)
- [ ] Prerequisites được liệt kê
- [ ] Tools required được specify
- [ ] Expected output được mô tả
- [ ] Common pitfalls được identify
- [ ] Có troubleshooting guide

**Score**: ___/10

---

### 4. Currentness (Cập nhật)
- [ ] Kiến thức 2024-2025
- [ ] Không có references outdated
- [ ] API endpoints còn valid
- [ ] Best practices hiện tại

**Score**: ___/10

---

### 5. Safety (An toàn)
- [ ] Limitations được document
- [ ] Risks được identify (nếu có)
- [ ] Warnings cho dangerous operations
- [ ] Privacy/security considerations (nếu cần)
- [ ] Rate limits/API costs được mention (nếu cần)

**Score**: ___/10

---

### 6. Tools Integration
- [ ] Tools được sử dụng phù hợp
- [ ] Tool combinations hiệu quả
- [ ] Có error handling cho tool failures
- [ ] Fallback strategies

**Score**: ___/10

---

## 🧮 Tính Điểm

```
Weighted Total = (
    Clarity × 1.0 +
    Actionability × 1.2 +
    Completeness × 1.0 +
    Currentness × 0.9 +
    Safety × 1.1 +
    Tools × 0.8
) / 6.0
```

**Total Score**: ___/10

**Grade**: ___

---

## 🏆 Quality Gates

### Gate 1: Minimum Viable (≥ 5.0)
- [ ] Goal rõ ràng
- [ ] Có instructions
- [ ] Không có lỗi rõ ràng

→ Có thể dùng cho personal use

### Gate 2: Community Ready (≥ 7.0)
- [ ] Đầy đủ 6 criteria
- [ ] Có ví dụ cụ thể
- [ ] Có safety notes

→ Đủ điều kiện cho community_templates/

### Gate 3: Core Quality (≥ 8.0)
- [ ] Xuất sắc tất cả criteria
- [ ] 2+ ví dụ chi tiết
- [ ] Comprehensive safety
- [ ] Production-ready

→ Đủ điều kiện cho templates/core/

---

## 🔍 Red Flags Check

Template có dấu hiệu này không?
- [ ] Placeholders chưa thay (`[topic]`, `[insert]`)
- [ ] References năm 2020-2022
- [ ] API deprecated
- [ ] Không có examples
- [ ] Copy từ nguồn khác không credit

**Nếu check bất kỳ box nào**: Fix trước khi submit!

---

## 🚀 Pre-Submit Final Check

- [ ] Đã chạy `council_review.py --evaluate`
- [ ] Score đạt target (7.0+ community, 8.0+ core)
- [ ] Không có red flags
- [ ] Đọc lại 1 lần từ đầu đến cuối
- [ ] Test thực tế 1 lần

**Ready to submit!** 🎉
