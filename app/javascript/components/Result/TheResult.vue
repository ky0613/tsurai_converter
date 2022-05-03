<template>
  <div>
    <section
      class="min-h-screen w-full flex items-center justify-center"
      :class="{
        'bg-red-600': isColor === 'red',
        'bg-pink-200': isColor === 'pink',
        'bg-orange-500': isColor === 'orange',
      }"
    >
      <div class="container text-center min-h-max">
        <div class="mb-10">
          <ruby class="text-9xl mx-auto mt-6 mb-4 huti"
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
      class="bg-white min-h-screen w-full flex flex-col items-center justify-center"
    >
      <div class="flex mb-3 mt-10 w-full">
        <button
          type="button"
          @click="changeSpotify"
          class="p-2 rounded-sm mx-6 w-1/2 h-12"
          id="YouTube"
        >
          <div
            class="flex justify-center hover:text-red-800 border-b-2 border-zinc-500 pb-5"
            :class="{
              'border-red-800': isActive === 'Spotify',
              'text-red-800': isActive === 'Spotify',
            }"
          >
            <img
              src="../../../../public/spotify-brands.svg"
              alt="spotify"
              class="h-8 w-8 mr-2"
            />
            <p class="text-2xl">Spotify</p>
          </div>
        </button>
        <button
          type="button"
          @click="changeYoutube"
          class="p-2 rounded-sm mx-6 w-1/2 h-12"
        >
          <div
            class="flex justify-center hover:text-red-800 border-b-2 border-zinc-500 pb-5"
            :class="{
              'border-red-800': isActive === 'YouTube',
              'text-red-800': isActive === 'YouTube',
            }"
          >
            <img
              src="../../../../public/youtube-brands.svg"
              alt="youtube"
              class="h-8 w-8 mr-2"
            />
            <p class="text-2xl">YouTube</p>
          </div>
        </button>
      </div>
      <transition>
        <div
          class="flex flex-col"
          v-if="isActive === 'YouTube'"
          id="Spotify"
          key="YouTube"
        >
          <p class="text-3xl my-10 text-center">
            <slot name="youtube-message"></slot>
          </p>
          <div v-if="youtubeLists">
            <div
              v-for="list in youtubeLists"
              :key="list.id.videoId"
              class="text-center"
            >
              <iframe
                width="560"
                height="315"
                :src="`https://www.youtube.com/embed/${list.id.videoId}`"
                class="my-10 mx-auto"
              ></iframe>
            </div>
          </div>
          <div v-else>
            <p class="text-7xl my-24 text-center">
              データの制限がかかっちゃいました。
            </p>
            <p class="text-7xl my-24 text-center">
              表示できなくて誠にごめんなさい。
            </p>
          </div>
        </div>
        <div v-if="isActive === 'Spotify'" class="flex flex-col" key="Spotify">
          <p class="text-3xl my-10 text-center">
            <slot name="spotify-message"></slot>
          </p>
          <div class="w-full grid grid-cols-2 gap-20" v-if="spotifyLists.items">
            <div v-for="list in spotifyLists.items" :key="list.id">
              <iframe
                style="border-radius: 12px"
                :src="`https://open.spotify.com/embed/track/${list.id}?utm_source=generator`"
                width="380px"
                height="380px"
                frameBorder="0"
                allowfullscreen=""
                allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
                class="mx-auto mb-5"
              ></iframe>
            </div>
          </div>
        </div>
      </transition>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ConvertResult",
  data() {
    return {
      isActive: "Spotify",
    };
  },
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
    youtube: {
      SearchQuery: {
        type: String,
        required: true,
      },
      type: Object,
      default: {},
    },
    spotify: {
      listType: {
        type: String,
        required: true,
      },
      SearchQuery: {
        type: String,
        required: true,
      },
      type: Object,
      default: {},
    },
    isColor: {
      type: String,
      required: true,
    },
  },
  computed: {
    ...mapGetters(["youtubeLists", "spotifyLists"]),
  },
  watch: {
    youtube: {
      handler: function (newVal) {
        this.fetchYoutubeLists(newVal);
      },
      deep: true,
      immediate: true,
    },
    spotify: {
      handler: function ({ listType, searchQuery }) {
        this.fetchSpotifyLists({ listType, searchQuery });
      },
      deep: true,
      immediate: true,
    },
  },
  methods: {
    ...mapActions(["fetchYoutubeLists", "fetchSpotifyLists"]),
    changeYoutube() {
      this.isActive = "YouTube";
    },
    changeSpotify() {
      this.isActive = "Spotify";
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Yuji+Syuku&display=swap");

.huti {
  text-shadow: 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff,
    0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff,
    0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff,
    0 0 3px #fff, 0 0 3px #fff;
}

p,
ruby {
  font-family: "Yuji Syuku", serif;
}

.select-out {
  border-bottom: 2px solid #ddd;
}

.select {
  border-bottom: 2px solid rgb(153 27 27);
  color: rgb(153 27 27);
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

.v-enter {
  opacity: 0;
}
.v-enter-active {
  transition: opacity 3s;
}
.v-enter-to {
  opacity: 1;
}
</style>
