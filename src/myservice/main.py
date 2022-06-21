import logging
from typing import Union

from fastapi import APIRouter, FastAPI

from .settings import settings

logger = logging.getLogger(__name__)

app = FastAPI(
    title="myservice",
    description="A short description of your great service",
    version="0.1.0",
    debug=settings.debug,
)

router = APIRouter()


@router.get("/")
def read_root():
    return {"Hello": "World"}


@router.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


app.include_router(router, prefix="/v1")

logger.info(f"👋 MyService {app.version} load complete, booting server")
