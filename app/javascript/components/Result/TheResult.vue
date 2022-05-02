<template>
  <div>
    <section
      class="bg-red-600 min-h-screen w-full flex items-center justify-center"
    >
      <div class="container text-center min-h-max">
        <div class="mb-10">
          <ruby class="text-9xl mx-auto mt-6 mb-4"
            ><rb>{{ kanji }}</rb
            ><rt>{{ ruby }}</rt
            >{{ okuri }}</ruby
          >
          <slot name="meaning"></slot>
        </div>
        <div>
          <p class="text-5xl mb-4">おめでとうございます。</p>
          <p class="text-4xl">
            あなたの<ruby class="text-6xl"><rb>辛</rb><rt>つら</rt>い</ruby
            >は<ruby class="text-6xl"
              ><rb>{{ kanji }}</rb
              ><rt>{{ ruby }}</rt
              >{{ okuri }}</ruby
            >に変換されました。
          </p>
        </div>
        <button v-scroll-to="'#bottom-section'" class="mt-28">
          <div class="scroll-down"></div>
        </button>
      </div>
    </section>
    <section
      id="bottom-section"
      class="bg-red-600 min-h-screen w-full flex items-center justify-center"
    >
      <div class="flex flex-col">
        <slot name="message"></slot>
        <div v-for="list in lists" :key="list.id.videoId" class="text-center">
          <iframe
            width="560"
            height="315"
            :src="`https://www.youtube.com/embed/${list.id.videoId}`"
            class="my-10 mx-auto"
          ></iframe>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ConvertResult",
  props: {
    kanji: {
      type: String,
      required: true,
    },
    ruby: {
      type: String,
      required: true,
    },
    okuri: {
      type: String,
    },
    searchQuery: {
      type: String,
      required: true,
    },
  },
  computed: {
    ...mapGetters(["lists"]),
  },
  watch: {
    searchQuery: {
      handler: function (newVal) {
        this.fetchLists(newVal);
      },
      immediate: true,
    },
  },
  methods: {
    ...mapActions(["fetchLists"]),
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Yuji+Syuku&display=swap");

p,
ruby {
  font-family: "Yuji Syuku", serif;
}

.scroll-down {
  height: 50px;
  width: 30px;
  position: absolute;
  left: 50%;
  bottom: 20px;
  cursor: pointer;
}
.scroll-down::before,
.scroll-down::after {
  content: "";
  position: absolute;
  top: 20%;
  left: 50%;
  height: 30px;
  width: 30px;
  transform: translate(-50%, -100%) rotate(45deg);
  border: 2px solid black;
  border-top: transparent;
  border-left: transparent;
  animation: scroll-down 1s ease-in-out infinite;
}
.scroll-down::before {
  top: 30%;
  animation-delay: 0.3s;
}

@keyframes scroll-down {
  0% {
    /* top:20%; */
    opacity: 0;
  }
  30% {
    opacity: 1;
  }
  60% {
    opacity: 1;
  }
  100% {
    top: 90%;
    opacity: 0;
  }
}
</style>
