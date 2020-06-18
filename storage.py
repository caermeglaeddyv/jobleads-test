import redis


class Storage:
    _key = "upfront-task:counter"

    def __init__(self, host, port, password=None):
        self._redis = redis.Redis(host=host, port=port, password=password)

    def incr(self, amount=1):
        return self._redis.incrby(Storage._key, amount)

    def read(self):
        value = self._redis.get(Storage._key)

        return value if value else 0

    def reset(self):
        self._redis.set(Storage._key, 0)

        return 0
