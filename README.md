# NAGRIKLENS -AI powered civic issue reporter

# NagrikLens

AI-powered civic issue reporting and monitoring platform.

NagrikLens connects citizens with authorities by allowing citizens to report
local civic problems and helping authorities analyze, prioritize, and track
those issues.

## How It Works

### Citizens

- Submit a civic issue with a description, image, and location.
- View their complaint history.
- Track complaint status and resolution progress.

### Authorities

- View and manage reported complaints.
- Monitor issue hotspots on a map.
- Receive AI-assisted insights and recommendations.
- Update complaint status as action is taken.

## Tech Stack

- **Backend:** Python, FastAPI, Pydantic, Uvicorn
- **Database:** PostgreSQL via Supabase
- **Frontend:** React _(planned)_
- **AI:** AI/LLM-based issue analysis _(planned)_
- **Tools:** Git, GitHub

<img width="1545" height="842" alt="image" src="https://github.com/user-attachments/assets/d0aa29a5-69bd-4a20-98da-56cd195554e3" />
## Architecture

```text
Citizen
   │
   ▼
FastAPI Backend
   │
   ├── AI Analysis
   │
   └── PostgreSQL
          │
          ▼
   Authority Dashboard
          │
          ├── Hotspots
          ├── Recommendations
          └── Complaint Management
```

<img width="1536" height="1024" alt="ChatGPT Image Sep 29, 2026, 10_29_27 PM" src="https://github.com/user-attachments/assets/1a72dfbd-e9f2-40f5-8f71-04a8534f6fd8" />
