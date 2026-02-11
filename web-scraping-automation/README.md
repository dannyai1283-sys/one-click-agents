# Web Scraping Automation

Browser automation and data extraction using Playwright.

## Features

- **Playwright-based** scraping with multiple browser support
- **Data extraction** utilities for common patterns
- **Screenshot automation** for visual monitoring
- **Change detection** with state tracking
- **Scheduled scraping** with cron integration

## Quick Start

```bash
# Setup
./setup.sh

# Run a scraper
./scrape.sh run scrapers/hacker-news.js

# Take screenshot
./scrape.sh screenshot https://example.com
```

## Included Examples

| Scraper | Description |
|---------|-------------|
| `basic.js` | Basic page scraping |
| `hacker-news.js` | HN top stories |
| `capture.js` | Screenshot utility |

## Project Structure

```
scrapers/       - Scraping scripts
screenshots/    - Screenshot utilities
monitors/       - Change detection
utils/          - Helper functions
storage/        - Data exporters
data/           - Output directory
logs/           - Log files
```

## Requirements

- Node.js 18+
- npm or yarn
- ~500MB disk space for browsers

## Best Practices

1. Respect robots.txt
2. Add delays between requests
3. Handle errors gracefully
4. Store data in structured formats
5. Use proxies for high-volume scraping

## License

MIT
