import os
import redis
from flask import Flask, render_template


app = Flask(__name__)

redis_host = os.environ.get('REDIS_HOST', 'redis')
redis_port = int(os.environ.get('REDIS_PORT', 6379))

r = redis.Redis(host=redis_host, port=redis_port, db=0)

@app.route('/')
def home():
    visitas = r.incr('visitas', amount=1)
    return render_template('index.html', visitas=visitas)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
