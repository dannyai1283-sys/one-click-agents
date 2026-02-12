# 🔄 Template Migration Guide

> Hướng dẫn chuyển đổi template từ format cũ sang MASTER_TEMPLATE chuẩn

---

## 📊 Format Cũ vs Mới

### Format Cũ (Legacy)
```markdown
# Template Name
**Goal**: Brief description

## Description
Short paragraph

## Configuration
- Focus: 
- Tools: 
- Output: 

## Prompt Instruction
1. Step 1
2. Step 2

## Suggested Prompt
"Example prompt"
```

### Format Mới (MASTER_TEMPLATE)
```markdown
# Template Name
**Version**: 1.0.0
**Last Reviewed**: YYYY-MM-DD
**Council Approved**: ✅
**Category**: [Category]
**Complexity**: [Level]

## 🎯 Goal
One clear sentence

## 📝 Description
Multiple paragraphs with context

## ✅ Prerequisites
- [ ] Required items

## 🛠️ Tools Required
| Tool | Purpose | Required? |

## 📋 Step-by-Step Instructions
### Step 1: Name
**What to do**: 
**Why**: 
**How**: 

## 💡 Example Usage
### Example 1: [Name]
**Input**:
**Output**:

## ⚠️ Common Pitfalls
| Pitfall | Why | How to Avoid |

## 📤 Expected Output

## 🛡️ Safety Notes

## 📊 Limitations

## 📝 Changelog
```

---

## 🛠️ Migration Steps

### Step 1: Add Metadata Block

Thêm vào đầu file:
```markdown
**Version**: [current version or 1.0.0]
**Last Reviewed**: [today's date]
**Council Approved**: ❌ [will be ✅ after approval]
**Category**: [AI/Coding/Marketing/Finance/Productivity/Creative/Other]
**Complexity**: [Beginner/Intermediate/Advanced]
**Estimated Time**: [X] minutes per use
```

### Step 2: Expand Description

**Từ** (1 đoạn):
```markdown
## Description
An automated crypto market monitor that tracks price action.
```

**Thành** (2-3 đoạn):
```markdown
## 📝 Description

Crypto Sentinel Pro is an advanced market intelligence agent...

**What makes it different**:
- Feature 1
- Feature 2

**Ideal for**:
- User type 1
- User type 2
```

### Step 3: Add Prerequisites Section

Thêm mới:
```markdown
## ✅ Prerequisites

### Required
- [ ] Web access
- [ ] Basic knowledge of X

### Optional
- [ ] API key for Y

### Knowledge Prerequisites
- Understanding of Z
```

### Step 4: Convert Instructions to Step-by-Step

**Từ**:
```markdown
## Prompt Instruction
1. Do X
2. Do Y
3. Do Z
```

**Thành**:
```markdown
## 📋 Step-by-Step Instructions

### Step 1: [Action Name]

**What to do**: [Clear instruction]

**Why**: [Brief explanation]

**How**:
```
[Specific command/prompt]
```

**Expected result**: [What to see]

**If this fails**: [Troubleshooting]
```

### Step 5: Add Concrete Examples

**Từ**:
```markdown
## Suggested Prompt
"Run a scan on [Asset/Market]"
```

**Thành**:
```markdown
## 💡 Example Usage

### Example 1: Bitcoin Analysis

**Input**:
```
"Scan BTC for the last 24 hours..."
```

**Process**:
1. Collected data...
2. Analyzed...

**Output**:
```
[Realistic example output]
```
```

### Step 6: Add Safety & Limitations

Thêm mới:
```markdown
## 🛡️ Safety Notes

### ⚠️ [Specific Warning]
[Details]

### 📊 Limitations
- [Limitation 1]
- [Limitation 2]
```

### Step 7: Add Changelog

Thêm vào cuối:
```markdown
## 📝 Changelog

### [1.0.0] - YYYY-MM-DD
#### Added
- Initial release

### [Old Version] - Previous Date
- Legacy changes
```

---

## 🔄 Migration Checklist

### Metadata
- [ ] Version number added
- [ ] Last reviewed date added
- [ ] Council approved status added
- [ ] Category assigned
- [ ] Complexity level set
- [ ] Estimated time added

### Content
- [ ] Goal refined to 1 clear sentence
- [ ] Description expanded to 2-3 paragraphs
- [ ] Prerequisites section added
- [ ] Tools table created
- [ ] Instructions converted to step-by-step format
- [ ] Concrete examples added (2+ for core templates)
- [ ] Common pitfalls table added
- [ ] Expected output described
- [ ] Safety notes added
- [ ] Limitations documented
- [ ] Changelog created

### Quality
- [ ] All placeholders replaced with examples
- [ ] Outdated info updated to 2024-2025
- [ ] Safety warnings added (if applicable)
- [ ] Run self-assessment (target: 8.0+)

---

## 📈 Before & After Scores

| Template | Before | After | Improvement |
|----------|--------|-------|-------------|
| CryptoSentinel | 5.5 (C) | 8.5 (A) | +3.0 |
| PMBOKMaster | 6.3 (C+) | 8.5 (A) | +2.2 |
| ViralShortsGen | 6.8 (B) | 8.5 (A) | +1.7 |

---

## 🛠️ Automation Helper

Script để kiểm tra migration:

```python
# migration_checker.py
import re

def check_migration_status(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    
    checks = {
        'metadata_block': bool(re.search(r'\*\*Version\*\*:', content)),
        'prerequisites': bool(re.search(r'## ✅ Prerequisites', content)),
        'step_by_step': bool(re.search(r'### Step \d+:', content)),
        'examples': len(re.findall(r'### Example \d+:', content)),
        'safety': bool(re.search(r'## 🛡️ Safety', content)),
        'limitations': bool(re.search(r'## 📊 Limitations', content)),
        'changelog': bool(re.search(r'## 📝 Changelog', content)),
    }
    
    score = sum(checks.values()) / len(checks) * 10
    return checks, score

# Usage
# checks, score = check_migration_status('my_template.md')
# print(f"Migration Score: {score}/10")
```

---

## 🎯 Priority Order

Nếu không có thờigian migrate toàn bộ, ưu tiên theo thứ tự:

1. **Critical** (ảnh hưởng đến score nhiều nhất):
   - Add concrete examples
   - Add safety warnings
   - Add prerequisites

2. **High** (cải thiện đáng kể):
   - Convert to step-by-step
   - Add metadata block
   - Expand description

3. **Medium** (polish):
   - Add limitations
   - Add changelog
   - Create tools table

---

## 📚 Examples

Xem các template đã migrate trong thư mục [IMPROVED/](./IMPROVED/):
- `CryptoSentinel_Pro.md` - Financial template
- `PMBOKMaster_Pro.md` - Productivity template
- `ViralShortsGen_Pro.md` - Creative template

---

**Need help?** Tag Template Architect trong issue!
