import requests

WEBHOOK_URL = "https://hooks.slack.com/services/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"

def envoyer_alerte(message):
    payload = {
        "text": f"🚨 *Alerte Snort* 🚨\n{message}"
    }

    requests.post(WEBHOOK_URL, json=payload)

if __name__ == "__main__":
    with open("/var/log/snort/alert", "r") as f:
        lignes = f.readlines()

    if lignes:
        envoyer_alerte(lignes[-1])
