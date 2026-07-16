#!/bin/bash

# Fichier des alertes Snort
ALERT_FILE="/var/log/snort/alert"

# Adresse e-mail du destinataire
EMAIL="damdele.snort@gmail.com"

# Vérifier que le fichier existe
if [ ! -f "$ALERT_FILE" ]; then
    echo "Erreur : le fichier $ALERT_FILE n'existe pas."
    exit 1
fi

# Surveiller les nouvelles alertes
tail -F "$ALERT_FILE" | while read -r line
do
mail -s "🚨 Alerte IDS Snort" "$EMAIL" <<EOF
Alert Snort Detect.

Date : $(date)

Alerte :
$line

Serveur : $(hostname)
EOF

done
