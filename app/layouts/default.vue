<script setup lang="ts">

</script>

<template>
    <AppHeader v-if="$route.path === '/'"></AppHeader>
    <AppHeader2 v-else></AppHeader2>
    <main class="w-full antialiased">
        <slot />
        <AppFooter></AppFooter>
    </main>
</template>