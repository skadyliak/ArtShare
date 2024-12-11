import { createRouter, createWebHashHistory } from "vue-router";
import MainPage from "./components/MainPage.vue";
import ContactsPage from "./components/ContactsPage.vue";
import AddPost from "./components/AddPost.vue";
import ViewPosts from "./components/ViewPosts.vue";

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    { path: "/", component: MainPage },
    { path: "/contacts", component: ContactsPage },
    { path: "/add_post", component: AddPost },
    { path: "/view_posts", component: ViewPosts },
  ],
});

router.afterEach(() => {
  window.scrollTo(0, 0);
});

export default router;
