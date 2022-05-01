import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top/index.vue";
import Terms from "../pages/static/Terms.vue";
import Policy from "../pages/static/Policy.vue";
import Result from "../pages/result/Result.vue";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      name: "TopIndex",
      component: TopIndex,
    },
    {
      path: "/result",
      name: "Result",
      component: Result,
    },
    {
      path: "/terms",
      name: "Terms",
      component: Terms,
    },
    {
      path: "/policy",
      name: "Policy",
      component: Policy,
    },
  ],
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { x: 0, y: 0 };
    }
  },
});

export default router;
