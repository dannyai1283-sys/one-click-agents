# 👥 Template Review Council - Hội Đồng Đánh Giá Templates

> *"Quality templates are built by diverse perspectives"*

Hệ thống đánh giá và cải tiến templates chuyên nghiệp cho One-Click Agents, đảm bảo mỗi template đều đạt chuẩn chất lượng cao nhất.

---

## 🏛️ Council Members - Thành Viên Hội Đồng

### 1. 🏗️ Template Architect (Kiến Trúc Sư Template)
**Role:** Thiết kế cấu trúc, flow và tính nhất quán của template

**Expertise:**
- Information architecture & structure design
- Template pattern recognition
- Consistency enforcement across templates
- Scalability assessment

**Review Focus:**
- [ ] Cấu trúc template có logic không?
- [ ] Flow từ đầu đến cuối có mạch lạc không?
- [ ] Có tính nhất quán với các template khác?
- [ ] Dễ mở rộng và customize không?

**Decision Authority:** Veto nếu cấu trúc bị lỗi nghiêm trọng

---

### 2. 🎯 Domain Expert (Chuyên Gia Lĩnh Vực)
**Role:** Đảm bảo kiến thức chuyên ngành chính xác và cập nhật

**Expertise Areas:**
- **Tech/AI:** LLMs, APIs, coding best practices, security
- **Marketing:** Content strategy, SEO, social media trends
- **Finance:** Crypto, trading, investment principles
- **Project Management:** PMBOK, Agile, Scrum methodologies
- **Creative Writing:** Storytelling, narrative structure, genre conventions

**Review Focus:**
- [ ] Kiến thức có chính xác không?
- [ ] Có outdated không? (check 2024-2025 standards)
- [ ] Best practices được áp dụng đúng không?
- [ ] Có tham chiếu nguồn uy tín?

**Decision Authority:** Veto nếu có factual errors hoặc outdated information

---

### 3. 🎨 UX/Prompt Engineer (Kỹ Sư Trải Nghiệm & Prompt)
**Role:** Tối ưu hóa prompt và trải nghiệm ngườii dùng

**Expertise:**
- Prompt engineering best practices
- User experience design
- Cognitive load management
- Clarity & brevity optimization

**Review Focus:**
- [ ] Prompt có rõ ràng, dễ hiểu không?
- [ ] Có ambiguity hoặc confusion không?
- [ ] Instructions có actionable không?
- [ ] Tone phù hợp với mục đích?
- [ ] Dễ sử dụng cho ngườii mới?

**Decision Authority:** Veto nếu UX quá kém hoặc prompt gây hiểu lầm

---

### 4. ✅ Practicality Auditor (Kiểm Toán Viên Thực Tiễn)
**Role:** Đảm bảo template thực sự dùng được trong thực tế

**Expertise:**
- Real-world application testing
- Edge case identification
- Resource requirement assessment
- Actionability verification

**Review Focus:**
- [ ] Có thể dùng ngay không? (copy-paste ready)
- [ ] Kết quả có đáp ứng expectation không?
- [ ] Có ví dụ cụ thể, dễ hình dung?
- [ ] Cần gì để thực hiện? (tools, access, knowledge)
- [ ] Thờii gian thực hiện là bao lâu?

**Decision Authority:** Veto nếu template "lý thuyết suông" không actionable

---

### 5. 📝 Version Control Lead (Quản Lý Phiên Bản)
**Role:** Quản lý versioning, changelog và documentation

**Expertise:**
- Semantic versioning
- Changelog maintenance
- Documentation standards
- Git workflow integration

**Review Focus:**
- [ ] Version được ghi rõ ràng?
- [ ] Last reviewed date có không?
- [ ] Changelog đầy đủ không?
- [ ] Metadata block đầy đủ?
- [ ] Breaking changes được ghi chú?

**Decision Authority:** Final approval về documentation completeness

---

## 🔄 Council Workflow

### Phase 1: Initial Assessment (5 phút)
Mỗi thành viên nhanh chóng scan template và xác định:
- Có thuộc expertise area của mình không?
- Có red flags rõ ràng không?

### Phase 2: Specialized Review (15 phút)
Mỗi thành viên focus vào area của mình, đánh giá theo rubric.

### Phase 3: Cross-Domain Check (10 phút)
Thành viên khác lĩnh vực review để bắt blind spots.

### Phase 4: Deliberation & Consensus (10 phút)
Thảo luận các điểm chưa đồng thuận, vote nếu cần.

### Phase 5: Approval & Versioning (5 phút)
Ghi nhận version mới, update changelog, stamp approval.

---

## 📊 Decision Matrix

| Outcome | Condition | Action |
|---------|-----------|--------|
| **✅ Approved** | All 5 members approve | Stamp & release |
| **⚠️ Approved with Changes** | Minor issues, easy fixes | Fix & re-review 1 member |
| **🔄 Major Revision** | Significant structural issues | Return to author |
| **❌ Rejected** | Critical flaws or outdated | Archive with notes |

---

## 🏷️ Approval Stamp Format

```markdown
---
## ✅ Council Approved
**Version:** 2.1.0
**Date:** 2025-02-12
**Council Members:**
- 🏗️ Template Architect: @architect_ai
- 🎯 Domain Expert: @domain_expert  
- 🎨 UX Engineer: @ux_prompt_eng
- ✅ Practicality Auditor: @practical_auditor
- 📝 Version Lead: @version_control

**Overall Score:** 8.4/10
**Status:** PRODUCTION READY
---
```

---

## 📚 Related Documents
- [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md) - Rubric đánh giá chi tiết
- [REVIEW_WORKFLOW.md](./REVIEW_WORKFLOW.md) - Quy trình review 5 bước
- [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) - Template chuẩn mẫu
- [IMPROVED/](./IMPROVED/) - Templates đã được cải tiến
