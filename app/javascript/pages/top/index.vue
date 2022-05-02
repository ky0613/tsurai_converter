<template>
  <div class="text-center h-full">
    <div>
      <ruby class="text-9xl mx-auto h-full" v-show="isChange"
        ><rb>辛</rb><rt>つら</rt>い</ruby
      >
      <ruby class="text-9xl mx-auto h-full" v-show="!isChange"
        ><rb>幸</rb><rt>しあわ</rt>せ</ruby
      >
    </div>
    <button
      type="button"
      class="p-3 bg-blue-700 text-white hover:bg-blue-500 rounded-md text-xl mt-10"
      @click="change"
    >
      この場で変換する
    </button>
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
import URLAnimation from "../../lib/urlAnimation";

export default {
  name: "TopIndex",
  data() {
    return {
      isChange: true,
    };
  },
  mounted() {
    let m = new URLAnimation();
    m.animation();
  },
  methods: {
    convert() {
      this.$router.push({ name: "Result" });
    },
    change() {
      this.isChange = !this.isChange;
    },
  },
};
</script>

<style scoped></style>
