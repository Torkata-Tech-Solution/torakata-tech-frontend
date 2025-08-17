<template>
  <div>
    <SectionHero />
    <SectionAbout />
    <!-- <SectionPhoto />
    <SectionStat /> -->
    <SectionClient />
    <SectionTestimonial />
    <SectionPortfolio />
    <SectionTeam />
    <SectionContact />
    <SectionBlog />
  </div>
</template>

<script lang="ts" setup>
import { SectionAbout, SectionContact, SectionHero, SectionPhoto, SectionStat } from '#components';
useHead({
  title: 'Home - Torkata Tech Solution',
  meta: [
    { name: 'description', content: 'Welcome to Torkata Tech Solution, your partner in digital transformation.' },
    { property: 'og:title', content: 'Home - Torkata Tech Solution' },
    { property: 'og:description', content: 'Welcome to Torkata Tech Solution, your partner in digital transformation. Find out how we can help you achieve your goals.' },
    { property: 'og:url', content: 'https://torkatatech.com' },
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Home - Torkata Tech Solution' },
    { name: 'twitter:description', content: 'Welcome to Torkata Tech Solution, your partner in digital transformation. Find out how we can help you achieve your goals.' },
    { name: 'twitter:image', content: '/images/og-image.jpg' },
    { name: 'twitter:site', content: '@torkatatech' }
  ]
})

</script>

<style>

</style>