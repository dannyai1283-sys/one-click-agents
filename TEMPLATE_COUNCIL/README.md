# 🏛️ Template Review Council - INDEX

> Hệ thống đánh giá và cải tiến templates chuyên nghiệp cho One-Click Agents

---

## 📁 Directory Structure

```
TEMPLATE_COUNCIL/
├── README.md                           # File này
├── COUNCIL_MEMBERS.md                  # Thông tin 5 chuyên gia hội đồng
├── EVALUATION_FRAMEWORK.md             # Rubric đánh giá 6 tiêu chí
├── REVIEW_WORKFLOW.md                  # Quy trình review 5 bước
├── MASTER_TEMPLATE.md                  # Template chuẩn mẫu
├── council_review.py                   # Công cụ tự động đánh giá
└── IMPROVED/                           # Templates đã cải tiến
    ├── CryptoSentinel_Pro.md          # 🏆 9.3/10 - Finance
    ├── PMBOKMaster_Pro.md             # 🏆 9.2/10 - Project Management
    └── ViralShorts_Pro.md             # 🏆 9.3/10 - Social Media
```

---

## 🚀 Quick Start

### 1. Hiểu về Council
Đọc [COUNCIL_MEMBERS.md](./COUNCIL_MEMBERS.md) để biết:
- 5 chuyên gia trong hội đồng
- Vai trò và trách nhiệm của mỗi ngườii
- Quy trình đánh giá và phê duyệt

### 2. Sử dụng Framework
Xem [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md) để biết:
- 6 tiêu chí đánh giá (Clarity, Actionability, Completeness, Currentness, Safety, Tools Integration)
- Thang điểm 1-10 cho mỗi tiêu chí
- Minimum passing criteria

### 3. Theo dõi Workflow
Tham khảo [REVIEW_WORKFLOW.md](./REVIEW_WORKFLOW.md) để biết:
- 5 bước review chi tiết
- Templates cho từng bước
- Timeline và deliverables

### 4. Tạo Template mới
Sử dụng [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) làm foundation:
- Copy và customize
- Đảm bảo đủ tất cả sections
- Add approval stamp khi hoàn thành

### 5. Chạy Automated Review

```bash
# Review 1 template
cd /Volumes/M2Sata/DannyAI/one-click-agents
python TEMPLATE_COUNCIL/council_review.py templates/core/PMBOKMaster.md

# Review tất cả templates
python TEMPLATE_COUNCIL/council_review.py --all --report

# Xem report
open TEMPLATE_COUNCIL/review_report.md
```

---

## 📊 Điểm số Templates đã cải tiến

| Template | Overall | Clarity | Actionability | Completeness | Currentness | Safety | Tools |
|----------|---------|---------|---------------|--------------|-------------|--------|-------|
| CryptoSentinel Pro | **9.3** | 9 | 9 | 10 | 10 | 10 | 8 |
| PMBOKMaster Pro | **9.2** | 9 | 9 | 10 | 10 | 9 | 8 |
| ViralShorts Pro | **9.3** | 10 | 9 | 10 | 10 | 9 | 8 |

---

## 🎯 Minimum Passing Criteria

Template được approve nếu:
- [ ] **Overall Score ≥ 7.0**
- [ ] **Clarity ≥ 6**
- [ ] **Actionability ≥ 6**
- [ ] **Safety ≥ 7** (không thể compromise)
- [ ] **Currentness ≥ 6**

---

## 🔄 Quy trình đánh giá templates hiện có

```
1. Chọn template từ /templates/
2. Copy vào IMPROVED/ với tên mới (v2.0.0)
3. Áp dụng MASTER_TEMPLATE.md format
4. Tự đánh giá theo EVALUATION_FRAMEWORK
5. Chạy council_review.py để kiểm tra
6. Nếu score >= 7.0: Stamp approval
7. Nếu score < 7.0: Revise và đánh giá lại
```

---

## 📚 Tài liệu liên quan

- [COUNCIL_MEMBERS.md](./COUNCIL_MEMBERS.md) - Thành viên hội đồng
- [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md) - Framework đánh giá
- [REVIEW_WORKFLOW.md](./REVIEW_WORKFLOW.md) - Quy trình review
- [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) - Template chuẩn

---

## 🏆 Thành tựu

- ✅ **3 templates** đã được cải tiến và council-approved
- ✅ **Trung bình điểm: 9.3/10** - Xuất sắc
- ✅ **Tất cả templates** đều đạt safety criteria
- ✅ **100% actionable** - Có thể dùng ngay

---

## 📝 Changelog

### 2025-02-12 - Initial Release
- Tạo hệ thống Council với 5 chuyên gia
- Phát triển EVALUATION_FRAMEWORK 6 tiêu chí
- Cải tiến 3 templates core lên chuẩn production
- Tạo công cụ tự động council_review.py

---

**Council Version:** 1.0.0  
**Last Updated:** 2025-02-12  
**Approved by:** 🏗️🎯🎨✅📝
