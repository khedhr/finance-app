# Pocket Ledger

A simple personal finance app that runs in your browser.

- Log expenses and income with a category, date and note
- Add by voice (green mic, uses Android speech recognition in the app) or a quick sentence: "spent 25 on groceries yesterday"
- Smart voice: paste a free Google Gemini key or a Claude key and the AI understands any sentence, in any language, with several entries at once
- See income, spending and what's left for each month
- Charts: spending by category and the last 6 months of income vs spending
- Edit or delete any entry
- Track debts: what you owe and what people owe you, with partial payments
- Savings goals with progress bars

- Filter entries by spending, income or category
- Opens on a chat screen: type or speak, and a side menu leads to Entries, Debts, Savings goals, Charts and Settings
- Daily reminder notification (Android)
- Save a backup file and restore it later
- Currency: US dollar or Iraqi dinar
- Savings category to track money you put aside

Your data is saved in your browser on this device (nothing is sent anywhere).

## Use it

Open https://khedhr.github.io/finance-app/ in any browser.

**iPhone:** open that link in Safari, tap the Share button, then **Add to Home Screen**.

## Making changes

Edit `index.src.html`, then run `./build.sh` to update `index.html` and `www/index.html`.

## Android app

Every update to `main` builds a new Android app automatically.
On your phone, open the [latest download](../../releases/latest), tap **PocketLedger.apk**, and install it.
Android will ask you to allow installing apps from your browser the first time.
