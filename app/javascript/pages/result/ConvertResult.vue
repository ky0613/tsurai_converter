<template>
  <div>
    <TheResult :searchQuery="'激辛'" :kanji="'辛'" :ruby="'から'" :okuri="'い'">
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
  name: "ConvertResult",
  components: {
    TheResult,
  },
};
</script>
