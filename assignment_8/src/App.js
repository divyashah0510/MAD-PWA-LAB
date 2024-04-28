import { useEffect } from "react";
import { getToken } from "firebase/messaging";
import { messaging } from "./firebase";

const vapidKey =
  "BH_hk3kVEc1P41MjASaJJ311RwFJz_lMQ8OecEOUrvxCfRhIouw1YQmxHXyMHu0Us9DvTUR3uZ0KWdfY6v0OboI"; // Add your VAPID public key here

const requestPushPermission = async () => {
  try {
    const token = await getToken(messaging, {
      vapidKey,
    });
    console.log("Push notification token:", token);
  } catch (error) {
    console.error("Failed to get push notification token:", error);
  }
};

const App = () => {
  useEffect(() => {
    requestPushPermission();
  }, []);

  return <h1>Welcome to My App</h1>;
};

export default App;
