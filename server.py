import json
import settings

from klein import Klein
from storage import Storage

app = Klein()
storage = Storage(settings.REDIS_HOST, settings.REDIS_PORT, settings.REDIS_PWD)


@app.route('/')
def counter(request):
    """
    Base endpoint to get current counter value
    :param request:
    :return: JSON representation of response
    """
    return json.dumps({"counter": int(storage.read())})


@app.route('/increment', methods=['POST'])
def increment(request):
    """
    Endpoint to increment the counter
    :param request:
    :return: JSON representation of response
    """
    return json.dumps({"counter": int(storage.incr())})


@app.route('/increment', methods=['DELETE'])
def reset(request):
    """
    Endpoint to reset the counter
    :param request:
    :return: JSON representation of response
    """
    return json.dumps({"counter": int(storage.reset())})


if __name__ == "__main__":
    app.run(settings.SERVER_HOST, settings.SERVER_PORT)
