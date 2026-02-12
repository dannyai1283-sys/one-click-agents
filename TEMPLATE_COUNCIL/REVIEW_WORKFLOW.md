# 🔄 Template Review Workflow

> *"Quality through systematic review"*

Quy trình 5 bước để đánh giá và cải tiến templates một cách chuyên nghiệp.

---

## Overview

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  1. Self-       │───>│  2. Peer        │───>│  3. Cross-      │
│  Assessment     │    │  Review         │    │  Domain Check   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
   Initial sanity          Specialized          Fresh perspective
   check by author         review by            from different
                           council              domain
                           member

┌─────────────────┐    ┌─────────────────┐
│  4. Practical   │───>│  5. Final       │
│  Test           │    │  Approval       │
└─────────────────┘    └─────────────────┘
         │                       │
         ▼                       ▼
   Real-world              Version stamp
   validation              & release
```

---

## Step 1: Self-Assessment (10 phút)
**Who:** Template Author
**Purpose:** Sanity check trước khi đưa vào review

### Checklist
- [ ] Đọc lại toàn bộ template
- [ ] Chạy thử với example input
- [ ] Kiểm tra format và typos
- [ ] Đảm bảo đúng MASTER_TEMPLATE.md format
- [ ] Self-score theo EVALUATION_FRAMEWORK

### Output
File: `SELF_ASSESSMENT.md` trong cùng thư mục template

```markdown
# Self-Assessment

**Template:** [Name]
**Author:** [Name]
**Date:** [YYYY-MM-DD]

## Self-Score
| Criteria | Score |
|----------|-------|
| Clarity | /10 |
| Actionability | /10 |
| Completeness | /10 |
| Currentness | /10 |
| Safety | /10 |
| Tools Integration | /10 |
| **Overall** | **/10** |

## Known Issues
- 

## Areas Needing Review
- 

## Ready for Council Review?
- [ ] Yes
- [ ] No - cần fix issues trước
```

---

## Step 2: Peer Review (20 phút)
**Who:** Council Member phù hợp nhất với domain
**Purpose:** Chuyên gia review deep dive

### Process
1. **Read & Understand** (5 phút)
   - Đọc template 2 lần
   - Hiểu use case và target audience
   - Note initial impressions

2. **Evaluate** (10 phút)
   - Đánh giá theo EVALUATION_FRAMEWORK
   - Check domain-specific accuracy
   - Test logic flow

3. **Document** (5 phút)
   - Viết detailed feedback
   - Suggest specific improvements
   - Score và justify

### Output
File: `PEER_REVIEW_[MEMBER].md`

```markdown
# Peer Review

**Template:** [Name]
**Reviewer:** [Council Member Role]
**Date:** [YYYY-MM-DD]
**Time Spent:** [X] minutes

## Evaluation Scores
| Criteria | Score | Justification |
|----------|-------|---------------|
| Clarity | /10 | |
| Actionability | /10 | |
| Completeness | /10 | |
| Currentness | /10 | |
| Safety | /10 | |
| Tools Integration | /10 | |
| **OVERALL** | **/10** | |

## Detailed Feedback

### Strengths
1. 
2. 

### Issues Found
1. **Issue:** [Description]
   - **Severity:** High/Medium/Low
   - **Suggestion:** [Fix]

### Improvement Suggestions
1. 
2. 

### Domain-Specific Notes
- 

## Verdict
- [ ] ✅ Approve as-is
- [ ] ⚠️ Approve with minor changes
- [ ] 🔄 Needs major revision
- [ ] ❌ Reject

## Required Changes (if any)
- [ ] 
```

---

## Step 3: Cross-Domain Check (15 phút)
**Who:** Council Member từ domain khác
**Purpose:** Bắt blind spots, đảm bảo clarity cho non-experts

### Process
1. **Fresh Eyes Review** (10 phút)
   - Đọc template như ngườii dùng mới
   - Không dùng domain knowledge
   - Note những chỗ không hiểu

2. **Clarity Test** (5 phút)
   - Có thể follow instructions không?
   - Jargon có được explain không?
   - Examples có rõ ràng không?

### Output
File: `CROSS_DOMAIN_CHECK.md`

```markdown
# Cross-Domain Check

**Template:** [Name]
**Reviewer:** [Council Member - Different Domain]
**Date:** [YYYY-MM-DD]

## Clarity from Non-Expert Perspective

### Parts I Understood Immediately
- 

### Parts That Confused Me
- 

### Unexplained Jargon/Terms
1. 

### Suggestions for Better Accessibility
- 

## Overall Accessibility Score
/10

## Can a non-expert use this?
- [ ] Yes, easily
- [ ] Yes, with some effort
- [ ] Difficult without domain knowledge
- [ ] Impossible without expertise
```

---

## Step 4: Practical Test (20 phút)
**Who:** Practicality Auditor hoặc bất kỳ council member
**Purpose:** Đảm bảo template thực sự work trong thực tế

### Process
1. **Setup** (5 phút)
   - Chuẩn bị prerequisites
   - Đảm bảo tools sẵn sàng

2. **Execute** (10 phút)
   - Chạy template với real inputs
   - Document kết quả
   - Note bất kỳ blockers nào

3. **Evaluate Results** (5 phút)
   - Output có đáp ứng expectation?
   - Có unexpected issues?
   - Thờii gian thực hiện?

### Output
File: `PRACTICAL_TEST.md`

```markdown
# Practical Test Report

**Template:** [Name]
**Tester:** [Name]
**Date:** [YYYY-MM-DD]
**Test Environment:** [OS, Tools versions]

## Prerequisites Check
- [ ] All prerequisites available
- [ ] Tools installed and working
- [ ] Access permissions verified

## Test Execution

### Test Case 1: [Description]
**Input:**
```
[Paste input]
```

**Execution Time:** [X] minutes

**Output:**
```
[Paste output]
```

**Result:**
- [ ] As expected
- [ ] Better than expected
- [ ] Worse than expected
- [ ] Failed

**Notes:**

### Issues Encountered
1. 

## Actionability Assessment
- [ ] Copy-paste ready
- [ ] Minor tweaks needed
- [ ] Significant setup required
- [ ] Doesn't work as documented

## Overall Practicality Score
/10

## Blockers (if any)
- 
```

---

## Step 5: Final Approval & Versioning (10 phút)
**Who:** Version Control Lead + Consensus của cả Council
**Purpose:** Final sign-off và documentation

### Process
1. **Review All Feedback** (5 phút)
   - Tổng hợp các reviews
   - Xác định changes cần thiết
   - Vote nếu có disagreement

2. **Update Template** (nếu cần)
   - Apply required changes
   - Update version number
   - Add changelog entry

3. **Stamp Approval** (5 phút)
   - Add approval block
   - Update metadata
   - Archive review files

### Output
Updated template với approval stamp + `APPROVAL_RECORD.md`

```markdown
# Approval Record

**Template:** [Name]
**Final Version:** [X.Y.Z]
**Approval Date:** [YYYY-MM-DD]

## Council Decision
- [ ] ✅ Approved for production
- [ ] ⚠️ Approved with noted limitations
- [ ] 🔄 Deferred for future revision
- [ ] ❌ Rejected

## Vote Count
| Member | Vote | Notes |
|--------|------|-------|
| 🏗️ Template Architect | Approve/Reject/Abstain | |
| 🎯 Domain Expert | Approve/Reject/Abstain | |
| 🎨 UX Engineer | Approve/Reject/Abstain | |
| ✅ Practicality Auditor | Approve/Reject/Abstain | |
| 📝 Version Lead | Approve/Reject/Abstain | |

**Consensus:** [X]/5 approve

## Final Scores
| Criteria | Score |
|----------|-------|
| Clarity | /10 |
| Actionability | /10 |
| Completeness | /10 |
| Currentness | /10 |
| Safety | /10 |
| Tools Integration | /10 |
| **OVERALL** | **/10** |

## Changes Made Post-Review
1. 

## Known Limitations
- 

## Next Review Date
[YYYY-MM-DD] (recommended: 6 months)

## Approval Stamp
```
✅ COUNCIL APPROVED - [Version] - [Date]
```

---

**Approved by:**
- [ ] 🏗️ Template Architect
- [ ] 🎯 Domain Expert
- [ ] 🎨 UX Engineer
- [ ] ✅ Practicality Auditor
- [ ] 📝 Version Control Lead
```

---

## 🗂️ File Organization

```
TEMPLATE_COUNCIL/
├── COUNCIL_MEMBERS.md
├── EVALUATION_FRAMEWORK.md
├── REVIEW_WORKFLOW.md
├── MASTER_TEMPLATE.md
├── IMPROVED/
│   └── [template_name]/
│       ├── [template].md              # Template đã cải tiến
│       ├── SELF_ASSESSMENT.md
│       ├── PEER_REVIEW_[MEMBER].md
│       ├── CROSS_DOMAIN_CHECK.md
│       ├── PRACTICAL_TEST.md
│       ├── APPROVAL_RECORD.md
│       └── CHANGELOG.md
└── council_review.py
```

---

## ⏱️ Timeline Summary

| Step | Time | Who |
|------|------|-----|
| Self-Assessment | 10 min | Author |
| Peer Review | 20 min | Domain Expert |
| Cross-Domain Check | 15 min | Different Domain |
| Practical Test | 20 min | Auditor |
| Final Approval | 10 min | Version Lead |
| **Total** | **~75 min** | **Council** |

---

## 🚨 Fast-Track Process

Cho minor updates (typo fixes, link updates):
1. Self-assessment
2. 1 Peer review
3. Stamp approval

**Timeline:** 20 phút

---

## 📚 Related Documents
- [COUNCIL_MEMBERS.md](./COUNCIL_MEMBERS.md) - Thành viên hội đồng
- [EVALUATION_FRAMEWORK.md](./EVALUATION_FRAMEWORK.md) - Rubric đánh giá
- [MASTER_TEMPLATE.md](./MASTER_TEMPLATE.md) - Template chuẩn
