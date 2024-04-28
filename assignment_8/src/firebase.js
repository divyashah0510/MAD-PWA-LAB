import { initializeApp } from "firebase/app";
import { getMessaging } from "firebase/messaging";

const firebaseConfig = {
  apiKey: "AIzaSyAhtpDu9-g0RyaJSK5so9ERHc7pONiPaXM",
  authDomain: "fir-cloud-messaging-5ac04.firebaseapp.com",
  projectId: "fir-cloud-messaging-5ac04",
  storageBucket: "fir-cloud-messaging-5ac04.appspot.com",
  messagingSenderId: "862218974470",
  appId: "1:862218974470:web:19c3000d48b8f6c0099a87",
};

const app = initializeApp(firebaseConfig);
export const messaging = getMessaging(app);
