<template>
  <div>
     <section class="border-t border-b border-gray-100 bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
      <div class="max-w-screen-xl px-4 py-8 mx-auto sm:py-16 lg:py-24">
        <div class="grid grid-cols-1 gap-6 text-center sm:gap-16 sm:grid-cols-2 lg:grid-cols-3">
          <div>
            <div
              class="inline-flex items-center justify-center w-16 h-16 mx-auto text-gray-500 bg-gray-100 rounded-lg dark:bg-gray-800 dark:text-white">
              <svg aria-hidden="true" class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                fill="currentColor">
                <path fill-rule="evenodd"
                  d="M4 4a2 2 0 012-2h8a2 2 0 012 2v12a1 1 0 110 2h-3a1 1 0 01-1-1v-2a1 1 0 00-1-1H9a1 1 0 00-1 1v2a1 1 0 01-1 1H4a1 1 0 110-2V4zm3 1h2v2H7V5zm2 4H7v2h2V9zm2-4h2v2h-2V5zm2 4h-2v2h2V9z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <div class="mt-4">
              <h3 class="text-xl font-bold text-gray-900 dark:text-white">
                Company information:
              </h3>
              <p class="mt-1 text-base font-normal text-gray-500 dark:text-gray-400">
                Torkata Tech Solution<br>
                PT. Torkata Tech Solution
               
              </p>
            </div>
          </div>

          <div>
            <div
              class="inline-flex items-center justify-center w-16 h-16 mx-auto text-gray-500 bg-gray-100 rounded-lg dark:bg-gray-800 dark:text-white">
              <svg aria-hidden="true" class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                fill="currentColor">
                <path fill-rule="evenodd"
                  d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <div class="mt-4">
              <h3 class="text-xl font-bold text-gray-900 dark:text-white">
                Address:
              </h3>
              <p class="mt-1 text-base font-normal text-gray-500 dark:text-gray-400">
                 {{ site?.data?.address || '-' }}<br>
              </p>
            </div>
          </div>

          <div class="hidden lg:block">
            <div
              class="inline-flex items-center justify-center w-16 h-16 mx-auto text-gray-500 bg-gray-100 rounded-lg dark:bg-gray-800 dark:text-white">
              <svg aria-hidden="true" class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                fill="currentColor">
                <path
                  d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
              </svg>
            </div>
            <div class="mt-4">
              <h3 class="text-xl font-bold text-gray-900 dark:text-white">
                Contact us:
              </h3>
              <p class="mt-1 text-base font-normal text-gray-500 dark:text-gray-400">
                 {{ site?.data?.phone || '-' }}<br>
              </p>
              <a href="#" title=""
                class="block mt-1 text-base font-semibold text-gray-900 dark:text-white hover:underline">
                {{ site?.data?.email || '-' }}
              </a>
            </div>
          </div>
        </div>

        <div class="max-w-3xl mx-auto mt-12 lg:mt-24">
          <form  @submit.prevent="submit" class="grid max-w-screen-md grid-cols-1 mx-auto gap-x-8 gap-y-6 sm:grid-cols-2">
            <div class="sm:col-span-2">
              <label for="first-name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Name
              </label>
              <input type="text" id="first-name"
                class="block w-full p-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-white focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Fajri" v-model="form.name" required>
            </div>

          
            <div>
              <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Email 
              </label>
              <input type="email" id="email"
                class="shadow-xs bg-white border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="name@mail.com" v-model="form.email" required>
            </div>

            <div>
              <label for="phone-number" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Phone number
              </label>
              <input type="tel" id="phone-number"
                class="block w-full p-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-white focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="+628XXXX" v-model="form.phone" required>
            </div>

            
            <div class="sm:col-span-2">
              <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Subject
              </label>
              <input type="text" id="subject"
                class="block w-full p-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-white focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Your subject" v-model="form.subject" required>
            </div>

            <div class="sm:col-span-2">
              <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Your message
              </label>
              <textarea id="message" rows="6"
                class="block p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg shadow-xs border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="" v-model="form.message"></textarea>
            </div>

            <div class="sm:col-span-2">
              <button type="submit"
              class="w-full px-5 py-3 text-sm font-medium text-center text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-300">
              Send message
              </button>
            </div>

            <div v-if="error" class="sm:col-span-2">
              <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
              <strong class="font-bold">Error:</strong>
              <span class="block sm:inline">{{ error.message }}</span>
              </div>
            </div>

            <div v-if="pending" class="sm:col-span-2">
              <div class="bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded relative" role="alert">
              <span class="block sm:inline">Sending...</span>
              </div>
            </div>

            <div v-if="data" class="sm:col-span-2">
              <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
              <strong class="font-bold">Success:</strong>
              <span class="block sm:inline">{{ data.message ?? 'Your message has been sent successfully.' }}</span>
              </div>
            </div>

          </form>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts" setup>
const { data: site } = useNuxtData<any>('site-meta')

const form = reactive({
  name: '',
  email: '',
  phone: '',
  subject: '',
  message: ''
})

interface ApiResponse {
  response: string;
  success: boolean;
  message?: string;
}

const { data, error, pending, execute } = useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/inbox/send`, {
  method: 'POST',
  body: form,
  immediate: false, // jangan auto-jalan saat load
})


const submit = async () => {
  await execute() // baru kirim POST saat submit
  console.log('Form submitted:', form)
  console.log('Response:', data.value)
}

</script>

<style>

</style>