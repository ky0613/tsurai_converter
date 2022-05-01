<template>
  <div class="text-center">
    <div>
      <div class="text-9xl">辛</div>
      <div class="text-9xl">い</div>
    </div>
    <button
      type="button"
      class="p-3 bg-blue-700 text-white hover:bg-blue-500 rounded-md text-xl mt-10"
      @click="convert"
    >
      変換する
    </button>
  </div>
</template>

<script>
export default {
  name: "TopIndex",
  methods: {
    convert() {
      this.$router.push({ name: "Result" });
    },
  },
};
</script>
