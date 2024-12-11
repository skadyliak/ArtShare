import { createApp } from "vue";
import router from "./router";
import App from "./App.vue";
import axios from "axios";

axios.defaults.baseURL = "http://localhost:3000/";

const app = createApp(App);
app.use(router);

app.mount("#app");
