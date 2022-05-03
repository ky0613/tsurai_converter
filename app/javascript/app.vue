<template>
  <div id="app">
    <body class="flex flex-col min-h-screen">
      <TheHeader :isColor="isHeaderColor" />
      <main class="flex flex-1">
        <div class="m-auto w-full">
          <router-view />
        </div>
      </main>
      <component :is="isFooter" />
    </body>
  </div>
</template>

<script>
import TheHeader from "./components/TheHeader";
import TheFooter from "./components/TheFooter";
import ResultFooter from "./components/ResultFooter.vue";

export default {
  components: {
    TheHeader,
    TheFooter,
    ResultFooter,
  },
  computed: {
    isHeaderColor() {
      switch (this.$route.path) {
        case "/":
          return "";
        case "/fire-result":
          return "pink";
        case "/convert-result":
          return "red";
        case "/twin-result":
          return "orange";
      }
    },
    isFooter() {
      switch (this.$route.path) {
        case "/":
          return "TheFooter";
        case "/fire-result":
          return "ResultFooter";
        case "/convert-result":
          return "ResultFooter";
        case "/twin-result":
          return "ResultFooter";
      }
    },
  },
};
</script>

<style scoped>
body {
  background-image: url("../../public/wise-pug-thinking-about-the-world.jpg");
  background-size: cover;
  background-position: top;
  background-repeat: no-repeat;
}
</style>
