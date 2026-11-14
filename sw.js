// Keeps Pocket Ledger working offline. Network first, so updates show up as soon as you're online.
const CACHE = "pocket-ledger-v2";
const FILES = ["./", "./index.html", "./manifest.webmanifest", "./icons/icon-192.png", "./icons/icon-512.png", "./icons/apple-touch-icon.png"];
self.addEventListener("install", e => { e.waitUntil(caches.open(CACHE).then(c => c.addAll(FILES.map(f => new Request(f, { cache: "reload" }))))); self.skipWaiting(); });
self.addEventListener("activate", e => { e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== CACHE).map(k => caches.delete(k))))); self.clients.claim(); });
self.addEventListener("fetch", e => {
  if (e.request.method !== "GET") return;
  // Always ask the server for the newest copy of our own files, so updates show on the next open
  const own = new URL(e.request.url).origin === location.origin;
  e.respondWith(fetch(own ? e.request.url : e.request, own ? { cache: "no-cache", credentials: "same-origin" } : undefined).then(r => {
    if (r.ok && new URL(e.request.url).origin === location.origin) { const copy = r.clone(); caches.open(CACHE).then(c => c.put(e.request, copy)); }
    return r;
  }).catch(() => caches.match(e.request).then(m => m || caches.match("./index.html"))));
});
