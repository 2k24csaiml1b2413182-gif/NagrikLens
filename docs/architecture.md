# NagrikLens — System Architecture

## 1. Overview

NagrikLens is a multilingual citizen-demand intelligence and infrastructure prioritization platform.

It transforms citizen requests into structured development needs, identifies demand hotspots, combines citizen demand with infrastructure and demographic data, and produces explainable project priorities for policymakers.

## 2. Core Pipeline

Citizen Input
↓
Text / Voice / Messaging Input
↓
Language Detection & Translation
↓
AI-based Structured Extraction
↓
Embeddings
↓
Semantic Clustering / Duplicate Detection
↓
Demand Hotspots
↓
Infrastructure + Demographic Context
↓
Transparent Priority Scoring
↓
Ranked Development Recommendations
↓
AI-generated Evidence-based Explanation
↓
Policymaker Dashboard

## 3. Backend

### FastAPI

The backend provides REST APIs for:

- Citizen request submission
- Bulk request ingestion
- NLP processing
- Embedding generation
- Hotspot analysis
- Infrastructure data
- Recommendation generation
- Dashboard data

## 4. Database

### PostgreSQL

The database stores:

- Citizen requests
- Geographic regions
- Infrastructure indicators
- Demographic indicators
- Semantic embeddings
- Request clusters
- Recommendations

### pgvector

pgvector will be used to store and search semantic embeddings.

## 5. AI Layer

Gemini API will be used for:

- Structured extraction from citizen requests
- Language-related processing
- Embedding generation where appropriate
- Natural-language explanation of ranked recommendations

AI will not directly determine the final project ranking.

The ranking will be produced by a transparent deterministic scoring engine.

## 6. Clustering

Semantic embeddings will be used to represent citizen requests.

HDBSCAN will be evaluated for unsupervised clustering of development requests.

Cosine similarity will be used for semantic similarity and duplicate detection rather than being treated as the clustering algorithm itself.

## 7. Priority Scoring

Recommendations will use normalized evidence-based factors such as:

- Citizen demand
- Infrastructure gap
- Population impact
- Urgency
- Equity considerations

Initial weights will be configurable and evaluated through sensitivity analysis.

The score is intended as decision support, not an objective determination of government spending.

## 8. Frontend

### React

The dashboard will provide:

- Citizen request intake
- Geographic hotspot visualization
- Demand statistics
- Infrastructure indicators
- Ranked recommendations
- Recommendation score breakdown
- "Why this recommendation?" evidence panel

### Visualization

- Leaflet for geographic maps
- Recharts for charts and statistics

## 9. Deployment

Backend:

- Docker
- Google Cloud Run

Frontend:

- Vercel

CI/CD:

- GitHub Actions

## 10. Data Provenance

External datasets will record:

- Dataset name
- Source organization
- Source URL
- Collection date
- Geographic resolution
- Data year
- License
- Processing performed

## 11. Privacy

The platform will minimize personally identifiable information.

Citizen identity will not be required for the analytics pipeline unless necessary for a specific use case.

Original citizen input will be preserved while avoiding unnecessary storage of sensitive personal information.

## 12. Evaluation

The system will be evaluated using a labeled test dataset.

Evaluation will cover:

- NLP extraction accuracy
- Classification precision / recall / F1
- Clustering quality
- Duplicate detection precision / recall
- Recommendation ranking behavior
- Explanation relevance and factual grounding

Evaluation data will be collected during development rather than postponed until the final week.
