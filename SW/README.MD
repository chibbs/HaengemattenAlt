# Service Worker Example

## Demo

1. Setup local server
`python3 -m http.server 8000`

2. browse to http://localhost:8000/sw.html

3. go offline via dev tools

![](offline.png)

4. click on `a.html` link
You should see one (the left) of the two pictures, cause just one was already download and cached via ServiceWorker.

5. Push (optional)
![](push.png)
Send a push notification via dev tools.
api works and no errors, but didn't show up :(
