function main(){

  console.log("main");
  Notification.requestPermission().then(function(result) {
    console.log('CLIENT: Notification', result);
    if (result === 'denied') {
       console.log('Permission wasn\'t granted. Allow a retry.');
       return;
     }
     if (result === 'default') {
       console.log('The permission request was dismissed.');
       return;
     }
  });

  if ('serviceWorker' in navigator && 'PushManager' in window) {
    console.log('Service Worker and Push is supported');
    var worker = navigator.serviceWorker.register('/sw.js', { scope: '/' }).then(function(registration) {
      console.log('ServiceWorker registration successful with scope: ', registration);
          
        // add sync events
        registration.sync.register("hello").then(function(){
           console.log("CLIENT: sync");
        });

    }, function(err) {
      console.log('ServiceWorker registration failed: ', err.message, err);
    });
  };
}

$(document).ready(main);
