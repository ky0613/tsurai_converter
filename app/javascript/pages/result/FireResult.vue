<template>
  <div>
    <TheResult
      :youtube="youtube"
      :kanji="kanji"
      :ruby="ruby"
      :okuri="okuri"
      :spotify="spotify"
      :isColor="isColor"
    >
      <template #meaning>
        <p class="text-3xl mt-8">意味： やわらげる。整える。調和する。</p>
      </template>
      <template #youtube-message>
        特典として，やわらぐ動画をご査収ください。
      </template>
      <template #spotify-message>
        特典として，やわらぐ音楽をご査収ください。
      </template>
    </TheResult>
  </div>
</template>

<script>
import TheResult from "../../components/Result/TheResult.vue";

export default {
  name: "FireResult",
  components: {
    TheResult,
  },
  data() {
    return {
      kanji: "㸉",
      ruby: "やわら",
      okuri: "げる",
      youtube: {
        searchQuery: "猫 ほのぼの",
      },
      spotify: {
        listType: "track",
        searchQuery: "Studio Ghibli",
      },
      isColor: "pink",
    };
  },
};
</script>
