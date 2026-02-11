# Crypto Sentinel Logic

The agent monitors live price feeds from major exchanges. 
When a threshold is met (e.g., 5% change in 1 hour), it triggers an evaluation of social sentiment.
If sentiment aligns with the price action (e.g., price drop + high fear index), it sends an 'Actionable Warning'.

## Sentiment Scoring
- High Positive: > 0.8
- Bearish Divergence: Price Up / Sentiment Down
- Capitulation Watch: Price Down / Extreme Fear
