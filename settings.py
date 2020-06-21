import os

# Server settings
SERVER_HOST = os.environ.get("SERVER_HOST", "0.0.0.0")
SERVER_PORT = os.environ.get("SERVER_PORT", 8080)

# Redis settings
REDIS_HOST = os.environ.get("REDIS_HOST", "localhost")
REDIS_PORT = os.environ.get("REDIS_PORT", 6379)
REDIS_PWD = os.environ.get("REDIS_PWD", "")

# Sentinel settings
SENTINEL_HOST = os.getenv("SENTINEL_HOST", "")
SENTINEL_PORT = os.getenv("SENTINEL_PORT", 26379)
SENTINEL_PWD = os.environ.get("SENTINEL_PWD", "")
SENTINEL_MASTER_GROUP = os.getenv("SENTINEL_NASTER_GROUP", "redis-ha")
