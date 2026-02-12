# 🎯 Quality Gates & Checkpoints

> Hệ thống kiểm soát chất lượng tại các mốc quan trọng

---

## 🚪 Quality Gates

### Gate 0: Pre-Submission
**Trigger**: Trước khi submit template

**Requirements**:
- [ ] Template chạy được (tested)
- [ ] Self-assessment ≥ 7.0/10
- [ ] Không có red flags (placeholders, outdated refs)
- [ ] Đã đọc MASTER_TEMPLATE

**Checkpoint**: `✅ Ready for Submission`

**If Failed**:
- Quay lại sửa
- Chạy self-assessment lại
- Kiểm tra red flags

---

### Gate 1: Auto-Evaluation
**Trigger**: Sau khi submit, trước manual review

**Automated Checks**:
- [ ] File format valid (Markdown)
- [ ] Required sections present
- [ ] No critical red flags
- [ ] Score ≥ 6.0/10 (auto-calc)

**Checkpoint**: `✅ Passed Auto-Check`

**If Failed**:
- Auto-reject với feedback
- Author sửa và resubmit
- Không vào manual review

---

### Gate 2: Peer Review
**Trigger**: Sau khi pass auto-evaluation

**Requirements**:
- [ ] 2+ reviewers assigned
- [ ] Each reviewer đánh giá 6 criteria
- [ ] Không có blocking issues
- [ ] Consensus hoặc majority approve

**Checkpoint**: `✅ Peer Review Passed`

**Timeline**: 48 hours

**If Failed**:
- Changes requested
- Quay lại author
- Re-review sau khi sửa

---

### Gate 3: Cross-Domain Check
**Trigger**: Sau peer review

**Requirements**:
- [ ] Reviewer từ khác domain review
- [ ] Understandability ≥ 7/10
- [ ] Không có confusion points nghiêm trọng

**Checkpoint**: `✅ Cross-Domain Approved`

**If Failed**:
- Yêu cầu clarify terminology
- Thêm explanations
- Re-check

---

### Gate 4: Practical Test
**Trigger**: Cho templates complex hoặc risky

**Requirements**:
- [ ] Tester chưa từng dùng template
- [ ] Time to first success < 10 min
- [ ] Output quality ≥ 7/10
- [ ] No critical errors

**Checkpoint**: `✅ Practical Test Passed`

**If Failed**:
- Identify usability issues
- Sửa instructions
- Re-test

---

### Gate 5: Final Approval
**Trigger**: Tất cả gates trước đã pass

**Requirements**:
- [ ] All reviewer comments addressed
- [ ] Metadata complete
- [ ] Version assigned
- [ ] Changelog updated
- [ ] Final score ≥ 8.0 (core) hoặc ≥ 7.0 (community)

**Checkpoint**: `✅ APPROVED FOR PUBLICATION`

**If Failed**:
- Minor revision → Back to Gate 4
- Major revision → Back to Gate 2

---

## 📊 Gate Statistics

| Gate | Pass Rate | Avg Time | Common Failure |
|------|-----------|----------|----------------|
| Gate 0 | 60% | 1 day | Red flags |
| Gate 1 | 70% | Instant | Missing sections |
| Gate 2 | 50% | 3 days | Low actionability |
| Gate 3 | 80% | 1 day | Jargon |
| Gate 4 | 75% | 2 days | Confusing steps |
| Gate 5 | 90% | 1 day | Metadata missing |

**Overall Pass Rate**: ~12% (Gate 0 → Gate 5)

---

## 🔄 Fast Track Criteria

Templates có thể skip Gate 4 (Practical Test) nếu:
- [ ] Simple template (≤ 3 steps)
- [ ] Author đã cung cấp video demo
- [ ] Similar template đã approved trước đó
- [ ] Emergency fix cho approved template

**Fast Track Path**: Gate 0 → 1 → 2 → 3 → 5

---

## 🚨 Emergency Override

Template Architect có thể override bất kỳ gate nào nếu:
- Critical security fix
- Breaking change từ external API
- Template đang gây harm

**Process**:
1. Document lý do
2. Get 1 other council member approval
3. Skip to Gate 5
4. Retrospective sau khi deploy

---

## 📋 Gate Checklist Summary

### For Authors

```
[ ] Gate 0: Pre-Submission
    [ ] Template tested
    [ ] Self-assessment ≥ 7.0
    [ ] No red flags

[ ] Gate 1: Auto-Evaluation (Automatic)

[ ] Gate 2: Peer Review
    [ ] Address reviewer feedback
    [ ] Revise if needed

[ ] Gate 3: Cross-Domain Check
    [ ] Clarify if asked

[ ] Gate 4: Practical Test (if required)
    [ ] Fix usability issues

[ ] Gate 5: Final Approval
    [ ] Update metadata
    [ ] Finalize changelog
```

### For Reviewers

```
[ ] Gate 2: Peer Review
    [ ] Evaluate all 6 criteria
    [ ] Provide specific feedback
    [ ] Vote Approve/Changes/Reject

[ ] Gate 3: Cross-Domain Check
    [ ] Review as generalist
    [ ] Flag confusing terms

[ ] Gate 4: Practical Test
    [ ] Follow instructions exactly
    [ ] Record time and issues
    [ ] Rate output quality

[ ] Gate 5: Final Approval
    [ ] Verify all changes made
    [ ] Check metadata
    [ ] Approve for publication
```

---

## 🎯 Quality Metrics per Gate

### Gate 0
- Self-assessment score
- Red flags count
- Testing evidence

### Gate 1
- Auto-evaluation score
- Section completeness
- Format compliance

### Gate 2
- Average peer score
- Reviewer agreement %
- Feedback quality

### Gate 3
- Understandability score
- Confusion points count
- Accessibility rating

### Gate 4
- Time to first success
- Success rate
- Output quality score

### Gate 5
- Final score
- Grade
- Approval status

---

**Document Version**: 1.0.0  
**Last Updated**: 2025-02-12
