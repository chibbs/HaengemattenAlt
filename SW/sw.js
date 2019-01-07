var CACHE_NAME = 'my-site-cache-v6';
var urlsToCache = [
  '/',
  '/index.html',
  '/main.js',
  '/sw.css',
  '/a.html',
  '/b.html',
  'images/P1230904.JPG',
  'images/cat.svg',
  'images/favicon.ico',
  'images/example.png'
];

self.addEventListener("install", function(event) {
  console.log('WORKER: install event in progress.');

  event.waitUntil(
    caches
      .open(CACHE_NAME)
      .then(function(cache) {
        return cache.addAll(urlsToCache);
      })
      .then(function() {
        console.log('WORKER: install completed');
      })
  );
});

self.addEventListener('activate', function(event) {
  console.log('WORKER: activate event in progress.', event);
});

self.addEventListener('fetch', function(event) {
  console.log('WORKER: fetch new event in progress.', event.request.url);
  const url = new URL(event.request.url);

  // serve the cat SVG from the cache if the request is
  // same-origin and the path is '/dog.svg'
  if (url.origin == location.origin && url.pathname == '/images/dog.svg') {
	console.log('WORKER: get cat image from cache instead of dog image');
	event.respondWith(caches.match('images/cat.svg'));
  } else {
  
  event.respondWith(
    caches.match(event.request)
      .then(function(response) {
        if (response) { // Cache hit - return response
          return response;
        } else {
          return fetch(event.request);
        }
      }
    )
  );
  }
});

// self.addEventListener('sync', function(event) {
//   console.log('WORKER: sync event in progress.', event);
// });

self.addEventListener('push', function(event) {
  console.log('WORKER: push event in progress.', event);

  event.waitUntil(self.registration.showNotification('Hello ', {
     body: event.data.text(),
     icon: 'images/favicon.ico'
  }));
});
