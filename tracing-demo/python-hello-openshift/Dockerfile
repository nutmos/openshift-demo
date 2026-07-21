# --- Stage 1: Build & Install Dependencies ---
FROM --platform=arm64 python:3.12-slim AS builder

# Install uv from the official container registry
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set working directory and configuration
WORKDIR /app
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Copy only dependency definitions first to maximize Docker layer caching
COPY pyproject.toml uv.lock ./

# Install dependencies into a virtual environment (.venv)
RUN uv sync --frozen --no-install-project --no-dev

# --- Stage 2: Final Runtime ---
FROM python:3.12-slim

WORKDIR /app

# Copy the pre-installed virtual environment and application code
COPY --from=builder /app/.venv /app/.venv
COPY . /app

# Ensure the virtual environment's binaries are preferred in PATH
ENV PATH="/app/.venv/bin:$PATH"

# Expose the application port
EXPOSE 8000

# Run FastAPI using its modern production CLI launcher
CMD ["fastapi", "run", "app/main.py", "--port", "8000", "--host", "0.0.0.0"]