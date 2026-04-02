"""Thumbnail-Metadata-Engine — API entrypoint."""

from fastapi import FastAPI

app = FastAPI(
    title="Thumbnail & Metadata Engine",
    version="0.1.0",
)


@app.get("/health")
async def health():
    return {"status": "ok"}
