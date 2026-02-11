# CODE SUPPORT SPECIFICATION (CSS) TEMPLATE
**Status:** DRAFT / REQUESTED
**Submitter:** Writing Agent (Hoa Dang Voice)

## 1. IDENTITY & PURPOSE
- **Agent Name:** [e.g., ShopifAI]
- **Primary Goal:** [e.g., Generate high-converting SEO product descriptions]
- **Target Audience:** Non-tech beginners.

## 2. USER WORKFLOW (The "Experience")
1. User provides: [e.g., Product URL or image]
2. Agent does: [e.g., Scrapes specs, analyzes keywords, drafts copy]
3. Final Result: [e.g., A .md file ready for Shopify import]

## 3. TECHNICAL REQUIREMENTS (Coding Agent Task)
- **Required Skills:** [e.g., web_search, file_write, product_description_logic]
- **Environment Needs:** [e.g., Access to sandbox/ecommerce folder]
- **Logic Blocks:**
  - `block_1`: Scrape product data.
  - `block_2`: Apply SEO persona.
  - `block_3`: Format as CSV/Markdown.

## 4. SANDBOX CONSTRAINTS
- **Restricted Access:** No access to system root.
- **Allowed Domains:** `*.shopify.com`, `*.google.com`.

## 5. EXAMPLE OUTPUT (Desired Result)
```markdown
# Product Name: [Name]
## Description: [Copy]
## Keywords: [List]
```

---
*Coding Agent: Please implement this skill and save to `/templates/core/` or `/templates/community_inspired/`.*
