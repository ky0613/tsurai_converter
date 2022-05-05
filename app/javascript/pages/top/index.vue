<template>
  <div class="text-right h-full flex flex-col justify-center mr-28">
    <div class="mb-10 text-right">
      <ruby class="text-9xl text-black" v-show="isChange"
        ><rb>辛</rb><rt>つら</rt>い</ruby
      >
      <p class="text-3xl text-black mt-10 ml-32">
        あなたの『<ruby class="text-3xl text-black"
          ><rb>辛</rb><rt>つら</rt>い</ruby
        >』を変えます。
      </p>
    </div>
    <div class="flex flex-col">
      <div class="flex justify-end mb-10">
        <button
          type="button"
          class="p-3 bg-blue-700 text-white hover:bg-blue-500 rounded-md text-xl w-30 mr-16"
          @click="convert"
        >
          変換する
        </button>
        <button
          type="button"
          class="p-3 bg-red-700 text-white hover:bg-red-500 rounded-md text-xl w-30"
          @click="fire"
        >
          火で炙る
        </button>
      </div>
      <div>
        <button
          type="button"
          class="p-3 bg-green-700 text-white hover:bg-green-500 rounded-md text-xl mr-16"
          @click="twin"
        >
          2つ並べてみる
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      isChange: true,
    };
  },
  methods: {
    convert() {
      this.$router.push({ name: "ConvertResult" });
    },
    fire() {
      this.$router.push({ name: "FireResult" });
    },
    twin() {
      this.$router.push({ name: "TwinResult" });
    },
    change() {
      this.isChange = !this.isChange;
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Yuji+Syuku&display=swap");

p,
ruby,
button {
  font-family: "Yuji Syuku", serif;
}
</style>
