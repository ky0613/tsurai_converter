<template>
  <div id="app" class="bg-gray-400">
    <p class="text-6xl text-red-500">{{ message }}</p>
    <p class="text-6xl text-blue-900">デプロイできたよ</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
    };
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
