<template>
  <div>
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<script lang="ts" setup>
import { initFlowbite } from 'flowbite';
import { onMounted } from 'vue'
import { useFlowbite } from '~/composables/useFlowbite';

const { data: site, error } = await useAsyncData('site-meta', () =>
  $fetch(`${useRuntimeConfig().public.apiBase}/site-meta`),
  { server: true } // di-SSR lalu di-hydrate ke client
)
if (error.value) console.error(error.value)


// initialize components based on data attribute selectors
onMounted(() => {
    useFlowbite(() => {
        initFlowbite();
    })
})
</script>