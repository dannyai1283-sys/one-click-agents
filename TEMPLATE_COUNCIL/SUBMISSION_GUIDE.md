# 📋 Template Submission Guide

> Hướng dẫn chi tiết để submit template mới cho Template Council

---

## 🎯 Trước Khi Bắt Đầu

### Checklist Chuẩn Bị

- [ ] Đã đọc [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md)
- [ ] Đã đọc [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md)
- [ ] Template đã hoạt động trong thực tế (tested)
- [ ] Có ít nhất 1 ví dụ cụ thể (không placeholder)
- [ ] Self-assessment đạt ≥ 7.0/10

---

## 📝 Quy Trình Submit

### Step 1: Copy Template Chuẩn

```bash
cp TEMPLATE_COUNCIL/MASTER_TEMPLATE.md templates/YOUR_TEMPLATE_NAME.md
```

### Step 2: Điền Nội Dung

**Metadata Block** (bắt buộc):
```markdown
**Version**: 1.0.0
**Last Reviewed**: YYYY-MM-DD
**Council Approved**: ❌ (để false cho đến khi approve)
**Category**: [AI/Coding/Marketing/Finance/Productivity/Creative/Other]
**Complexity**: [Beginner/Intermediate/Advanced]
```

**Các Phần Bắt Buộc**:
1. 🎯 **Goal** - 1 câu mô tả rõ ràng
2. 📝 **Description** - 2-3 đoạn văn
3. ✅ **Prerequisites** - Yêu cầu để sử dụng
4. 🛠️ **Tools Required** - Bảng tools
5. 📋 **Step-by-Step Instructions** - Hướng dẫn chi tiết
6. 💡 **Example Usage** - Ví dụ thực tế (KHÔNG dùng placeholder)
7. ⚠️ **Common Pitfalls** - Lỗi thường gặp
8. 📤 **Expected Output** - Format output
9. 🛡️ **Safety Notes** - Warnings, limitations
10. 📝 **Changelog** - Lịch sử thay đổi

### Step 3: Self-Assessment

Chạy self-assessment:
```bash
python TEMPLATE_COUNCIL/council_review.py --evaluate templates/YOUR_TEMPLATE.md
```

**Target**: ≥ 7.0/10 trước khi submit

### Step 4: Tạo Submission Issue

Tạo file submission:

```markdown
# Template Submission: [Template Name]

## Metadata
- **Author**: [@your-username]
- **Category**: [Category]
- **Target Score**: 8.0+ (Grade A)

## Self-Assessment Results
| Criteria | Score |
|----------|-------|
| Clarity | X/10 |
| Actionability | X/10 |
| Completeness | X/10 |
| Currentness | X/10 |
| Safety | X/10 |
| Tools Integration | X/10 |
| **TOTAL** | **X.X/10** |

## Testing Evidence
- [ ] Đã test với [X] use cases
- [ ] Đã test trên [OS/Environment]
- [ ] Output đạt yêu cầu

## Checklist
- [ ] Follow MASTER_TEMPLATE format
- [ ] Có ví dụ cụ thể
- [ ] Có safety warnings (nếu cần)
- [ ] Không có placeholders
- [ ] Changelog được tạo

## Files Attached
- [Template file](link)
- [Test results](link) (nếu có)
```

---

## 🔍 Review Process Timeline

```
Day 0: Submit template
Day 1: Auto-evaluation run
Day 2-3: Peer Review (2-3 reviewers)
Day 4: Cross-Domain Check
Day 5-6: Practical Test (nếu cần)
Day 7: Final Decision
```

**Tổng thờigian**: 5-8 ngày làm việc

---

## 📊 Tiêu Chí Chấp Nhận

### Core Templates (templates/core/)
- **Minimum Score**: 8.0/10 (Grade A)
- **Requirements**: 
  - Hoàn thiện tất cả sections
  - 2+ ví dụ cụ thể
  - Comprehensive safety notes
  - Tested thực tế

### Community Templates (community_templates/)
- **Minimum Score**: 7.0/10 (Grade B)
- **Requirements**:
  - Đầy đủ core sections
  - 1+ ví dụ cụ thể
  - Basic safety notes

---

## 🔄 Các Trạng Thái Review

| Status | Ý Nghĩa | Hành Động Tiếp Theo |
|--------|---------|---------------------|
| 🟡 **Submitted** | Đã nhận, chờ review | Đợi auto-evaluation |
| 🔵 **In Review** | Đang được review | Có thể cần giải đáp |
| 🟠 **Changes Requested** | Cần sửa đổi | Sửa theo feedback |
| 🟢 **Approved** | Được chấp nhận | Sẽ merge |
| 🔴 **Rejected** | Không đạt | Xem lý do, có thể resubmit |

---

## 🛠️ Tips Để Đạt Grade A

### 1. Clarity (9-10 điểm)
- Goal trong 1 câu, không mơ hồ
- Description giải thích "tại sao cần template này"
- Không dùng jargon không giải thích

### 2. Actionability (9-10 điểm)
- Step-by-step thực sự (không chỉ list)
- Có thể copy-paste và chạy ngay
- Ví dụ cụ thể ("Bitcoin" thay vì "[Coin]")

### 3. Completeness (9-10 điểm)
- Prerequisites đầy đủ
- Expected output được mô tả
- Troubleshooting section

### 4. Currentness (9-10 điểm)
- Mention 2024-2025 trends
- API references mới nhất
- Best practices hiện tại

### 5. Safety (9-10 điểm)
- Warnings cho risky operations
- Limitations được document
- Legal disclaimers nếu cần

### 6. Tools Integration (9-10 điểm)
- Tools được chọn hợp lý
- Có fallback nếu tool fail
- Performance considerations

---

## ❌ Common Rejection Reasons

1. **Thiếu ví dụ cụ thể** - Placeholder `[topic]` chưa thay
2. **Không có safety warnings** - Đặc biệt financial/health templates
3. **Outdated information** - API cũ, practices lỗi thờI
4. **Không actionable** - Chỉ có lý thuyết, không có steps
5. **Copy từ nguồn khác** - Không original
6. **Thiếu metadata** - Không có version, author, v.v.

---

## 🆘 Cần Giúp Đỡ?

### Trước khi submit:
- Đọc [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md)
- Xem examples trong [IMPROVED/](./IMPROVED/)
- Chạy `council_review.py` để self-check

### Trong quá trình review:
- Tag reviewer nếu cần clarification
- Update template theo feedback
- Hỏi trong comments nếu không hiểu

### Sau khi approved:
- Cập nhật version lên 1.0.0
- Update `Council Approved: ✅`
- Theo dõi user feedback

---

## 📚 Resources

- [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) - Template chuẩn
- [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md) - Tiêu chí đánh giá
- [IMPROVED/](./IMPROVED/) - Examples Grade A
- [COUNCIL_MEMBERS.md](./COUNCIL_MEMBERS.md) - Biết reviewer là ai

---

**Happy Template Building! 🚀**
