# Deployment Guide for VibesBNB Signup Site

This guide explains how to push the signup site to the separate GitHub repository and deploy it.

## Prerequisites

- Git installed
- GitHub account with access to `https://github.com/impactxg-gnez/vibesbnb-signup`
- Node.js 18+ installed

## Initial Setup

### 1. Initialize Git Repository

If the signup folder is not already a git repository:

```bash
cd signup
git init
```

### 2. Add Remote Repository

```bash
git remote add origin https://github.com/impactxg-gnez/vibesbnb-signup.git
```

Or if you prefer SSH:

```bash
git remote add origin git@github.com:impactxg-gnez/vibesbnb-signup.git
```

### 3. Check Current Branch

```bash
git branch
```

If you need to create and switch to main branch:

```bash
git checkout -b main
```

## First Push

### 1. Stage All Files

```bash
git add .
```

### 2. Commit Changes

```bash
git commit -m "Initial commit: VibesBNB signup site"
```

### 3. Push to Repository

```bash
git push -u origin main
```

If the remote repository already has content, you may need to force push (use with caution):

```bash
git push -u origin main --force
```

## Subsequent Updates

After making changes:

```bash
# Stage changes
git add .

# Commit
git commit -m "Description of changes"

# Push
git push
```

## Vercel Deployment

### Option 1: Connect via Vercel Dashboard

1. Go to [vercel.com](https://vercel.com)
2. Import the repository: `impactxg-gnez/vibesbnb-signup`
3. Configure:
   - **Framework Preset**: Next.js
   - **Root Directory**: `./` (root)
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next`
4. Add environment variables:
   - `NEXT_PUBLIC_API_URL`
   - `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`
5. Deploy!

### Option 2: Deploy via Vercel CLI

```bash
# Install Vercel CLI globally
npm install -g vercel

# Login to Vercel
vercel login

# Deploy (from signup directory)
cd signup
vercel

# For production deployment
vercel --prod
```

## Environment Variables

Make sure to set these in Vercel:

- `NEXT_PUBLIC_API_URL` - Your API endpoint URL
- `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` - Google Maps API key

## Files Included

The following files are included in this repository:

- `/src/app/coming-soon/page.tsx` - Landing page
- `/src/app/early-access/page.tsx` - Signup forms
- `/src/app/thank-you/page.tsx` - Confirmation page
- `/src/lib/api.ts` - API client
- `/src/types/google-maps.d.ts` - Type definitions
- `/package.json` - Dependencies
- `/next.config.ts` - Next.js configuration
- `/tailwind.config.js` - Tailwind CSS configuration
- `/tsconfig.json` - TypeScript configuration

## Notes

- This is a standalone project separate from the main VibesBNB application
- Only signup-related pages are included
- The main site development continues in the main repository

