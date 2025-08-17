<template>
    <div>
    <section class="bg-white dark:bg-gray-900">
      <div class="max-w-screen-xl px-4 pb-8 mx-auto sm:pb-16 lg:pb-24">
        <!-- Header -->
        <div class="max-w-screen-sm mx-auto text-center mb-8 lg:mb-16">
          <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
            Testimonials
          </h2>
          <p class="mt-4 text-gray-500 dark:text-gray-400">
            Apa kata klien kami tentang layanan TorkataTech
          </p>
        </div>

        <!-- Loading State -->
        <div v-if="status === 'pending'" class="flex justify-center items-center py-12">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
        </div>

        <!-- Error State -->
        <div v-else-if="error" class="text-center py-12">
          <p class="text-red-600 dark:text-red-400">Failed to load testimonials. Please try again later.</p>
          <button @click="refresh()" class="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
            Retry
          </button>
        </div>

        <!-- Testimonials Grid -->
        <div v-else-if="data?.data?.length" class="grid gap-6 lg:grid-cols-3">
          <!-- Column 1 -->
          <div class="space-y-6">
            <figure v-for="testimonial in getColumnData(0)" :key="testimonial.id" 
              class="p-6 rounded-lg bg-gray-50 dark:bg-gray-800 hover:shadow-lg transition-shadow duration-300">
              <blockquote class="text-sm text-gray-500 dark:text-gray-400">
                <p class="my-4 text-base leading-relaxed">{{ testimonial.testimonial }}</p>
              </blockquote>
              <figcaption class="flex items-center space-x-3">
                <img class="rounded-full w-12 h-12 object-cover"
                  :src="testimonial.photo || 'https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png'"
                  :alt="`${testimonial.name} profile picture`">
                <div class="space-y-0.5 font-medium dark:text-white">
                  <div class="text-gray-900 dark:text-white">{{ testimonial.name }}</div>
                  <div class="text-sm text-gray-500 dark:text-gray-400">
                    {{ testimonial.position }}{{ testimonial.company ? ` at ${testimonial.company}` : '' }}
                  </div>
                </div>
              </figcaption>
            </figure>
          </div>

          <!-- Column 2 -->
          <div class="space-y-6">
            <figure v-for="testimonial in getColumnData(1)" :key="testimonial.id" 
              class="p-6 rounded-lg bg-gray-50 dark:bg-gray-800 hover:shadow-lg transition-shadow duration-300">
              <blockquote class="text-sm text-gray-500 dark:text-gray-400">
                <p class="my-4 text-base leading-relaxed">{{ testimonial.testimonial }}</p>
              </blockquote>
              <figcaption class="flex items-center space-x-3">
                <img class="rounded-full w-12 h-12 object-cover"
                  :src="testimonial.photo || 'https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png'"
                  :alt="`${testimonial.name} profile picture`">
                <div class="space-y-0.5 font-medium dark:text-white">
                  <div class="text-gray-900 dark:text-white">{{ testimonial.name }}</div>
                  <div class="text-sm text-gray-500 dark:text-gray-400">
                    {{ testimonial.position }}{{ testimonial.company ? ` at ${testimonial.company}` : '' }}
                  </div>
                </div>
              </figcaption>
            </figure>
          </div>

          <!-- Column 3 -->
          <div class="space-y-6">
            <figure v-for="testimonial in getColumnData(2)" :key="testimonial.id" 
              class="p-6 rounded-lg bg-gray-50 dark:bg-gray-800 hover:shadow-lg transition-shadow duration-300">
              <blockquote class="text-sm text-gray-500 dark:text-gray-400">
                <p class="my-4 text-base leading-relaxed">{{ testimonial.testimonial }}</p>
              </blockquote>
              <figcaption class="flex items-center space-x-3">
                <img class="rounded-full w-12 h-12 object-cover"
                  :src="testimonial.photo || 'https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png'"
                  :alt="`${testimonial.name} profile picture`">
                <div class="space-y-0.5 font-medium dark:text-white">
                  <div class="text-gray-900 dark:text-white">{{ testimonial.name }}</div>
                  <div class="text-sm text-gray-500 dark:text-gray-400">
                    {{ testimonial.position }}{{ testimonial.company ? ` at ${testimonial.company}` : '' }}
                  </div>
                </div>
              </figcaption>
            </figure>
          </div>
        </div>

        <!-- No Testimonials State -->
        <div v-else class="text-center py-12">
          <p class="text-gray-500 dark:text-gray-400">No testimonials available at the moment.</p>
        </div>

        <!-- View More Button -->
        <div v-if="data?.data?.length" class="mt-8 text-center sm:mt-12 lg:mt-16">
          <button
            class="text-gray-900 border border-gray-200 hover:bg-gray-100 focus:ring-gray-100 hover:text-blue-700 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:bg-gray-800 dark:hover:text-white dark:focus:ring-gray-800 justify-center inline-flex items-center focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center transition-colors"
            role="button">
            View more
          </button>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts" setup>
interface Testimonial {
  id: number;
  photo: string;
  name: string;
  position: string;
  company: string;
  testimonial: string;
  status: string;
  created_at: string;
  updated_at: string;
}

interface Meta {
  path: string;
  total: string;
  perPage: string;
  currentPage: string;
  lastPage: string;
  from: string;
  to: string;
  hasNext: string;
  hasPrevious: boolean;
}

interface ApiResponse {
  status: string;
  message?: string;
  meta?: Meta;
  data: Testimonial[];
}

const { data, status, error, refresh, clear } = await useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/testimonials`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
  query: {
    perPage: 9, // Adjust the limit as needed
  },
});

// Function to distribute testimonials across three columns
const getColumnData = (columnIndex: number): Testimonial[] => {
  if (!data.value?.data) return [];
  
  const testimonials = data.value.data;
  const result: Testimonial[] = [];
  
  // Distribute testimonials across 3 columns
  for (let i = columnIndex; i < testimonials.length; i += 3) {
    const testimonial = testimonials[i];
    if (testimonial) {
      result.push(testimonial);
    }
  }
  
  return result;
};

// Log the fetched data for debugging
// if (data.value) {
//   console.log('Fetched testimonials:', data.value);
// }
</script>

<style></style>