<template>
  <header>
    <div
      class="pl-4 py-2 flex justify-between"
      id="header"
      :class="{
        'bg-red-600': isColor === 'red',
        'bg-pink-200': isColor === 'pink',
        'bg-orange-500': isColor === 'orange',
      }"
    >
      <router-link :to="{ name: 'TopIndex' }" class="inline-block text-white">
        <img src="../../../public/logo.png" alt="logo" class="h-12" />
      </router-link>
    </div>
  </header>
</template>

<script>
export default {
  props: {
    isColor: {
      type: String,
    },
  },
};
</script>
