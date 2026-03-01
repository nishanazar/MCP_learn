FROM python:3.12-slim

WORKDIR /app

# Install uv for fast Python package management
RUN pip install uv

# Copy dependency files first (better caching)
COPY pyproject.toml uv.lock ./

# Install dependencies using uv
RUN uv sync --frozen

# Copy application code
COPY server.py ./

# Expose port for HTTP transport (if needed)
EXPOSE 7860

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the MCP server
CMD ["python", "server.py"]
