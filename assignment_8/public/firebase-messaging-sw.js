// public/firebase-messaging-sw.js
importScripts(
  "https://www.gstatic.com/firebasejs/9.15.0/firebase-app-compat.js"
);
importScripts(
  "https://www.gstatic.com/firebasejs/9.15.0/firebase-messaging-compat.js"
);

const firebaseConfig = {
  apiKey: "AIzaSyAhtpDu9-g0RyaJSK5so9ERHc7pONiPaXM",
  authDomain: "fir-cloud-messaging-5ac04.firebaseapp.com",
  projectId: "fir-cloud-messaging-5ac04",
  storageBucket: "fir-cloud-messaging-5ac04.appspot.com",
  messagingSenderId: "862218974470",
  appId: "1:862218974470:web:19c3000d48b8f6c0099a87",
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// Listen for messages in the service worker
messaging.onBackgroundMessage((payload) => {
  console.log("Received background notification:", payload);

  const { title, body } = payload.notification;

  const notificationOptions = {
    body,
    icon: "./logo192.png", // Adjust to your icon path
  };

  self.registration.showNotification(title, notificationOptions);
});
