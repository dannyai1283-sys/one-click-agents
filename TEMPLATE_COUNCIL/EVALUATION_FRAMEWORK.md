# 📊 Template Evaluation Framework

> *"Đo lường chất lượng một cách có hệ thống và khách quan"*

---

## 🎯 Scoring Rubric (1-10 Scale)

Mỗi tiêu chí được đánh giá từ 1-10, với mô tả chi tiết cho từng mức điểm.

---

## 1. 📖 CLARITY (Rõ Ràng)
*Template có dễ hiểu không? Ngườii dùng có biết phải làm gì không?*

| Score | Description |
|-------|-------------|
| 10 | Crystal clear - Không thể hiểu nhầm, perfect flow |
| 8-9 | Very clear - Có thể dùng ngay không cần giải thích thêm |
| 6-7 | Clear enough - Cần đọc kỹ, có thể có ambiguity nhỏ |
| 4-5 | Somewhat unclear | Cần giải thích, có confusion points |
| 2-3 | Unclear | Khó hiểu, cần major rewrite |
| 1 | Incomprehensible | Hoàn toàn không hiểu được |

**Checklist:**
- [ ] Title rõ ràng, descriptive
- [ ] Goal được nêu rõ trong 1 câu
- [ ] Instructions có numbered steps
- [ ] Không có jargon unexplained
- [ ] Examples giải thích rõ expected output

---

## 2. ⚡ ACTIONABILITY (Tính Thực Hiện Được)
*Có thể copy-paste và dùng ngay không? Có đủ context không?*

| Score | Description |
|-------|-------------|
| 10 | Production-ready - Copy, paste, run, get results |
| 8-9 | Actionable - Minor tweaks needed, mostly ready |
| 6-7 | Somewhat actionable | Cần bổ sung thông tin, nhưng core ổn |
| 4-5 | Theory-heavy | Nhiều concept, ít action items |
| 2-3 | Vague | Không biết bắt đầu từ đâu |
| 1 | Useless | Không thể thực hiện được |

**Checklist:**
- [ ] Có placeholder `[như thế này]` rõ ràng
- [ ] Có example input/output cụ thể
- [ ] Prerequisites được list đầy đủ
- [ ] Tools cần thiết được ghi rõ
- [ ] Expected result được mô tả

---

## 3. 📋 COMPLETENESS (Tính Đầy Đủ)
*Có đủ mọi thông tin cần thiết không? Có thiếu gì không?*

| Score | Description |
|-------|-------------|
| 10 | Comprehensive | Bao gồm mọi thứ cần thiết và edge cases |
| 8-9 | Complete | Đủ cho 90% use cases |
| 6-7 | Mostly complete | Có thể thiếu advanced scenarios |
| 4-5 | Incomplete | Thiếu key information |
| 2-3 | Major gaps | Nhiều thông tin quan trọng bị thiếu |
| 1 | Fragment | Chỉ là outline, chưa phải template |

**Checklist:**
- [ ] Metadata block đầy đủ
- [ ] Prerequisites được list
- [ ] Step-by-step instructions
- [ ] Example usage có sẵn
- [ ] Common pitfalls được đề cập
- [ ] Safety notes có nếu cần
- [ ] Tools/Resources được liệt kê

---

## 4. 🕐 CURRENTNESS (Tính Cập Nhật)
*Kiến thức có còn relevant trong 2024-2025 không? Có outdated không?*

| Score | Description |
|-------|-------------|
| 10 | Cutting-edge | Bao gồm latest trends và best practices 2025 |
| 8-9 | Current | Cập nhật đến 2024, vẫn relevant |
| 6-7 | Mostly current | Có thể có minor outdated info |
| 4-5 | Aging | Một số info outdated nhưng core vẫn ok |
| 2-3 | Outdated | Nhiều thông tin không còn đúng |
| 1 | Obsolete | Hoàn toàn không còn áp dụng được |

**Checklist:**
- [ ] Last reviewed date trong vòng 6 tháng
- [ ] References đến 2024-2025 standards
- [ ] Không có deprecated tools/methods
- [ ] Latest AI models được đề cập
- [ ] Current industry practices được follow

---

## 5. 🛡️ SAFETY (Tính An Toàn)
*Có warnings về risks? Có hướng dẫn safe usage không?*

| Score | Description |
|-------|-------------|
| 10 | Bulletproof | Warnings đầy đủ, safe-by-design |
| 8-9 | Safe | Có warnings cho major risks |
| 6-7 | Mostly safe | Có safety notes, có thể bổ sung |
| 4-5 | Some concerns | Thiếu warnings cho risky operations |
| 2-3 | Risky | Có thể gây harm nếu dùng sai |
| 1 | Dangerous | Template có inherent dangers không được warn |

**Checklist:**
- [ ] Limitations được ghi rõ
- [ ] Edge cases có warnings
- [ ] Không khuyến khích harmful activities
- [ ] Data privacy được đề cập nếu cần
- [ ] Cost implications được note (API calls, etc.)
- [ ] "Don't do this" scenarios được ghi

---

## 6. 🔧 TOOLS INTEGRATION (Tích Hợp Tools)
*Có khai thác tốt các tools của OpenClaw không? Có integration tốt không?*

| Score | Description |
|-------|-------------|
| 10 | Masterful | Dùng tools một cách creative và effective |
| 8-9 | Good | Sử dụng đúng tools cho đúng mục đích |
| 6-7 | Adequate | Có dùng tools nhưng chưa tối ưu |
| 4-5 | Basic | Chỉ dùng text, không tận dụng tools |
| 2-3 | Poor | Tools được dùng sai hoặc không cần thiết |
| 1 | None | Không có integration |

**Checklist:**
- [ ] Web search được dùng khi cần current info
- [ ] Browser automation phù hợp
- [ ] File operations được sử dụng đúng
- [ ] Canvas được dùng cho visual tasks
- [ ] Sub-agents được spawn cho complex tasks
- [ ] Tools chain hợp lý, không redundant

---

## 📈 Overall Score Calculation

```
Total Score = (Clarity + Actionability + Completeness + Currentness + Safety + Tools) / 6

Grade Scale:
- 9.0-10: 🏆 EXCEPTIONAL (Must-have template)
- 8.0-8.9: ✅ EXCELLENT (Production ready)
- 7.0-7.9: ⚠️ GOOD (Approved with minor fixes)
- 6.0-6.9: 🔄 NEEDS WORK (Major revision required)
- Below 6: ❌ REJECTED (Back to drawing board)
```

---

## 🎯 Minimum Passing Criteria

Template chỉ được approve nếu:
- [ ] **Overall Score ≥ 7.0**
- [ ] **Clarity ≥ 6**
- [ ] **Actionability ≥ 6**
- [ ] **Safety ≥ 7** (không thể compromise về safety)
- [ ] **Currentness ≥ 6** (outdated info phải update)

---

## 📝 Evaluation Template

```markdown
## Template Evaluation Report

**Template:** [Name]
**Evaluator:** [Council Member]
**Date:** [YYYY-MM-DD]

### Scores
| Criteria | Score | Notes |
|----------|-------|-------|
| Clarity | /10 | |
| Actionability | /10 | |
| Completeness | /10 | |
| Currentness | /10 | |
| Safety | /10 | |
| Tools Integration | /10 | |
| **OVERALL** | **/10** | |

### Strengths
- 

### Areas for Improvement
- 

### Required Actions
- [ ] 

### Verdict
- [ ] Approve
- [ ] Approve with changes
- [ ] Needs major revision
- [ ] Reject
```

---

## 📚 Related Documents
- [COUNCIL_MEMBERS.md](./COUNCIL_MEMBERS.md) - Thành viên hội đồng
- [REVIEW_WORKFLOW.md](./REVIEW_WORKFLOW.md) - Quy trình review
- [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) - Template chuẩn
