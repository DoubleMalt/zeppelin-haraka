#!/bin/bash
HARAKA_DIR=/usr/src/app

echo "$HQ_DOMAIN" > "$HARAKA_DIR/me"
echo "$REAL_DOMAIN" > "$HARAKA_DIR/host_list"
echo "dn1=cn=%u,$USER_BASE_DN" >> "$HARAKA_DIR/auth_ldap.ini"

haraka -c "$HARAKA_DIR"
