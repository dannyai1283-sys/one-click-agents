#!/usr/bin/env python3
"""
🏛️ Template Council Review Tool

Automated template evaluation system cho One-Click Agents.
Scans templates, evaluates against framework, và generates reports.

Usage:
    python council_review.py [template_path]
    python council_review.py --all
    python council_review.py --report

Author: One-Click Agents Council
Version: 1.0.0
"""

import os
import sys
import json
import re
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Tuple, Optional

# Configuration
TEMPLATES_DIR = Path("/Volumes/M2Sata/DannyAI/one-click-agents/templates")
COUNCIL_DIR = Path("/Volumes/M2Sata/DannyAI/one-click-agents/TEMPLATE_COUNCIL")
IMPROVED_DIR = COUNCIL_DIR / "IMPROVED"

# Scoring criteria
CRITERIA = {
    "clarity": {
        "name": "Clarity",
        "weight": 1.0,
        "checks": [
            "Has clear title",
            "Has one-line pitch",
            "Has clear goal statement",
            "Instructions are numbered/structured",
            "No unexplained jargon"
        ]
    },
    "actionability": {
        "name": "Actionability",
        "weight": 1.0,
        "checks": [
            "Has specific placeholders",
            "Has example input/output",
            "Can be used immediately",
            "Has expected results defined"
        ]
    },
    "completeness": {
        "name": "Completeness",
        "weight": 1.0,
        "checks": [
            "Has metadata block",
            "Has prerequisites section",
            "Has step-by-step instructions",
            "Has example usage",
            "Has safety/limitations"
        ]
    },
    "currentness": {
        "name": "Currentness",
        "weight": 1.0,
        "checks": [
            "Last reviewed within 6 months",
            "References current standards",
            "No deprecated tools/methods",
            "Up-to-date best practices"
        ]
    },
    "safety": {
        "name": "Safety",
        "weight": 1.2,  # Higher weight
        "checks": [
            "Has limitations section",
            "Has warnings if applicable",
            "No harmful instructions",
            "Privacy considerations noted"
        ]
    },
    "tools_integration": {
        "name": "Tools Integration",
        "weight": 0.8,
        "checks": [
            "Appropriate tools selected",
            "Tool chain is logical",
            "No redundant tool usage"
        ]
    }
}


class TemplateAnalyzer:
    """Analyzes template files và evaluates chất lượng."""
    
    def __init__(self, file_path: Path):
        self.file_path = file_path
        self.content = ""
        self.lines = []
        self.scores = {}
        self.issues = []
        self.strengths = []
        
    def load(self) -> bool:
        """Load template file."""
        try:
            with open(self.file_path, 'r', encoding='utf-8') as f:
                self.content = f.read()
                self.lines = self.content.split('\n')
            return True
        except Exception as e:
            print(f"❌ Error loading {self.file_path}: {e}")
            return False
    
    def check_metadata(self) -> Tuple[int, List[str]]:
        """Check for metadata block."""
        score = 0
        issues = []
        
        # Check for metadata block
        if "## 📋 Template Metadata" in self.content or "**Template Name:**" in self.content:
            score += 3
        else:
            issues.append("Missing metadata block")
        
        # Check for version
        if re.search(r'\*\*Version:\*\*', self.content):
            score += 1
        else:
            issues.append("Missing version number")
        
        # Check for last reviewed date
        if re.search(r'\*\*Last Reviewed:\*\*', self.content):
            score += 1
        else:
            issues.append("Missing 'Last Reviewed' date")
        
        return score, issues
    
    def check_structure(self) -> Tuple[int, List[str]]:
        """Check template structure."""
        score = 0
        issues = []
        
        # Required sections
        required_sections = [
            ("Goal\|Objective\|One-Line Pitch", "Goal/Pitch"),
            ("Description", "Description"),
            ("Prerequisites", "Prerequisites"),
            ("Instructions\|Steps", "Instructions"),
            ("Example", "Example Usage"),
        ]
        
        for pattern, name in required_sections:
            if re.search(pattern, self.content, re.IGNORECASE):
                score += 2
            else:
                issues.append(f"Missing {name} section")
        
        return score, issues
    
    def check_safety(self) -> Tuple[int, List[str]]:
        """Check safety considerations."""
        score = 0
        issues = []
        
        # Check for limitations
        if re.search(r'Limitations\|Safety\|⚠️\|🛡️', self.content):
            score += 3
        else:
            issues.append("Missing limitations/safety section")
        
        # Check for warnings
        if re.search(r'Warning\|Don\'t Do This\|🚫', self.content):
            score += 2
        
        return score, issues
    
    def check_actionability(self) -> Tuple[int, List[str]]:
        """Check how actionable the template is."""
        score = 0
        issues = []
        
        # Check for placeholders
        placeholders = len(re.findall(r'\[.*?\]', self.content))
        if placeholders >= 3:
            score += 3
        elif placeholders > 0:
            score += 1
            issues.append("Few placeholders for customization")
        else:
            issues.append("No placeholders found")
        
        # Check for examples
        if re.search(r'Example\|Scenario\|```', self.content):
            score += 3
        else:
            issues.append("Missing concrete examples")
        
        return score, issues
    
    def check_clarity(self) -> Tuple[int, List[str]]:
        """Check clarity of instructions."""
        score = 0
        issues = []
        
        # Check for numbered steps
        numbered_steps = len(re.findall(r'^\s*\d+\.', self.content, re.MULTILINE))
        if numbered_steps >= 3:
            score += 3
        elif numbered_steps > 0:
            score += 1
        else:
            issues.append("No numbered instructions")
        
        # Check for clear headers
        headers = len(re.findall(r'^#{1,3} ', self.content, re.MULTILINE))
        if headers >= 5:
            score += 2
        
        # Check average line length (shorter = clearer)
        avg_line_len = sum(len(line) for line in self.lines) / max(len(self.lines), 1)
        if avg_line_len < 80:
            score += 2
        
        return score, issues
    
    def evaluate(self) -> Dict:
        """Run full evaluation."""
        if not self.load():
            return {"error": "Failed to load template"}
        
        # Run all checks
        meta_score, meta_issues = self.check_metadata()
        struct_score, struct_issues = self.check_structure()
        safety_score, safety_issues = self.check_safety()
        action_score, action_issues = self.check_actionability()
        clarity_score, clarity_issues = self.check_clarity()
        
        # Calculate weighted scores (scale to 1-10)
        self.scores = {
            "clarity": min(10, (clarity_score / 7) * 10),
            "actionability": min(10, (action_score / 6) * 10),
            "completeness": min(10, ((meta_score + struct_score) / 13) * 10),
            "safety": min(10, (safety_score / 5) * 10),
            "currentness": 5,  # Manual check required
            "tools_integration": 5  # Manual check required
        }
        
        # Collect all issues
        self.issues = meta_issues + struct_issues + safety_issues + action_issues + clarity_issues
        
        # Identify strengths
        if self.scores["clarity"] >= 7:
            self.strengths.append("Clear structure and instructions")
        if self.scores["actionability"] >= 7:
            self.strengths.append("Highly actionable with examples")
        if self.scores["safety"] >= 7:
            self.strengths.append("Good safety considerations")
        
        # Calculate overall score
        total_weight = sum(CRITERIA[c]["weight"] for c in CRITERIA)
        weighted_sum = sum(
            self.scores[c] * CRITERIA[c]["weight"] 
            for c in CRITERIA
        )
        overall = weighted_sum / total_weight
        
        return {
            "file": str(self.file_path),
            "name": self.file_path.stem,
            "scores": self.scores,
            "overall": round(overall, 1),
            "issues": self.issues,
            "strengths": self.strengths,
            "word_count": len(self.content.split()),
            "grade": self._get_grade(overall)
        }
    
    def _get_grade(self, score: float) -> str:
        """Convert score to letter grade."""
        if score >= 9:
            return "🏆 EXCEPTIONAL"
        elif score >= 8:
            return "✅ EXCELLENT"
        elif score >= 7:
            return "⚠️ GOOD"
        elif score >= 6:
            return "🔄 NEEDS WORK"
        else:
            return "❌ REJECTED"


def scan_templates(directory: Path) -> List[Path]:
    """Scan directory for template files."""
    templates = []
    
    for ext in ['*.md', '*.txt']:
        templates.extend(directory.rglob(ext))
    
    # Filter out files trong TEMPLATE_COUNCIL
    templates = [
        t for t in templates 
        if "TEMPLATE_COUNCIL" not in str(t)
    ]
    
    return sorted(templates)


def generate_report(results: List[Dict], output_path: Path):
    """Generate markdown report."""
    
    report = f"""# 📊 Template Council Review Report

**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M')}
**Templates Scanned:** {len(results)}

---

## 📈 Summary Statistics

| Grade | Count | Percentage |
|-------|-------|------------|
| 🏆 Exceptional (9.0+) | {sum(1 for r in results if r.get('overall', 0) >= 9)} | {sum(1 for r in results if r.get('overall', 0) >= 9)/max(len(results),1)*100:.1f}% |
| ✅ Excellent (8.0-8.9) | {sum(1 for r in results if 8 <= r.get('overall', 0) < 9)} | {sum(1 for r in results if 8 <= r.get('overall', 0) < 9)/max(len(results),1)*100:.1f}% |
| ⚠️ Good (7.0-7.9) | {sum(1 for r in results if 7 <= r.get('overall', 0) < 8)} | {sum(1 for r in results if 7 <= r.get('overall', 0) < 8)/max(len(results),1)*100:.1f}% |
| 🔄 Needs Work (6.0-6.9) | {sum(1 for r in results if 6 <= r.get('overall', 0) < 7)} | {sum(1 for r in results if 6 <= r.get('overall', 0) < 7)/max(len(results),1)*100:.1f}% |
| ❌ Rejected (<6.0) | {sum(1 for r in results if r.get('overall', 0) < 6)} | {sum(1 for r in results if r.get('overall', 0) < 6)/max(len(results),1)*100:.1f}% |

**Average Score:** {sum(r.get('overall', 0) for r in results)/max(len(results), 1):.1f}/10

---

## 📋 Detailed Results

"""
    
    # Sort by overall score
    sorted_results = sorted(results, key=lambda x: x.get('overall', 0), reverse=True)
    
    for result in sorted_results:
        if 'error' in result:
            continue
            
        report += f"""### {result['name']}
**File:** `{result['file']}`
**Overall Score:** {result['overall']}/10 - {result['grade']}
**Word Count:** {result['word_count']}

| Criteria | Score |
|----------|-------|
"""
        for criterion, score in result['scores'].items():
            report += f"| {CRITERIA[criterion]['name']} | {score:.1f}/10 |\n"
        
        if result['strengths']:
            report += "\n**Strengths:**\n"
            for strength in result['strengths']:
                report += f"- ✅ {strength}\n"
        
        if result['issues']:
            report += "\n**Issues to Address:**\n"
            for issue in result['issues'][:5]:  # Limit to 5 issues
                report += f"- ⚠️ {issue}\n"
            if len(result['issues']) > 5:
                report += f"- ... và {len(result['issues']) - 5} vấn đề khác\n"
        
        report += "\n---\n\n"
    
    # Add recommendations
    report += """## 💡 Council Recommendations

### High Priority (Score < 7.0)
"""
    
    low_scorers = [r for r in results if r.get('overall', 10) < 7 and 'error' not in r]
    if low_scorers:
        for r in low_scorers:
            report += f"- **{r['name']}** ({r['overall']}/10) - Cần major revision\n"
    else:
        report += "- Không có template nào cần major revision 🎉\n"
    
    report += """
### Medium Priority (Score 7.0-8.0)
"""
    
    medium_scorers = [r for r in results if 7 <= r.get('overall', 0) < 8]
    if medium_scorers:
        for r in medium_scorers:
            report += f"- **{r['name']}** ({r['overall']}/10) - Có thể cải thiện\n"
    else:
        report += "- Không có\n"
    
    report += f"""
---

## 📊 Next Steps

1. **Review Low Scorers:** Tập trung vào templates dưới 7.0
2. **Update Metadata:** Thêm metadata block cho templates thiếu
3. **Add Examples:** Bổ sung concrete examples
4. **Safety Review:** Đảm bảo tất cả templates có safety notes

## 🏛️ Council Members

Đánh giá được thực hiện bởi:
- 🏗️ Template Architect
- 🎯 Domain Expert
- 🎨 UX/Prompt Engineer
- ✅ Practicality Auditor
- 📝 Version Control Lead

---

*Report generated by Template Council Review Tool v1.0.0*
"""
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(report)
    
    print(f"✅ Report saved to: {output_path}")


def main():
    """Main entry point."""
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Template Council Review Tool"
    )
    parser.add_argument(
        "template", 
        nargs="?",
        help="Path to specific template to review"
    )
    parser.add_argument(
        "--all", "-a",
        action="store_true",
        help="Review all templates in directory"
    )
    parser.add_argument(
        "--report", "-r",
        action="store_true",
        help="Generate full report"
    )
    parser.add_argument(
        "--output", "-o",
        default=str(COUNCIL_DIR / "review_report.md"),
        help="Output path for report"
    )
    
    args = parser.parse_args()
    
    print("🏛️ Template Council Review Tool v1.0.0")
    print("=" * 50)
    
    results = []
    
    if args.template:
        # Review single template
        path = Path(args.template)
        if path.exists():
            analyzer = TemplateAnalyzer(path)
            result = analyzer.evaluate()
            results.append(result)
            
            print(f"\n📄 {result['name']}")
            print(f"Overall: {result['overall']}/10 - {result['grade']}")
            print("\nScores:")
            for criterion, score in result['scores'].items():
                print(f"  {CRITERIA[criterion]['name']}: {score:.1f}/10")
        else:
            print(f"❌ File not found: {args.template}")
            sys.exit(1)
    
    elif args.all:
        # Review all templates
        templates = scan_templates(TEMPLATES_DIR)
        print(f"\n🔍 Found {len(templates)} templates")
        
        for i, template_path in enumerate(templates, 1):
            print(f"\n[{i}/{len(templates)}] Reviewing: {template_path.name}")
            analyzer = TemplateAnalyzer(template_path)
            result = analyzer.evaluate()
            results.append(result)
            
            if 'error' not in result:
                print(f"   Score: {result['overall']}/10 - {result['grade']}")
            else:
                print(f"   Error: {result['error']}")
    
    else:
        parser.print_help()
        sys.exit(0)
    
    # Generate report if requested or if reviewing multiple
    if args.report or (args.all and results):
        generate_report(results, Path(args.output))
        
        # Print summary
        print("\n" + "=" * 50)
        print("📊 SUMMARY")
        print("=" * 50)
        
        valid_results = [r for r in results if 'error' not in r]
        if valid_results:
            avg_score = sum(r['overall'] for r in valid_results) / len(valid_results)
            print(f"Templates reviewed: {len(valid_results)}")
            print(f"Average score: {avg_score:.1f}/10")
            print(f"\nGrade distribution:")
            for grade in ["🏆 EXCEPTIONAL", "✅ EXCELLENT", "⚠️ GOOD", "🔄 NEEDS WORK", "❌ REJECTED"]:
                count = sum(1 for r in valid_results if r['grade'] == grade)
                if count > 0:
                    print(f"  {grade}: {count}")


if __name__ == "__main__":
    main()
