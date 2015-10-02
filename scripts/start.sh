#!/bin/bash
HARAKA_DIR=/usr/src/app

echo "$HQ_DOMAIN" > "$HARAKA_DIR/config/me"
echo "$REAL_DOMAIN" > "$HARAKA_DIR/config/host_list"
echo "dn1=cn=%u,$USER_BASE_DN" >> "$HARAKA_DIR/config/auth_ldap.ini"

cat > "$HARAKA_DIR/config/smtp_forward.ini" <<EOF
host=$FORWARD_HOST
port=$FORWARD_PORT
enable_tls=$FORWARD_USE_TLS
auth_type=plain
auth_user=$FORWARD_HOST_USER
auth_pass=$FORWARD_HOST_PASSWORD
EOF

haraka -c "$HARAKA_DIR"
