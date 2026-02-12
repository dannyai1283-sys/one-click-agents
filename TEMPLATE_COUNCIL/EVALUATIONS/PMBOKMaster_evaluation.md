# Template Evaluation: PMBOKMaster.md

**Original File**: `/templates/core/PMBOKMaster.md`  
**Evaluation Date**: 2025-02-12  
**Evaluator**: Template Council  

---

## Scores

| Criteria | Score | Notes |
|----------|-------|-------|
| **Clarity** | 8/10 | Goal và description rõ ràng |
| **Actionability** | 6/10 | Có suggested prompt nhưng thiếu step-by-step chi tiết |
| **Completeness** | 6/10 | Có 4 phần chính nhưng thiếu prerequisites, pitfalls |
| **Currentness** | 7/10 | PMBOK 7th Edition là current, có thể thêm hybrid approaches |
| **Safety** | 5/10 | Không có risks về project management (scope creep, v.v.) |
| **Tools Integration** | 6/10 | Canvas và File System được mention nhưng chưa tối ưu |
| **TOTAL** | **6.3/10** | **Grade: C+** |

---

## Strengths

1. **Goal chuyên nghiệp**: "Professional project management according to PMBOK standards"
2. **Có artifacts cụ thể**: WBS, Gantt charts, Risk Registers, Status Reports
3. **Standard compliance**: PMBOK 7th Edition
4. **Tools phù hợp**: Canvas cho visualization, File System cho artifacts
5. **Suggested prompt chi tiết**: Có project description placeholder

---

## Weaknesses

### Critical Issues
1. **Không có examples của output**: WBS trông như thế nào? Risk Register format?
2. **Thiếu prerequisites**: User cần biết gì về PM? Cần tools gì?

### Major Issues
3. **Không có step-by-step execution**: Làm thế nào để tạo WBS từ project description?
4. **Thiếu common pitfalls**: Scope creep, stakeholder management, v.v.
5. **Không có safety notes**: Project management có risks (overcommitting, unrealistic timelines)
6. **Chưa cập nhật hybrid approaches**: Agile + Waterfall, predictive vs adaptive

### Minor Issues
7. **Mermaid.js chưa được giải thích**: Ngườimới có thể không biết là gì
8. **Không có customization guide**: Làm sao để adapt cho different project sizes?

---

## Improvement Suggestions

### 1. Thêm Output Examples
```markdown
## Example WBS Output
```markdown
### Project: [Name]

1. **Initiation**
   1.1 Stakeholder Analysis
   1.2 Charter Development
   
2. **Planning**
   2.1 Scope Definition
   2.2 Schedule Development
   ...
```
```

### 2. Thêm Step-by-Step Workflow
```markdown
## Step 1: Project Clarification
Ask user:
- Project goal in one sentence
- Constraints (time, budget, resources)
- Key stakeholders
- Success criteria

## Step 2: WBS Creation
[Specific instructions]

## Step 3: Schedule Generation
[Specific instructions for Mermaid Gantt]
```

### 3. Thêm Prerequisites
```markdown
## Prerequisites
- Understanding of basic project management concepts
- Project details ready (scope, timeline, constraints)
- (Optional) Mermaid.js knowledge for customizing charts
```

### 4. Cập nhật 2024-2025 PM Trends
- Hybrid project management (PMBOK 7 + Agile)
- Value delivery system
- Performance domains
- AI-assisted project management

---

## Council Member Reviews

### Template Architect
> "Structure good nhưng cần thêm execution framework. Các artifacts cần 
được liên kết logic hơn, có thể thêm dependency map."

### Domain Expert (PM)
> "PMBOK 7th Edition reference là đúng nhưng nên mention rằng đây là 
principles-based, không phải process-based như PMBOK 6. Có thể cần 
thêm Agile hybrid guidance cho modern projects."

### UX Engineer
> "Suggested prompt tốt nhưng cần progressive disclosure hơn. 
Ngườimới có thể bị overwhelm bởi 'Generate WBS + Gantt + Risk Register' 
cùng lúc. Nên có 'Quick Start' và 'Full Project' modes."

### Practicality Auditor
> "Output quality phụ thuộc nhiều vào input quality. Cần input validation 
framework để đảm bảo project description đủ chi tiết trước khi generate artifacts."

### Version Control
> "Cần version history và mention compatibility với PMBOK editions. 
Nếu PMBOK 8th ra thì template này cần update."

---

## Action Plan

| Priority | Action | Owner |
|----------|--------|-------|
| 🔴 Critical | Add example outputs (WBS, Risk Register, Gantt) | Domain Expert |
| 🔴 Critical | Add step-by-step execution guide | Template Architect |
| 🟡 High | Add prerequisites section | Practicality Auditor |
| 🟡 High | Add input validation framework | UX Engineer |
| 🟡 High | Add common PM pitfalls | Domain Expert |
| 🟢 Medium | Update with PMBOK 7 principles context | Domain Expert |
| 🟢 Medium | Add Quick Start vs Full Project modes | UX Engineer |
| 🟢 Medium | Add metadata block | Version Control |

---

## Verdict

**Status**: 🔧 **NEEDS REVISION**

Template có nền tảng tốt với artifacts đúng chuẩn PM, nhưng thiếu practical 
execution guidance. Professional PMs có thể dùng được nhưng beginners sẽ struggle.

**Estimated time to fix**: 2-3 hours  
**Target score sau revision**: ≥ 8.0 (Grade A)
