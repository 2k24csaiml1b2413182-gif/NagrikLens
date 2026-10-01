from fastapi import FastAPI,Query
from pydantic import BaseModel
from app.database import test_connection

class Demand(BaseModel):
    text: str
    language: str
    category: str

class DemandResponse(BaseModel):
    message: str
    category: str

app = FastAPI(
    title="NagrikLens API",
    description="Multilingual citizen demand intelligence and infrastructure prioritization platform",
    version="0.1.0",
)


@app.get("/health")
def health_check():
    db_status = test_connection()

    return {
        "status": "ok",
        "database": "connected" if db_status else "disconnected"
    }


@app.get("/api/v1/demands")
def get_demands(
    category: str = "all",
    language: str = "all",
    limit: int = Query(default=10,ge=1,le=100)
):
    return {
        "category": category,
        "language": language,
        "limit": limit,
        "items": [],
        "total": 0,
    }

@app.get("/api/v1/demands/{demand_id}")
def get_demand(demand_id: int):
    return {
        "demand_id": demand_id,
        "message": "Demand found",
    }

@app.post("/api/v1/demands", response_model=DemandResponse)
def create_demand(demand: Demand):
    return {
        "message": demand.text,
        "category": demand.category,
    }