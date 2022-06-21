import logging

from pydantic import BaseSettings

logger = logging.getLogger(__name__)


class Settings(BaseSettings):
    # List all your configuration envars here.
    # In case any of them are missing, service won't boot.

    debug: bool = False

settings = Settings()

if settings.debug:
    logging.basicConfig(level=logging.DEBUG)  # pragma: no cover

logger.info(f"👋 MyService starting with settings {settings}")
