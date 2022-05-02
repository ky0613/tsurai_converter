<template>
  <div class="text-center flex flex-col bg-red-600">
    <ruby class="text-9xl mx-auto mt-6 h-full"><rb>辛</rb><rt>から</rt>い</ruby>
    <!-- <ruby class="text-9xl mx-auto h-full"><rb>㸉</rb><rt>やわら</rt>げる</ruby> -->
    <div>
      <div v-for="list in lists" :key="list.id.videoId" class="text-center">
        <iframe
          width="560"
          height="315"
          :src="`https://www.youtube.com/embed/${list.id.videoId}`"
          class="my-10 mx-auto"
        ></iframe>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "Result",
  computed: {
    ...mapGetters(["lists"]),
  },
  created() {
    this.fetchLists();
  },
  methods: {
    ...mapActions(["fetchLists"]),
  },
};
</script>

<style scoped></style>
