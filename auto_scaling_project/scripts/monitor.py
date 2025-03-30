import requests

def check_connections():
    response = requests.get("http://localhost/nginx_status")
    active_connections = int(response.text.split("\n")[0].split(":")[-1].strip())
    return active_connections

if __name__ == "__main__":
    connections = check_connections()
    print(f"Active Connections: {connections}")
