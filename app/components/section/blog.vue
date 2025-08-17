<template>
  <div>
    <section class="bg-white dark:bg-gray-900">
      <div class="max-w-screen-xl px-4 py-8 mx-auto sm:py-16 lg:py-24">
        <div class="max-w-screen-sm mx-auto text-center">
          <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
           Blog & Artikel
          </h2>
           <p class="mt-4 text-base font-normal text-gray-500 sm:text-xl dark:text-gray-400">
            Temukan insight, tips, dan berita terbaru seputar teknologi, pengembangan digital, serta update dari Torkata Tech Solution.


          </p>
        </div>

        <!-- Loading State -->
        <div v-if="status === 'pending'" class="flex justify-center items-center mt-12">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
        </div>

        <!-- Error State -->
        <div v-else-if="error" class="text-center mt-12">
          <p class="text-red-600 dark:text-red-400">Failed to load blog posts. Please try again later.</p>
          <button @click="refresh()" class="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
            Retry
          </button>
        </div>

        <!-- Blog Posts -->
        <div v-else-if="data?.data?.length" class="grid gap-8 mt-12 lg:divide-x lg:divide-gray-200 dark:lg:divide-gray-800 lg:grid-cols-3">
          <!-- Featured Article (First post) -->
          <article v-if="data.data[0]">
            <a :href="`/blog/${data.data[0].slug || data.data[0].id}`">
              <img class="mb-5 rounded-lg w-full h-48 object-cover"
                :src="data.data[0].image || 'https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/google-hq.png'" 
                :alt="data.data[0].title">
            </a>
            <h2 class="my-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
              <a :href="`/blog/${data.data[0].slug || data.data[0].id}`">{{ data.data[0].title }}</a>
            </h2>
            <p class="mb-4 text-gray-500 dark:text-gray-400">
              {{ data.data[0].excerpt || data.data[0].content?.substring(0, 150) + '...' }}
            </p>
            <a :href="`/blog/${data.data[0].slug || data.data[0].id}`"
              class="inline-flex items-center font-medium text-primary-700 hover:underline dark:text-primary-500">
              Read more
              <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clip-rule="evenodd"></path>
              </svg>
            </a>
          </article>

          <!-- Column 2 -->
          <div class="space-y-8 lg:pl-8">
            <article v-for="post in data.data.slice(1, 4)" :key="post.id">
              <h2 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a :href="`/blog/${post.slug || post.id}`">{{ post.title }}</a>
              </h2>
              <p class="mb-4 text-gray-500 dark:text-gray-400">
                {{ post.excerpt || post.content?.substring(0, 120) + '...' }}
              </p>
              <a :href="`/blog/${post.slug || post.id}`"
                class="inline-flex items-center font-medium text-primary-700 hover:underline dark:text-primary-500">
                Read more
                <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
                    d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
                </svg>
              </a>
            </article>
          </div>

          <!-- Column 3 -->
          <div class="space-y-8 lg:pl-8">
            <article v-for="post in data.data.slice(4, 7)" :key="post.id">
              <h2 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a :href="`/blog/${post.slug || post.id}`">{{ post.title }}</a>
              </h2>
              <p class="mb-4 text-gray-500 dark:text-gray-400">
                {{ post.excerpt || post.content?.substring(0, 120) + '...' }}
              </p>
              <a :href="`/blog/${post.slug || post.id}`"
                class="inline-flex items-center font-medium text-primary-700 hover:underline dark:text-primary-500">
                Read more
                <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
                    d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
                </svg>
              </a>
            </article>
          </div>
        </div>

        <!-- No Posts State -->
        <div v-else class="text-center mt-12">
          <p class="text-gray-500 dark:text-gray-400">No blog posts available at the moment.</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts" setup>
interface BlogPost {
  id: number | string;
  title: string;
  content?: string;
  excerpt?: string;
  image?: string;
  slug?: string;
  created_at?: string;
  updated_at?: string;
}

interface ApiResponse {
  data: BlogPost[];
  status?: string;
  message?: string;
}

const { data, status, error, refresh, clear } = await useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/news`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Log the fetched data for debugging
// if (data.value) {
//   console.log('Fetched blog data:', data.value);
// }
</script>

<style></style>