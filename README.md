# VibesBNB Signup Site

A standalone Next.js application for the VibesBNB early access signup experience.

## Features

- **Coming Soon Page** - Landing page with countdown timer and category selection
- **Early Access Signup** - Multi-category signup forms (Host, Traveller, Service Host, Dispensary)
- **Thank You Page** - Post-signup confirmation with confetti animation
- **Google Places Integration** - Location autocomplete for hosts and dispensaries
- **Responsive Design** - Mobile-first design with Tailwind CSS

## Getting Started

### Prerequisites

- Node.js 18+
- npm or yarn

### Installation

```bash
# Install dependencies
npm install

# Copy environment variables
cp .env.example .env.local

# Edit .env.local with your API keys
```

### Environment Variables

Create a `.env.local` file with:

```
NEXT_PUBLIC_API_URL=https://your-api-url.com
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

### Development

```bash
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000)

### Build

```bash
npm run build
npm run start
```

## Project Structure

```
signup/
├── src/
│   ├── app/
│   │   ├── coming-soon/      # Landing page
│   │   ├── early-access/     # Signup forms
│   │   ├── thank-you/        # Confirmation page
│   │   ├── layout.tsx         # Root layout
│   │   └── page.tsx          # Redirects to coming-soon
│   ├── lib/
│   │   └── api.ts            # API client
│   └── types/
│       └── google-maps.d.ts   # Google Maps type definitions
└── public/
```

## Pages

- `/` - Redirects to `/coming-soon`
- `/coming-soon` - Main landing page with countdown and category cards
- `/early-access?category=host|traveller|service_host|dispensary` - Signup forms
- `/thank-you?category=...` - Post-signup confirmation

## Deployment

This project is configured for deployment on Vercel. The repository is separate from the main VibesBNB application.

### Deploy to Vercel

1. Connect this repository to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy!

## License

Proprietary - All rights reserved.
