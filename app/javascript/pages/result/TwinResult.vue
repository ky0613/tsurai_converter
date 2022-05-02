<template>
  <div>
    <TheResult :searchQuery="'激辛'" :kanji="'辡'" :ruby="'へん'">
      <template #meaning>
        <p class="text-3xl mt-8">意味： 訴える。言い争う。議論する。</p>
      </template>
      <template #message>
        <div>
          <p class="text-3xl my-10 mx-auto">
            特典として，議論についての動画をご査収ください。
          </p>
        </div>
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
};
</script>
