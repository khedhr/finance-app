#!/bin/sh
# Builds the standalone app (index.html) and the Android copy (www/index.html)
# from the page source. Usage: ./build.sh path/to/page-source.html
set -e
SRC="${1:-index.src.html}"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<link rel="manifest" href="manifest.webmanifest">\n<meta name="theme-color" content="#0f6b5c">\n<link rel="apple-touch-icon" href="icons/apple-touch-icon.png">\n<meta name="apple-mobile-web-app-capable" content="yes">\n<meta name="mobile-web-app-capable" content="yes">\n<meta name="apple-mobile-web-app-title" content="Pocket Ledger">\n<meta name="apple-mobile-web-app-status-bar-style" content="default">\n'
  sed '/^<div class="wrap">/,$d' "$SRC"
  printf '</head>\n<body>\n'
  sed -n '/^<div class="wrap">/,$p' "$SRC"
  printf '<script>if ("serviceWorker" in navigator && location.protocol === "https:" && !(window.Capacitor && window.Capacitor.isNativePlatform && window.Capacitor.isNativePlatform())) navigator.serviceWorker.register("sw.js").catch(function () {});</script>\n'
  printf '</body>\n</html>\n'
} > index.html
cp index.html www/index.html
