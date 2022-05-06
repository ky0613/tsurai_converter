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
        <p class="text-3xl mt-8">意味： 訴える。言い争う。議論する。</p>
      </template>
      <template #youtube-message>
        特典として，議論についての動画をご査収ください。
      </template>
      <template #spotify-message>
        特典として，議論ぐらいうるさい音楽をご査収ください。
      </template>
    </TheResult>
  </div>
</template>

<script>
import TheResult from "../../components/Result/TheResult.vue";

export default {
  name: "ConvertResult",
  components: {
    TheResult,
  },
  data() {
    return {
      kanji: "辡",
      ruby: "へん",
      okuri: "",
      youtube: {
        searchQuery: "議論",
      },
      spotify: {
        listType: "track",
        searchQuery: "เต้นรำ",
      },
      isColor: "orange",
    };
  },
};
</script>
