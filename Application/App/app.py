from flask import Flask
import os
import socket
import requests

app = Flask(__name__)

def get_task_metadata():
    metadata_url = os.environ.get("ECS_CONTAINER_METADATA_URI_V4")
    if metadata_url:
        try:
            response = requests.get(f"{metadata_url}/task")
            return response.json()
        except Exception:
            return None
    return None

@app.route("/")
def hello():
    hostname = socket.gethostname()
    metadata = get_task_metadata()

    task_arn = metadata.get("TaskARN") if metadata else "Metadata not available"

    app_env = os.environ.get("APP_ENV")
    if app_env:
        app_env = app_env.lower()
    else:
        app_env = "dev"

    if app_env == "prod":
        env_message = "HELLO from PROD 🚀"
    else:
        env_message = "Hello from DEV 🛠️"

    return f"""
    <h1>{env_message}</h1>
    <p><b>Container Hostname:</b> {hostname}</p>
    <p><b>Task ARN:</b> {task_arn}</p>
    <p><b>APP_ENV:</b> {app_env}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)