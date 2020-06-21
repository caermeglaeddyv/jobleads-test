import redis


class SingleRedis:
    _key = "upfront-task:counter"

    def __init__(self, host, port, password=None):
        self._redis = redis.Redis(host=host, port=port, password=password)

    def incr(self, amount=1):
        return self._redis.incrby(SingleRedis._key, amount)

    def read(self):
        value = self._redis.get(SingleRedis._key)

        return value if value else 0

    def reset(self):
        self._redis.set(SingleRedis._key, 0)

        return 0

class SentinelRedis:
    _key = "upfront-task:counter"

    def __init__(self, host, port, master_group, password=None):
        self._sentinel = redis.Sentinel([(host, port, password)], socket_timeout=0.1)
        self._master = self._sentinel.master_for(master_group, socket_timeout=0.1)
        self._slave = self._sentinel.slave_for(master_group, socket_timeout=0.1)

    def incr(self, amount=1):
        return self._master.incrby(SentinelRedis._key, amount)

    def read(self):
        value = self._slave.get(SentinelRedis._key)

        return value if value else 0

    def reset(self):
        self._master.set(SentinelRedis._key, 0)

        return 0
