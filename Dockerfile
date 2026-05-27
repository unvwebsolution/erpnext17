FROM frappe/erpnext:v17

USER root

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

USER frappe

WORKDIR /home/frappe/frappe-bench

RUN mkdir -p sites && \
    echo '{ \
      "socketio_port": 9000, \
      "redis_cache": "redis://redis-cache:6379", \
      "redis_queue": "redis://redis-queue:6379", \
      "redis_socketio": "redis://redis-socketio:6379" \
    }' > sites/common_site_config.json
