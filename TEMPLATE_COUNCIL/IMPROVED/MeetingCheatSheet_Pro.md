---
## 📋 Template Metadata
**Template Name:** MeetingCheatSheet Pro
**Version:** 2.0.0
**Last Reviewed:** 2026-02-12
**Council Approved:** Pending
**Category:** Productivity
**Complexity:** Beginner
**Est. Time:** 2-3 minutes per use

**Author:** DannyAI Template Council
**Contributors:** —
**Tags:** [#meeting, #productivity, #action-items, #transcript, #summarization]
---

# 🎯 MeetingCheatSheet Pro

## One-Line Pitch
Trích xuất action items quan trọng từ transcript hoặc ghi chú cuộc họp một cách nhanh chóng và có cấu trúc.

## 📖 Description
MeetingCheatSheet Pro giúp bạn biến nội dung dài dòng của cuộc họp thành danh sách hành động rõ ràng, có thể assign và track. Template này phù hợp cho meeting facilitators, project managers, team leads, hoặc bất kỳ ai muốn đảm bảo decisions và action items từ cuộc họp không bị "lost in translation". Đặc biệt hữu ích cho async teams hoặc khi cần share meeting recap với stakeholders không tham dự.

---

## ✅ Prerequisites (Điều Kiện Tiên Quyết)

### Kiến Thức Cần Có
- [ ] Hiểu cấu trúc cơ bản của meeting notes hoặc transcript
- [ ] Biết phân biệt discussion vs. decision vs. action item
- [ ] Hiểu về meeting participants và roles của họ

### Tools/Access Cần Có
- [ ] OpenClaw hoặc AI assistant
- [ ] Meeting transcript (từ Zoom, Teams, Meet, hoặc ghi chú tay)
- [ ] (Optional) Task management tool (Asana, Notion, Linear, Jira)

### Dữ Liệu/Inputs Cần Chuẩn Bị
- [ ] Full meeting transcript hoặc detailed notes
- [ ] List of meeting participants với roles
- [ ] (Optional) Meeting agenda để context
- [ ] (Optional) Previous meeting action items (để check status)

---

## 🚀 Instructions (Hướng Dẫn Từng Bước)

### Step 1: Gather Meeting Content
**Action:** Thu thập và chuẩn bị transcript hoặc notes từ cuộc họp
**Details:**
- Lấy transcript từ meeting platform (Zoom/Teams/Meet có auto-transcription)
- Nếu không có transcript, dùng ghi chú chi tiết nhất có thể
- Đảm bảo capture được cả Q&A section
- Lưu ý timestamp nếu cần reference lại

**Expected Result:** Một file text chứa toàn bộ nội dung cuộc họp

---

### Step 2: List Participants and Context
**Action:** Xác định ngườii tham dự và context của cuộc họp
**Details:**
- List tất cả participants với tên đầy đủ và role
- Ghi rõ meeting purpose/objective
- Nêu rõ deadline hoặc timeline cho project (nếu có)
- Note bất kỳ context đặc biệt nào (blockers, dependencies)

**Expected Result:** Context document giúp AI hiểu rõ hơn về decisions

---

### Step 3: Apply MeetingCheatSheet Pro Template
**Action:** Sử dụng prompt dưới đây với AI assistant
**Details:**
Copy và paste prompt sau, thay thế nội dung trong ngoặc vuông:

```
## MEETING CHEATSHEET PRO

### MEETING INFO
**Meeting Title:** [Tên cuộc họp]
**Date:** [YYYY-MM-DD]
**Participants:** [List tên + role - ví dụ: "Alice (PM), Bob (Engineer), Carol (Designer)"]
**Meeting Purpose:** [Mục tiêu cuộc họp]
**Project/Context:** [Bối cảnh dự án]

### TRANSCRIPT/NOTES
```
[Paste toàn bộ transcript hoặc meeting notes vào đây]
```

### EXTRACTION REQUEST
Analyze the meeting content and provide:

#### 1. TOP 3 ACTION ITEMS (Priority Order)
For each action item, include:
- **Action:** Clear description of what needs to be done
- **Owner:** Person responsible (assign based on context/discussion)
- **Due Date:** If mentioned, or suggest reasonable timeline
- **Context:** Brief note on WHY this matters

#### 2. KEY DECISIONS MADE
List all formal decisions reached during the meeting (1-2 sentences each)

#### 3. OPEN QUESTIONS/ISSUES
Any unresolved items that need follow-up

#### 4. NEXT MEETING (if applicable)
- Proposed agenda items
- Suggested attendees
- Preferred timeframe

### OUTPUT FORMAT
Use this structure:

---
## 🎯 TOP 3 ACTION ITEMS

### 1. [Highest Priority Action]
- **Owner:** [@Person or Role]
- **Due:** [Date or "ASAP"]
- **Details:** [Context and specifics]
- **Success Criteria:** [How do we know it's done?]

### 2. [Second Priority]
[Same structure]

### 3. [Third Priority]
[Same structure]

---
## ✅ DECISIONS MADE
1. [Decision 1]
2. [Decision 2]
3. [Decision 3]

---
## ❓ OPEN ITEMS
- [Item 1]: [Context]
- [Item 2]: [Context]

---
## 📅 NEXT STEPS
[List immediate next steps]
```

**Expected Result:** Structured meeting recap với action items rõ ràng

---

### Step 4: Review and Validate
**Action:** Kiểm tra accuracy của extracted information
**Details:**
- Verify owners assigned correctly (cross-check với discussion)
- Đảmảo deadlines realistic và được đề cập trong meeting
- Check xem có miss action items nào không
- Confirm decisions accurately captured

**Expected Result:** Validated cheat sheet sẵn sàng để share

---

### Step 5: Distribute and Track
**Action:** Share với team và integrate vào workflow
**Details:**
- Send recap tới all participants và relevant stakeholders
- Copy action items vào task management tool (Asana/Notion/Linear)
- Set reminders cho due dates
- Schedule follow-up nếu cần

**Expected Result:** Action items được track và executed

---

## 💡 Example Usage (Ví Dụ Cụ Thể)

### Scenario: Sprint Planning Meeting

**Input của bạn:**
```
Meeting Title: Q1 Product Sprint Planning
Date: 2025-02-12
Participants: 
- Sarah (Product Manager)
- Mike (Tech Lead)
- Jenny (Designer)
- Tom (Frontend Dev)
- Lisa (QA Lead)

Meeting Purpose: Plan features cho Q1, estimate effort, assign ownership

Transcript Excerpt:
"Sarah: Okay team, for Q1 we need to ship the new dashboard and mobile responsiveness. 
Mike, how long for the dashboard backend?

Mike: I'd say 2 weeks if Tom helps with API integration. But we need the design specs first.

Jenny: I can have final designs by Friday. Just need to finish the user flow review.

Tom: Sounds good. I can start on the API work Monday.

Lisa: I'll need at least 3 days for testing after dev is done. Can we aim for end of month?

Sarah: End of month works. Let's make it Feb 28th. Jenny, can you commit to Friday for designs?

Jenny: Yes, Feb 14th EOD.

Mike: Actually, one concern - we discussed mobile responsiveness too. That's another 2 weeks minimum. Should we prioritize?

Sarah: Good point. Let's focus on dashboard first. Mobile can be Q1 stretch goal. I'll update stakeholders."
```

**Cách sử dụng template:**
1. Copy meeting info vào template
2. Paste transcript
3. Run AI extraction
4. Review và validate
5. Create tasks trong project management tool

**Output mong đợi:**
```
---
## 🎯 TOP 3 ACTION ITEMS

### 1. Finalize Dashboard Design
- **Owner:** @Jenny (Designer)
- **Due:** Feb 14, 2025 EOD
- **Details:** Complete user flow review và finalize design specs để dev team bắt đầu
- **Success Criteria:** Design specs handed off to Mike và Tom

### 2. Develop Dashboard Backend & API
- **Owner:** @Mike (Tech Lead) with @Tom (Frontend Dev) supporting
- **Due:** Feb 28, 2025
- **Details:** Build dashboard backend; Tom assists với API integration
- **Success Criteria:** Backend functional, API integrated, ready for QA

### 3. Dashboard QA Testing
- **Owner:** @Lisa (QA Lead)
- **Due:** Feb 28, 2025 (3 days window)
- **Details:** Comprehensive testing của dashboard feature trước release
- **Success Criteria:** All critical bugs resolved, sign-off given

---
## ✅ DECISIONS MADE
1. Dashboard là Q1 priority; mobile responsiveness moved to stretch goal
2. Target release date: February 28, 2025
3. Resource allocation: Mike leads backend, Tom supports API, Jenny delivers designs by Feb 14

---
## ❓ OPEN ITEMS
- Mobile responsiveness timeline: TBD for later in Q1 nếu dashboard on track
- Stakeholder communication: Sarah to update về priority change

---
## 📅 NEXT STEPS
- Jenny to send design handoff invite cho Friday
- Mike và Tom sync Monday morning để discuss API approach
- Sarah schedule check-in meeting for Feb 21 để review progress
```

---

## 🛠️ Tools Integration (Tích Hợp Tools)

### Tools Được Sử Dụng
| Tool | Purpose | When to Use |
|------|---------|-------------|
| AI Assistant | Extract và structure action items | Step 3 - Core processing |
| Meeting Platform | Get transcript | Step 1 - Input gathering |
| Task Manager | Track action items | Step 5 - Follow-up |
| Calendar | Schedule follow-ups | Step 5 - Next steps |

### Specific Tool Integrations

#### Zoom/Teams/Meet Transcript Export
**Platforms with auto-transcription:**
- **Zoom:** Settings → Record → Cloud Recording → Audio transcript
- **Microsoft Teams:** Meeting options → Start transcription
- **Google Meet:** Turn on caption → Save transcript (requires Google Workspace)

**Export formats:**
- VTT (Video Text Track) - preferred for timestamps
- TXT - plain text, easiest for AI processing
- SRT - subtitle format with timing

#### OpenClaw Tool Chain for Meeting Processing

**Step 1: Transcript Preparation with `read`**
```
Read meeting transcript file
→ Clean speaker labels
→ Remove timestamps if not needed
→ Save as clean text input
```

**Step 2: AI Processing with `browser` (Optional)**
```
Use browser to:
- Research action item context
- Look up technical terms mentioned
- Find relevant documentation links
```

**Step 3: Extract with AI Assistant**
```
Paste prepared transcript + MeetingCheatSheet Pro template
→ Get structured output
```

**Step 4: Export with `write`**
```
Save output to:
- MeetingNotes_YYYY-MM-DD.md
- ActionItems_YYYY-MM-DD.md
- DecisionLog_YYYY-MM-DD.md
```

#### Task Management Tool Integrations

**Notion Integration:**
- Create database với properties: Task, Owner, Due Date, Status, Meeting Source
- Use Notion Web Clipper để link meeting notes
- Set up kanban view cho status tracking

**Asana Integration:**
- Create project "Meeting Action Items"
- Import tasks từ cheat sheet using CSV import
- Set up custom fields: Meeting Date, Priority, Status

**Linear Integration:**
- Create issues from action items
- Label with meeting date và topic
- Use Linear's Slack integration for notifications

**Jira Integration (Enterprise):**
- Create issues type "Task" cho mỗi action item
- Use Component field để track meeting source
- Set up Jira Automation để assign và notify

#### Calendar Automation

**Google Calendar:**
- Use "Add description" để paste action items
- Set reminders 24h before due dates
- Create follow-up meeting events

**Outlook Calendar:**
- Use Categories để color-code meeting types
- Set custom reminders cho action items
- Share calendar với team members

#### Slack/Teams Notification Integration

**Post-Meeting Workflow:**
```
1. Generate cheat sheet
2. Post to #meeting-recaps channel (Slack)
3. Tag @mentions cho action item owners
4. Pin message để dễ tìm
5. Set reminder 1 day before due dates
```

**Slack Workflow Builder:**
- Create form cho meeting recap
- Auto-post to channel
- Add reaction emoji cho status tracking
  - ✅ = Done
  - 🔄 = In Progress  
  - ⏸️ = Blocked

### Tool Chain Flow
```
[Meeting Recording] → [Transcript Export] → [AI Processing (Step 3)] → [Human Review (Step 4)] → [Task Manager + Calendar (Step 5)]
```

---

## ⚠️ Common Pitfalls (Lỗi Thường Gặp)

### Pitfall 1: Missing "Implicit" Action Items
**What:** AI chỉ capture explicit "I will do X" mà miss implicit commitments
**Why it happens:** Context và nuance trong conversation
**How to avoid:** Add note trong prompt: "Also identify implied action items từ discussion"

### Pitfall 2: Wrong Owner Assignment
**What:** AI assign owner dựa trên role thay vì discussion
**Why it happens:** Transcript không rõ ai volunteered
**How to avoid:** Thêm participant list với roles để AI có context

### Pitfall 3: Vague Action Descriptions
**What:** "Work on dashboard" thay vì "Implement dashboard API endpoints"
**How to avoid:** Review output và add specifics trước khi share

### Pitfall 4: Missing Decisions
**What:** Important decisions được discuss nhưng không formally stated
**How to avoid:** Explicitly yêu cầu AI extract "Key Decisions" riêng section

---

## 🛡️ Safety Notes (Lưu Ý An Toàn)

### ⚠️ Limitations
- AI không thể capture tone hoặc non-verbal cues từ transcript
- Context từ meetings trước có thể bị miss
- Ambiguous discussions có thể lead to incorrect interpretation

### 🚫 Don't Do This
- **Đừng** share confidential meeting content với public AI nếu có sensitive data
- **Đừng** rely 100% vào AI extraction - always human review
- **Đừng** skip validation step cho high-stakes decisions
- **Đừng** dùng cho legal/compliance meetings mà không legal review

### 💰 Cost Implications
- AI processing: Free với most assistants
- Meeting transcription: Free với Zoom/Teams (premium features có thể cost)
- Task management tools: Phụ thuộc vào plan

### 🔒 Data Privacy
- Meeting transcripts có thể chứa confidential information
- Không upload proprietary/strategic discussions lên public AI không có enterprise security
- Consider using local/private AI cho sensitive meetings
- Check company data policy trước khi dùng external AI

---

## 📊 Expected Output

### Format
Structured markdown với sections rõ ràng: Action Items, Decisions, Open Items

### Content Structure
```
## 🎯 TOP 3 ACTION ITEMS
[Numbered list với Owner, Due Date, Details, Success Criteria]

## ✅ DECISIONS MADE
[Bulleted list của formal decisions]

## ❓ OPEN ITEMS
[Unresolved questions hoặc blockers]

## 📅 NEXT STEPS
[Immediate follow-up actions]
```

### Quality Criteria
Output tốt nếu:
- [ ] Action items có thể execute được (SMART criteria)
- [ ] Owners assigned chính xác
- [ ] Due dates realistic và mentioned trong meeting
- [ ] Decisions captured đầy đủ
- [ ] Open items flagged để follow-up
- [ ] Có thể copy-paste vào task manager

---

## 🎓 Pro Tips (Mẹo Chuyên Nghiệp)

1. **The "Parking Lot" Technique:** Trong meeting, khi discussion đi off-topic, note lại và yêu cầu AI extract "Parking Lot Items" để address sau

2. **Decision Log Integration:** Lưu "Decisions Made" section vào shared decision log để future reference và avoid re-litigation

3. **Async Handoff:** Gửi cheat sheet cho stakeholders không attend meeting - họ có thể nắm situation trong 2 phút thay vì đọc cả transcript

4. **Pattern Recognition:** Lưu các meeting cheat sheets lại và periodic review để identify recurring themes, blockers, hoặc delayed items

---

## 🔄 Variations (Biến Thể)

### Variation 1: Quick Standup Extract
**Use case:** Daily standups với nhiều team members
**Changes:**
- Focus: Yesterday's progress, today's plan, blockers
- Shorter format: Status per person
- Timeline: Daily thay vì project-based

### Variation 2: Client Meeting Summary
**Use case:** External client meetings
**Changes:**
- Tone: More formal, client-facing
- Add: Deliverables promised, budget discussions
- Sensitive: Filter internal discussions

### Variation 3: All-Hands Extraction
**Use case:** Company-wide meetings với Q&A
**Changes:**
- Structure: Announcements, Q&A summary, Department updates
- Action items: Usually fewer, more strategic
- Audience: Broader, cần context hơn

---

## 📚 Related Templates

- [LinkedInSpark_Pro.md](./LinkedInSpark_Pro.md) - Share meeting insights publicly
- [EmailPolisher_Pro.md](./EmailPolisher_Pro.md) - Polish meeting recap email
- [ProjectKickoff_Pro.md](./ProjectKickoff_Pro.md) - Structure initial project meetings

---

## 🐛 Troubleshooting (Xử Lý Sự Cố)

### Issue: AI miss important action items
**Symptoms:** Stakeholder points out missing items sau khi share
**Solution:** Add prompt instruction: "Also scan for phrases like 'we should', 'need to', 'have to' và extract as potential action items"

### Issue: Too many action items extracted
**Symptoms:** List quá dài, overwhelming
**Solution:** Thêm constraint: "Focus on top 5 most critical action items only, group related items"

### Issue: Transcript quality poor
**Symptoms:** AI không hiểu context, extract sai
**Solution:** Clean transcript trước - remove filler words, clarify speaker labels, break into paragraphs

### Issue: Confidential content concern
**Symptoms:** Meeting chứa sensitive info
**Solution:** Use on-premise AI hoặc de-identify data (replace company names, numbers với placeholders) trước processing

---

## 📝 Changelog

### v2.0.0 - 2026-02-12
- Restructured theo MASTER_TEMPLATE.md standard
- Thêm comprehensive meeting info section
- Thêm Success Criteria cho mỗi action item
- Thêm Decisions Made và Open Items sections
- Thêm 3 variations cho different meeting types
- Thêm data privacy warnings và security considerations
- Thêm troubleshooting section với common issues

### v1.0.0 - Original
- Basic prompt: "Summarize into 3 most important action items with owners"

---

## ✅ Council Approval Stamp

**Status:** [ ] Pending / [ ] Approved / [ ] Rejected
**Date:** [YYYY-MM-DD]
**Version Approved:** 2.0.0

**Scores:**
| Criteria | Score |
|----------|-------|
| Clarity | /10 |
| Actionability | /10 |
| Completeness | /10 |
| Currentness | /10 |
| Safety | /10 |
| Tools Integration | /10 |
| **OVERALL** | **/10** |

**Approved by:**
- [ ] 🏗️ Template Architect
- [ ] 🎯 Domain Expert
- [ ] 🎨 UX Engineer
- [ ] ✅ Practicality Auditor
- [ ] 📝 Version Control Lead
