#!/bin/bash
# Web Scraping Automation Setup
# Sets up Playwright-based scraping environment

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

check_requirements() {
    log_info "Checking requirements..."
    
    if ! command -v node &> /dev/null; then
        log_error "Node.js is required"
        echo "Install: https://nodejs.org/"
        exit 1
    fi
    
    if ! command -v npx &> /dev/null; then
        log_error "npx is required (comes with npm)"
        exit 1
    fi
    
    log_success "Node.js found: $(node --version)"
}

setup_project() {
    log_info "Setting up scraping project..."
    
    # Create project structure
    mkdir -p scrapers monitors screenshots utils storage data logs
    
    # Initialize npm project
    npm init -y
    
    # Install dependencies
    log_info "Installing Playwright and dependencies..."
    npm install playwright dotenv node-cron
    npm install --save-dev @playwright/test
    
    # Install browsers
    log_info "Installing Playwright browsers..."
    npx playwright install chromium
    
    log_success "Project initialized"
}

create_examples() {
    log_info "Creating example scrapers..."
    
    # Basic scraper
    cat > scrapers/basic.js << 'EOF'
const { chromium } = require('playwright');

async function scrape(url) {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    
    await page.goto(url);
    
    const data = await page.evaluate(() => ({
        title: document.title,
        headings: Array.from(document.querySelectorAll('h1, h2, h3'))
            .map(h => h.textContent.trim()),
        links: Array.from(document.querySelectorAll('a[href]'))
            .map(a => ({ text: a.textContent, href: a.href }))
            .slice(0, 10)
    }));
    
    await browser.close();
    return data;
}

if (require.main === module) {
    const url = process.argv[2] || 'https://example.com';
    scrape(url)
        .then(data => console.log(JSON.stringify(data, null, 2)))
        .catch(console.error);
}

module.exports = { scrape };
EOF
    
    # Hacker News scraper
    cat > scrapers/hacker-news.js << 'EOF'
const { chromium } = require('playwright');

async function scrapeHN() {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    
    await page.goto('https://news.ycombinator.com');
    
    const stories = await page.evaluate(() => {
        const rows = Array.from(document.querySelectorAll('.athing')).slice(0, 10);
        
        return rows.map(row => {
            const titleLine = row.querySelector('.titleline a');
            const subtext = row.nextElementSibling?.querySelector('.subtext');
            
            return {
                rank: row.querySelector('.rank')?.textContent?.replace('.', ''),
                title: titleLine?.textContent,
                url: titleLine?.getAttribute('href'),
                points: subtext?.querySelector('.score')?.textContent,
                author: subtext?.querySelector('.hnuser')?.textContent,
            };
        });
    });
    
    await browser.close();
    return stories;
}

if (require.main === module) {
    scrapeHN()
        .then(stories => {
            console.log('Top Hacker News Stories:');
            console.log('=' .repeat(50));
            stories.forEach(s => {
                console.log(`${s.rank}. ${s.title}`);
                console.log(`   ${s.points} by ${s.author}`);
                console.log('');
            });
        })
        .catch(console.error);
}

module.exports = { scrapeHN };
EOF
    
    # Screenshot utility
    cat > screenshots/capture.js << 'EOF'
const { chromium } = require('playwright');

async function capture(url, outputPath = 'screenshot.png') {
    const browser = await chromium.launch();
    const page = await browser.newPage();
    
    await page.goto(url, { waitUntil: 'networkidle' });
    
    await page.screenshot({
        path: outputPath,
        fullPage: true
    });
    
    await browser.close();
    console.log(`Screenshot saved to ${outputPath}`);
}

if (require.main === module) {
    const url = process.argv[2];
    const output = process.argv[3] || 'screenshot.png';
    
    if (!url) {
        console.log('Usage: node screenshots/capture.js <url> [output.png]');
        process.exit(1);
    }
    
    capture(url, output).catch(console.error);
}

module.exports = { capture };
EOF
    
    log_success "Example scrapers created"
}

create_utils() {
    log_info "Creating utility modules..."
    
    # Retry utility
    cat > utils/retry.js << 'EOF'
async function withRetry(fn, maxRetries = 3, delay = 1000) {
    for (let attempt = 1; attempt <= maxRetries; attempt++) {
        try {
            return await fn();
        } catch (error) {
            if (attempt === maxRetries) throw error;
            console.log(`Attempt ${attempt} failed, retrying in ${delay}ms...`);
            await new Promise(r => setTimeout(r, delay));
            delay *= 2;
        }
    }
}

module.exports = { withRetry };
EOF
    
    # JSON exporter
    cat > storage/json-exporter.js << 'EOF'
const fs = require('fs').promises;
const path = require('path');

async function exportToJson(data, filename) {
    const timestamp = new Date().toISOString().split('T')[0];
    const filepath = path.join('./data', `${filename}-${timestamp}.json`);
    
    await fs.mkdir('./data', { recursive: true });
    await fs.writeFile(filepath, JSON.stringify(data, null, 2));
    
    return filepath;
}

module.exports = { exportToJson };
EOF
    
    log_success "Utilities created"
}

create_cli() {
    log_info "Creating CLI script..."
    
    cat > scrape.sh << 'EOF'
#!/bin/bash
# Web Scraping CLI

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

usage() {
    echo "Usage: $0 {run|screenshot|schedule} [options]"
    echo ""
    echo "Commands:"
    echo "  run <scraper.js>     Run a scraper"
    echo "  screenshot <url>    Take screenshot of URL"
    echo "  schedule            Show scheduled tasks"
    echo ""
    echo "Examples:"
    echo "  $0 run scrapers/hacker-news.js"
    echo "  $0 screenshot https://example.com page.png"
}

case "${1:-}" in
    run)
        if [ -z "${2:-}" ]; then
            echo "Error: Specify scraper file"
            usage
            exit 1
        fi
        node "$2"
        ;;
    screenshot)
        if [ -z "${2:-}" ]; then
            echo "Error: Specify URL"
            usage
            exit 1
        fi
        node screenshots/capture.js "$2" "${3:-screenshot.png}"
        ;;
    schedule)
        echo "Scheduled tasks:"
        crontab -l 2>/dev/null | grep -E "(scraper|monitor)" || echo "No scheduled tasks found"
        ;;
    *)
        usage
        exit 1
        ;;
esac
EOF
    chmod +x scrape.sh
    
    log_success "CLI created"
}

main() {
    echo "========================================"
    echo "  Web Scraping Automation Setup"
    echo "========================================"
    echo ""
    
    check_requirements
    setup_project
    create_examples
    create_utils
    create_cli
    
    echo ""
    log_success "Web scraping automation configured! 🌐"
    echo ""
    echo "Next steps:"
    echo "  - Run example: ./scrape.sh run scrapers/hacker-news.js"
    echo "  - Take screenshot: ./scrape.sh screenshot https://example.com"
    echo "  - Edit scrapers in scrapers/ directory"
    echo ""
    echo "Project structure:"
    echo "  scrapers/     - Scraping scripts"
    echo "  screenshots/  - Screenshot utilities"
    echo "  utils/        - Helper functions"
    echo "  storage/      - Data export utilities"
    echo "  data/         - Scraped data output"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/web-scraping-automation/setup.sh
