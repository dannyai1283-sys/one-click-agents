---
## 📋 Template Metadata
**Template Name:** Crypto Sentinel Pro
**Version:** 2.0.0
**Last Reviewed:** 2026-02-12
**Council Approved:** ✅ Yes
**Category:** Finance
**Complexity:** Intermediate
**Est. Time:** 5-10 minutes per scan

**Author:** One-Click Agents Council
**Tags:** [#crypto, #trading, #market-analysis, #alerts]
---

# 🛡️ Crypto Sentinel Pro

## One-Line Pitch
Real-time crypto market monitor với price action, volume spikes, và sentiment analysis - tự động phát hiện cơ hội và cảnh báo rủi ro.

## 📖 Description
Crypto Sentinel Pro là hệ thống giám sát thị trường crypto thông minh, tự động theo dõi biến động giá, khối lượng giao dịch bất thường và tin tức thị trường. Template này phù hợp cho trader, investor, hoặc bất kỳ ai muốn nắm bắt thị trường crypto mà không cần theo dõi 24/7.

**Kết quả mong đợi:** Báo cáo phân tích thị trường trong 5 phút, bao gồm alerts, sentiment outlook và risk assessment.

---

## ✅ Prerequisites

### Kiến Thức Cần Có
- [ ] Hiểu cơ bản về crypto markets (BTC, ETH, Altcoins)
- [ ] Biết đọc price charts và volume
- [ ] Hiểu các khái niệm: volatility, market cap, dominance

### Tools/Access Cần Có
- [ ] OpenClaw với web search enabled
- [ ] (Optional) API key cho CoinGecko/CoinMarketCap nếu muốn data chính xác hơn

### Dữ Liệu Cần Chuẩn Bị
- [ ] Danh sách coins muốn track (mặc định: BTC, ETH, top 10)
- [ ] Ngưỡng volatility quan tâm (mặc định: 5%)

### 📊 Data Sources Guidance

**Nguồn lấy 7-day volume trung bình:**
1. **CoinGecko** (Miễn phí): Search "CoinGecko [coin] volume" → Tab "Markets" → Volume (24h) → Tính trung bình 7 ngày
2. **CoinMarketCap**: Coin detail page → Historical Data → 7 days volume average
3. **Alternative**: Nếu không có 7-day average, dùng 24h volume × 7 và so sánh với volume hiện tại
4. **Quick check**: Volume spike = current volume > 150% của trung bình tuần

**Kiểm tra dữ liệu stale:**
- Giá: So sánh ít nhất 2 nguồn (CoinGecko vs CoinMarketCap)
- News: Check timestamp, loại bỏ tin >24h nếu không còn relevant
- Volume: Data delayed 15-30 phút là bình thường, >2h là stale

---

## 🚀 Instructions

### Step 1: Market Scan
**Action:** Scan giá và volume của các assets được chỉ định
**Details:**
- Sử dụng web search để lấy current prices
- Check 24h change và volume
- So sánh với 7-day average volume

**Expected Result:** Bảng giá hiện tại với % change và volume metrics

**⚠️ Error Handling - Stale Data:**
| Issue | Detection | Action |
|-------|-----------|--------|
| Price data >2h old | Cross-check 2 sources differ >3% | Flag "Data may be stale" + note timestamp |
| Volume data unavailable | 7-day avg not found | Use 24h volume only, note "Limited volume data" |
| API/Search timeout | No results in 30s | Retry once, then report "Data temporarily unavailable" |
| Inconsistent prices | Sources differ >5% | Use average, flag "Price variance detected" |

---

### Step 2: Sentiment Analysis
**Action:** Phân tích sentiment từ news và social media
**Details:**
- Search "[Coin] news today" cho mỗi asset chính
- Tìm trending topics trong crypto community
- Check cho major announcements (partnerships, regulations)

**Expected Result:** Summary của market sentiment (Bullish/Bearish/Neutral) với key news highlights

---

### Step 3: Alert Generation
**Action:** Generate alerts dựa trên triggers
**Details:**
- **Price Alert:** Nếu 24h change > ±5%
- **Volume Alert:** Nếu volume > 150% của 7-day average
- **News Alert:** Nếu có breaking news quan trọng

**Expected Result:** List của alerts với severity levels (🟡 Watch / 🟠 Caution / 🔴 Alert)

---

### Step 4: Risk Assessment
**Action:** Đánh giá rủi ro và đưa ra outlook
**Details:**
- Tổng hợp data từ các bước trước
- Cung cấp "Bullish / Bearish / Neutral" rating
- Ghi rõ confidence level (High/Medium/Low)

**Expected Result:** 1-paragraph outlook với clear risk assessment

---

## 💡 Example Usage

### Scenario: Morning Market Check

**Input của bạn:**
```
Scan BTC, ETH, SOL. Focus on any unusual volume or major news in the last 4 hours.
```

**Cách sử dụng template:**
1. **Market Scan:** Search "Bitcoin price today", "Ethereum price today", "Solana price today"
2. **Sentiment Check:** Search "Bitcoin news today", "crypto market sentiment"
3. **Alert Gen:** Check if any 24h change > 5% or volume spikes
4. **Assessment:** Provide outlook based on findings

**Output mong đợi:**
```markdown
# 🛡️ Crypto Sentinel Report
**Generated:** 2026-02-12 09:00 UTC

## Market Snapshot
| Asset | Price | 24h Change | Volume (24h) | Status |
|-------|-------|------------|--------------|--------|
| BTC | $48,250 | +3.2% ↑ | $32B | 🟡 Watch |
| ETH | $2,680 | -1.1% ↓ | $15B | 🟢 Normal |
| SOL | $108.50 | +7.8% ↑ | $4.2B | 🟠 Caution |

## 🚨 Alerts
🔴 **SOL Volume Spike:** 220% above 7-day average
🟡 **BTC Breaking Resistance:** Testing $48,500 level

## Market Sentiment
**Overall:** Cautiously Bullish (65% confidence)

**Key News:**
- SEC announced new framework for crypto ETFs (positive)
- Major DeFi protocol on Solana reached $1B TVL

## Risk Assessment
**Bullish Factors:**
- Institutional buying pressure increasing
- Regulatory clarity improving

**Bearish Risks:**
- SOL pump might be overextended
- BTC facing strong resistance

**Recommendation:** Watch SOL for potential pullback. BTC looks strong above $48k.
```

---

## 🛠️ Tools Integration

### Tools Được Sử Dụng
| Tool | Purpose | When to Use |
|------|---------|-------------|
| Web Search | Lấy real-time prices và news | Mỗi lần chạy |
| Web Fetch | (Optional) Lấy data từ CoinGecko API | Nếu cần precise data |

### Tool Chain Flow
```
[User Input] → [Web Search: Prices] → [Web Search: News] → [Analysis] → [Sentinel Report]
```

---

## ⚠️ Common Pitfalls

### Pitfall 1: Relying on Single Source
**What:** Chỉ dùng 1 nguồn giá hoặc news
**Why it happens:** Nhanh hơn nhưng không accurate
**How to avoid:** Cross-reference ít nhất 2 sources

### Pitfall 2: Overreacting to Noise
**What:** Panic với mỗi price swing nhỏ
**Why it happens:** Crypto volatile by nature
**How to avoid:** Focus vào >5% moves và volume spikes

### Pitfall 3: Ignoring Timeframes
**What:** Confuse 1h change với daily trend
**Why it happens:** Không specify timeframe rõ ràng
**How to avoid:** Luôn note timeframe (24h, 7d, 30d)

---

## 🛡️ Safety Notes

### ⚠️ Limitations
- **NOT financial advice:** Đây chỉ là tool phân tích, không phải recommendation để buy/sell
- **Data delay:** Web search data có thể delayed 15-30 phút
- **Can't predict:** Không thể dự đoán future prices, chỉ analyze current conditions

### 🚫 Don't Do This
- Don't dùng alerts để FOMO vào trades
- Don't ignore fundamental analysis
- Don't risk money bạn không thể afford to lose

### 💰 Cost Implications
- **Free tier:** Sử dụng web search (no cost)
- **API tier:** Nếu dùng CoinGecko Pro API (~$79/month cho high frequency)

### 🔒 Data Privacy
- Web search queries có thể logged bởi search engine
- Không nhập private keys hoặc wallet info vào template

---

## 📊 Expected Output

### Format
Markdown report với bảng, alerts và assessment

### Quality Criteria
Output tốt nếu:
- [ ] Prices accurate (±2% của major exchanges)
- [ ] News relevant và recent (trong 24h)
- [ ] Alerts có actionable context
- [ ] Risk assessment balanced (không quá bullish/bearish)

---

## 🎓 Pro Tips

1. **Set Regular Scans:** Schedule chạy mỗi 4-6 giờ trong ngày trading
2. **Create Watchlists:** Tạo lists cho different categories (Layer 1s, DeFi, Meme coins)
3. **Log Your Analysis:** Lưu reports để track accuracy over time
4. **Combine with TA:** Dùng kết hợp với technical analysis templates

---

## 🔄 Variations

### Variation 1: DeFi Sentinel
**Use case:** Focus vào DeFi tokens và protocols
**Changes:** Track TVL, yield rates, protocol announcements

### Variation 2: News-Only Mode
**Use case:** Chỉ cần biết breaking news, không care giá
**Changes:** Skip price scan, focus 100% on sentiment

### Variation 3: Whale Watch
**Use case:** Monitor large transactions và whale movements
**Changes:** Add blockchain explorer integration, track large transfers

---

## 📚 Related Templates

- [PMBOK Master](./PMBOKMaster.md) - Quản lý portfolio projects
- [Research Template](../RESEARCH_TEMPLATE.md) - Deep dive vào specific coins

---

## 🐛 Troubleshooting

### Issue: Prices không chính xác
**Symptoms:** Large discrepancies với exchange prices
**Solution:** Specify "CoinMarketCap" hoặc "CoinGecko" trong search query

### Issue: News outdated
**Symptoms:** Stories từ nhiều ngày trước
**Solution:** Add "today" hoặc "last 24 hours" vào search query

### Issue: Too many false alerts
**Symptoms:** Alert fatigue từ minor movements
**Solution:** Tăng threshold từ 5% lên 8-10%

---

## 📝 Changelog

### v2.0.0 - 2026-02-12
- ✅ Council approved version
- Added comprehensive metadata block
- Added safety notes và limitations
- Expanded example usage với full report format
- Added troubleshooting section
- Added variations cho different use cases

### v1.0.0 - Original
- Basic crypto monitoring functionality

---

## ✅ Council Approval Stamp

**Status:** ✅ Approved
**Date:** 2026-02-12
**Version Approved:** 2.0.0

**Scores:**
| Criteria | Score |
|----------|-------|
| Clarity | 9/10 |
| Actionability | 9/10 |
| Completeness | 10/10 |
| Currentness | 10/10 |
| Safety | 10/10 |
| Tools Integration | 8/10 |
| **OVERALL** | **9.3/10** |

**Approved by:**
- [x] 🏗️ Template Architect
- [x] 🎯 Domain Expert (Finance)
- [x] 🎨 UX Engineer
- [x] ✅ Practicality Auditor
- [x] 📝 Version Control Lead

**Notes:** Excellent improvement from v1. Safety notes và financial disclaimers appropriately prominent.
