<template>
  <div id="app">
    <body class="flex flex-col min-h-screen">
      <TheHeader />
      <main class="flex flex-1">
        <div class="m-auto w-full">
          <router-view />
        </div>
      </main>
      <TheFooter />
    </body>
  </div>
</template>

<script>
import TheHeader from "./components/TheHeader";
import TheFooter from "./components/TheFooter";

export default {
  components: {
    TheHeader,
    TheFooter,
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
