from fastapi import FastAPI

app = FastAPI(
    title="NagrikLens API",
    description="Multilingual citizen demand intelligence and infrastructure prioritization platform",
    version="0.1.0",
)


@app.get("/health")
def health_check():
    return {"status": "ok"}