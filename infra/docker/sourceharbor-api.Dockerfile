FROM python:3.12-slim-bookworm

ARG BREWME_WHEEL
ARG BREWME_VERSION=0.1.17
ARG BREWME_VCS_REF=unknown
ARG BREWME_BUILD_DATE=unknown

LABEL org.opencontainers.image.title="BrewMe API"
LABEL org.opencontainers.image.description="Public API image for BrewMe's FastAPI surface."
LABEL org.opencontainers.image.url="https://github.com/xiaojiou176-open/brewme"
LABEL org.opencontainers.image.documentation="https://github.com/xiaojiou176-open/brewme/tree/main/docs"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.source="https://github.com/xiaojiou176-open/brewme"
LABEL org.opencontainers.image.vendor="BrewMe Maintainers"
LABEL org.opencontainers.image.version="${BREWME_VERSION}"
LABEL org.opencontainers.image.revision="${BREWME_VCS_REF}"
LABEL org.opencontainers.image.created="${BREWME_BUILD_DATE}"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    SOURCE_HARBOR_RUNTIME_ROOT=/opt/brewme-runtime \
    SOURCE_HARBOR_CACHE_ROOT=/var/lib/brewme \
    PIPELINE_ARTIFACT_ROOT=/var/lib/brewme/artifacts \
    SQLITE_STATE_PATH=/var/lib/brewme/state/api_state.db \
    DATABASE_URL=postgresql+psycopg://brewme:brewme@postgres:5432/brewme \
    TEMPORAL_TARGET_HOST=temporal:7233 \
    TEMPORAL_NAMESPACE=default \
    TEMPORAL_TASK_QUEUE=brewme-worker \
    APP_VERSION=${BREWME_VERSION}

WORKDIR /opt/brewme-runtime

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /var/lib/brewme/state /var/lib/brewme/artifacts /opt/brewme-runtime/scripts

COPY ${BREWME_WHEEL} /tmp/
COPY config /opt/brewme-runtime/config
COPY scripts/runtime /opt/brewme-runtime/scripts/runtime

RUN python -m pip install --no-cache-dir "/tmp/${BREWME_WHEEL}" \
  && rm -f "/tmp/${BREWME_WHEEL}" \
  && python - <<'PY'
from __future__ import annotations

import shutil
import site
from pathlib import Path

for root in [Path(path) for path in site.getsitepackages()]:
    for relative in (
        "apps/web",
        "apps/worker",
        "apps/api/tests",
        "apps/mcp/tests",
    ):
        target = root / relative
        if target.exists():
            shutil.rmtree(target)
    for cache_dir in root.rglob("__pycache__"):
        if cache_dir.is_dir():
            shutil.rmtree(cache_dir)
PY

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -fsS http://127.0.0.1:8000/healthz || exit 1

CMD ["python", "-m", "uvicorn", "apps.api.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
