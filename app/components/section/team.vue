<template>
  <div>
    <section class="bg-white dark:bg-gray-900">
      <div class="max-w-screen-xl px-4 py-8 mx-auto sm:py-16 lg:py-24">
        <div class="max-w-5xl mx-auto text-center">
          <h2 class="text-3xl font-extrabold leading-tight text-gray-900 sm:text-4xl dark:text-white">
            Team yang berpengalaman dan berdedikasi
          </h2>
          <p class="mt-4 text-base font-normal text-gray-500 sm:text-xl dark:text-gray-400">
            Kami berkomitmen menghadirkan solusi digital terbaik melalui kolaborasi, kreativitas, dan keahlian di bidang IT untuk mendukung pertumbuhan bisnis dan institusi Anda.


          </p>
        </div>

        <!-- Loading State -->
        <div v-if="status === 'pending'" class="flex justify-center items-center py-12">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
        </div>

        <!-- Error State -->
        <div v-else-if="error" class="text-center py-12">
          <p class="text-red-600 dark:text-red-400">Failed to load team members. Please try again later.</p>
          <button @click="refresh()"
            class="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
            Retry
          </button>
        </div>

        <!-- Team Grid -->
        <div v-else-if="data?.data?.length"
          class="grid grid-cols-1 mt-12 gap-y-12 gap-x-8 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">

          <div v-for="member in data.data" :key="member.id" class="group">
            <img
              class="object-cover object-top w-full h-48 rounded-lg transition-transform duration-300 group-hover:scale-105"
              :src="member.photo || 'https://flowbite.s3.amazonaws.com/blocks/marketing-ui/team/member-6.png'"
              :alt="`${member.name} photo`">
            <div class="mt-4 space-y-2">
              <div>
                <h3 class="text-xl font-bold text-gray-900 dark:text-white">
                  {{ member.name }}
                </h3>
                <p class="text-base font-medium text-gray-500 dark:text-gray-400">
                  {{ member.position || '-' }}
                </p>
              </div>
              <p class="text-base font-normal text-gray-500 dark:text-gray-400">
                {{ member.bio || 'No bio available' }}
              </p>
              <ul class="flex items-center gap-3">
                <!-- LinkedIn -->
                <li v-if="member.linkedIn">
                  <a :href="member.linkedIn" target="_blank" rel="noopener noreferrer" title="LinkedIn" class="">
                    <span class="sr-only">LinkedIn</span>
                    <svg aria-hidden="true"
                      class="w-5 h-5 text-gray-500 hover:text-blue-600 dark:text-gray-400 dark:hover:text-blue-400 transition-colors"
                      xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                      <path
                        d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                    </svg>
                  </a>
                </li>

                <!-- GitHub -->
                <li v-if="member.github">
                  <a :href="member.github" target="_blank" rel="noopener noreferrer" title="GitHub" class="">
                    <span class="sr-only">GitHub</span>
                    <svg aria-hidden="true"
                      class="w-5 h-5 text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white transition-colors"
                      xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                      <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M12.026 2c-5.509 0-9.974 4.465-9.974 9.974 0 4.406 2.857 8.145 6.821 9.465.499.09.679-.217.679-.481 0-.237-.008-.865-.011-1.696-2.775.602-3.361-1.338-3.361-1.338-.452-1.152-1.107-1.459-1.107-1.459-.905-.619.069-.605.069-.605 1.002.07 1.527 1.028 1.527 1.028.89 1.524 2.336 1.084 2.902.829.091-.645.351-1.085.635-1.334-2.214-.251-4.542-1.107-4.542-4.93 0-1.087.389-1.979 1.024-2.675-.101-.253-.446-1.268.099-2.64 0 0 .837-.269 2.742 1.021a9.582 9.582 0 0 1 2.496-.336 9.554 9.554 0 0 1 2.496.336c1.906-1.291 2.742-1.021 2.742-1.021.545 1.372.203 2.387.099 2.64.64.696 1.024 1.587 1.024 2.675 0 3.833-2.33 4.675-4.552 4.922.355.308.675.916.675 1.846 0 1.334-.012 2.41-.012 2.737 0 .267.178.577.687.479C19.146 20.115 22 16.379 22 11.974 22 6.465 17.535 2 12.026 2z">
                      </path>
                    </svg>
                  </a>
                </li>

                <!-- Instagram -->
                <li v-if="member.instagram">
                  <a :href="member.instagram" target="_blank" rel="noopener noreferrer" title="Instagram" class="">
                    <span class="sr-only">Instagram</span>
                    <svg aria-hidden="true"
                      class="w-5 h-5 text-gray-500 hover:text-pink-600 dark:text-gray-400 dark:hover:text-pink-400 transition-colors"
                      xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                      <path
                        d="M12.017 0C8.396 0 7.989.013 7.041.048 6.094.084 5.52.204 5.012.388a6.675 6.675 0 0 0-2.414 1.563A6.658 6.658 0 0 0 .635 4.365C.45 4.873.331 5.447.294 6.394.013 7.343 0 7.75 0 11.371c0 3.628.013 4.035.048 4.984.037.946.156 1.521.34 2.029a6.708 6.708 0 0 0 1.563 2.414 6.681 6.681 0 0 0 2.414 1.563c.508.184 1.083.305 2.029.34.95.037 1.357.048 4.985.048 3.624 0 4.031-.013 4.984-.048.946-.035 1.52-.156 2.029-.34a6.716 6.716 0 0 0 2.414-1.563 6.677 6.677 0 0 0 1.563-2.414c.184-.508.305-1.083.34-2.029.037-.953.048-1.36.048-4.984 0-3.624-.013-4.035-.048-4.984-.035-.946-.156-1.521-.34-2.029a6.68 6.68 0 0 0-1.563-2.414A6.658 6.658 0 0 0 16.965.388C16.457.204 15.882.084 14.936.048 13.987.013 13.58 0 12.017 0zm0 2.162c3.204 0 3.584.012 4.85.07.3.055.78.166 1.207.359a3.27 3.27 0 0 1 1.5.98c.325.325.709.807.98 1.5.193.428.304.908.359 1.207.058 1.266.07 1.646.07 4.85s-.012 3.584-.07 4.85c-.055.3-.166.78-.359 1.207a3.27 3.27 0 0 1-.98 1.5c-.325.325-.807.709-1.5.98-.428.193-.908.304-1.207.359-1.266.058-1.646.07-4.85.07s-3.584-.012-4.85-.07c-.3-.055-.78-.166-1.207-.359a3.27 3.27 0 0 1-1.5-.98c-.325-.325-.709-.807-.98-1.5-.193-.428-.304-.908-.359-1.207-.058-1.266-.07-1.646-.07-4.85s.012-3.584.07-4.85c.055-.3.166-.78.359-1.207a3.27 3.27 0 0 1 .98-1.5c.325-.325.807-.709 1.5-.98.428-.193.908-.304 1.207-.359 1.266-.058 1.646-.07 4.85-.07z" />
                      <path
                        d="M12.017 15.33a4.33 4.33 0 1 1 0-8.66 4.33 4.33 0 0 1 0 8.66zm0-11.007a6.677 6.677 0 1 0 0 13.354 6.677 6.677 0 0 0 0-13.354zm8.967-2.36a1.56 1.56 0 1 1-3.12 0 1.56 1.56 0 0 1 3.12 0z" />
                    </svg>
                  </a>
                </li>

                <!-- Email -->
                <li>
                  <a :href="`mailto:${member.email}`" title="Email" class="">
                    <span class="sr-only">Email</span>
                    <svg aria-hidden="true"
                      class="w-5 h-5 text-gray-500 hover:text-blue-600 dark:text-gray-400 dark:hover:text-blue-400 transition-colors"
                      xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                      <path
                        d="M1.5 8.67v8.58a3 3 0 003 3h15a3 3 0 003-3V8.67l-8.928 5.493a3 3 0 01-3.144 0L1.5 8.67z" />
                      <path
                        d="M22.5 6.908V6.75a3 3 0 00-3-3h-15a3 3 0 00-3 3v.158l9.714 5.978a1.5 1.5 0 001.572 0L22.5 6.908z" />
                    </svg>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <!-- No Team Members State -->
        <div v-else class="text-center py-12">
          <p class="text-gray-500 dark:text-gray-400">No team members available at the moment.</p>
        </div>

        <!-- Join Team CTA -->
        <div v-if="data?.data?.length"
          class="max-w-3xl p-4 mx-auto mt-8 rounded-md lg:mt-12 bg-gray-50 dark:bg-gray-800">
          <div class="flex flex-col justify-between gap-3 md:gap-6 md:items-center md:flex-row">
            <div class="flex items-center gap-1.5">
              <svg class="hidden w-5 h-5 text-gray-800 dark:text-gray-400 md:block shrink-0"
                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path
                  d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z" />
              </svg>
              <span class="text-base font-normal text-gray-900 dark:text-white ms-5">
                <span class="font-semibold">
                  Ingin bergabung dengan tim TorkataTech?
                </span> <br>
                Kami sedang mengembangkan tim kami.
              </span>
            </div>

            <a href="/contact" title=""
              class="inline-flex items-center text-base font-medium text-blue-600 hover:underline dark:text-blue-500 transition-colors">
              Bergabung dengan kami
              <svg aria-hidden="true" class="w-4 h-4 ml-1.5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                fill="currentColor">
                <path fill-rule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts" setup>
interface Team {
  id: number;
  name: string;
  position?: string;
  bio?: string;
  email: string;
  photo?: string;
  linkedIn?: string;
  github?: string;
  instagram?: string;
  last_login: string;
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
  data: Team[];
}

const { data, status, error, refresh, clear } = await useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/teams`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
});
</script>

<style></style>