<template>
  <div>
    <TheResult
      :searchQuery="'激辛'"
      :kanji="'㸉'"
      :ruby="'やわら'"
      :okuri="'げる'"
    >
      <template #meaning>
        <p class="text-3xl mt-8">意味： やわらげる。整える。調和する。</p>
      </template>
      <template #message>
        <div>
          <p class="text-3xl my-10 mx-auto">
            特典として，激辛動画をご査収ください。
          </p>
        </div>
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
};
</script>
