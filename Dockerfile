FROM python:3.12-slim

WORKDIR /app

# Install uv for fast Python package management
RUN pip install uv

# Copy dependency files first (better caching)
COPY pyproject.toml uv.lock ./

# Install dependencies using uv (creates .venv)
RUN uv sync --frozen

# Copy application code
COPY server.py ./

# Expose port
EXPOSE 7860

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/app/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Run the MCP server
CMD ["python", "server.py"]
