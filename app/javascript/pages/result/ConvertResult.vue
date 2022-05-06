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
      <template #youtube-message>
        特典として，激辛の動画をご査収ください。
      </template>
      <template #spotify-message>
        特典として，激辛くらいホットな音楽をご査収ください。
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
      kanji: "辛",
      ruby: "から",
      okuri: "い",
      youtube: {
        searchQuery: "激辛",
      },
      spotify: {
        listType: "track",
        searchQuery: "เผ็ด",
      },
      isColor: "red",
    };
  },
};
</script>
