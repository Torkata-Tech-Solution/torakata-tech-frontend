<template>
  <div>
    <!-- <section class="border-t border-b border-gray-100 bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
      <div class="max-w-screen-xl px-4 py-8 mx-auto  pt-20 sm:pt-24 lg:pt-32">

        <nav
          class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700"
          aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
              <a href="#"
                class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
                <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                  viewBox="0 0 20 20">
                  <path
                    d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                </svg>
                Home
              </a>
            </li>
            <li>
              <div class="flex items-center">
                <svg class="rtl:rotate-180 block w-3 h-3 mx-1 text-gray-400 " aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m1 9 4-4-4-4" />
                </svg>
                <a href="#"
                  class="ms-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ms-2 dark:text-gray-400 dark:hover:text-white">Templates</a>
              </div>
            </li>
            <li aria-current="page">
              <div class="flex items-center">
                <svg class="rtl:rotate-180  w-3 h-3 mx-1 text-gray-400" aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m1 9 4-4-4-4" />
                </svg>
                <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400">Flowbite</span>
              </div>
            </li>
          </ol>
        </nav>


      </div>
    </section> -->

    <section class="bg-white border-b border-gray-100 dark:bg-gray-900 dark:border-gray-800 pt-25">
      <div class="max-w-screen-xl px-4 py-4 mx-auto ">
        <div class="sm:hidden">
          <label for="category" class="sr-only">
            Select a category
          </label>
          <select 
            id="category"
            v-model="selectedCategory"
            @change="filterByCategory(selectedCategory)"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option value="" selected>
              Semua Kategori
            </option>
            <template v-if="categoriesData?.data?.length">
              <option 
                v-for="category in categoriesData.data" 
                :key="category.id"
                :value="category.slug">
                {{ category.name }}
              </option>
            </template>
          </select>
        </div>

        <div class="hidden sm:block">
          <nav class="flex flex-wrap items-center gap-3">
            <button 
              @click="filterByCategory('')"
              :class="selectedCategory === '' ? 'px-5 py-2 text-base font-medium border rounded-full text-blue-700 border-blue-700 bg-blue-50 dark:text-blue-500 dark:border-blue-500 dark:bg-blue-900' : 'px-5 py-2 text-base font-medium text-gray-900 border border-transparent rounded-full dark:text-white dark:hover:bg-gray-700 hover:bg-gray-100'">
              Semua Kategori
            </button>

            <template v-if="categoriesData?.data?.length">
              <button 
                v-for="category in categoriesData.data" 
                :key="category.id"
                @click="filterByCategory(category.slug)"
                :class="selectedCategory === category.slug ? 'px-5 py-2 text-base font-medium border rounded-full text-blue-700 border-blue-700 bg-blue-50 dark:text-blue-500 dark:border-blue-500 dark:bg-blue-900' : 'px-5 py-2 text-base font-medium text-gray-900 border border-transparent rounded-full dark:text-white dark:hover:bg-gray-700 hover:bg-gray-100'">
                {{ category.name }}
              </button>
            </template>
          </nav>
        </div>
      </div>
    </section>

    <section class="bg-white dark:bg-gray-900">
      <div class="max-w-screen-xl px-4 py-8 mx-auto sm:pb-16">
        <div class="flex flex-col gap-12 lg:gap-20 md:flex-row md:items-start">
          <div class="flex-1 min-w-0">
            <!-- Loading State -->
            <div v-if="pending" class="mt-8 space-y-12 sm:mt-12">
              <div v-for="i in 5" :key="i" class="animate-pulse">
                <div class="flex flex-col items-start gap-8 xl:flex-row">
                  <div class="relative aspect-[16/9] sm:aspect-[2/1] w-full xl:aspect-[4/3] xl:w-80 lg:shrink-0 bg-gray-300 rounded-lg"></div>
                  <div class="space-y-4 flex-1">
                    <div class="h-6 bg-gray-300 rounded w-20"></div>
                    <div class="h-8 bg-gray-300 rounded w-3/4"></div>
                    <div class="h-16 bg-gray-300 rounded w-full"></div>
                    <div class="h-6 bg-gray-300 rounded w-1/2"></div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Error State -->
            <div v-else-if="error" class="mt-8 sm:mt-12">
              <div class="text-center py-12">
                <p class="text-red-600 dark:text-red-400 mb-4">Gagal memuat artikel blog</p>
                <button 
                  @click="refresh()"
                  class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                  Coba Lagi
                </button>
              </div>
            </div>

            <!-- Blog Content -->
            <div v-else-if="data?.data?.length" class="mt-8 space-y-12 sm:mt-12">
              <div v-for="post in data.data" :key="post.id" class="flex flex-col items-start gap-8 xl:flex-row">
                <div class="relative aspect-[16/9] sm:aspect-[2/1] w-full xl:aspect-[4/3] xl:w-80 lg:shrink-0">
                  <img 
                    :src="post.thumbnail || '/images/blog/default-thumbnail.png'" 
                    :alt="post.title"
                    class="absolute inset-0 object-cover w-full h-full bg-gray-200 rounded-lg"
                    @error="(e) => (e.target as HTMLImageElement).src = '/images/blog/default-thumbnail.png'">
                </div>

                <div class="space-y-4">
                  <span v-if="post.category"
                    class="bg-blue-100 text-blue-800 text-xs font-medium inline-flex items-center px-2.5 py-0.5 rounded-sm dark:bg-blue-900 dark:text-blue-300">
                    <svg aria-hidden="true" class="w-3 h-3 mr-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                      fill="currentColor">
                      <path fill-rule="evenodd"
                        d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z"
                        clip-rule="evenodd"></path>
                    </svg>
                    {{ post.category.name }}
                  </span>

                  <h2 class="text-2xl font-bold leading-tight tracking-tight text-gray-900 dark:text-white">
                    <a :href="`/blog/${post.slug}`" class="hover:underline" :title="post.title">
                      {{ post.title }}
                    </a>
                  </h2>

                  <div class="flex items-center gap-3">
                    <img 
                      class="w-8 h-8 rounded-full" 
                      :src="post.author?.avatar || post.author?.photo || '/images/users/default-avatar.png'" 
                      :alt="post.author?.name || 'Author'"
                      @error="(e) => (e.target as HTMLImageElement).src = '/images/users/default-avatar.png'">
                    <div class="text-lg font-medium leading-tight text-gray-900 dark:text-white">
                      <div>
                        {{ post.author?.name || 'Anonymous' }}
                      </div>
                      <div class="text-sm font-normal text-gray-500 dark:text-gray-400">
                        Posted on {{ formatDate(post.created_at) }}
                      </div>
                    </div>
                  </div>

                  <p class="text-base font-normal text-gray-500 dark:text-gray-400">
                    {{ truncateContent(post.excerpt || post.content, 150) }}
                  </p>

                  <div class="flex items-center justify-between gap-6">
                    <div class="flex items-center gap-4">
                      <button type="button"
                        class="inline-flex gap-1.5 items-center text-gray-500 dark:text-gray-400 hover:dark:text-white hover:text-gray-900">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                          <path fill-rule="evenodd"
                            d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z"
                            clip-rule="evenodd" />
                        </svg>
                        {{ post.comments_count || 0 }} Comments
                      </button>

                      <button type="button"
                        class="inline-flex gap-1.5 items-center text-gray-500 dark:text-gray-400 hover:dark:text-white hover:text-gray-900">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                          stroke="currentColor" stroke-width="2">
                          <path stroke-linecap="round" stroke-linejoin="round"
                            d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                        </svg>
                        Save
                      </button>
                    </div>

                    <a :href="`/blog/${post.slug}`" :title="`Read ${post.title}`"
                      class="inline-flex items-center text-base font-semibold leading-tight text-blue-700 hover:underline dark:text-blue-500">
                      Read more
                      <svg aria-hidden="true" class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                          d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                          clip-rule="evenodd"></path>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>

            <!-- No Results -->
            <div v-else class="mt-8 sm:mt-12">
              <div class="text-center py-12">
                <p class="text-gray-600 dark:text-gray-400">Tidak ada artikel yang ditemukan</p>
              </div>
            </div>

            <nav v-if="data?.meta && parseInt(data.meta.lastPage) > 1" aria-label="Page navigation" class="mt-8 sm:mt-12">
              <ul class="flex items-center justify-center -space-x-px">
                <li>
                  <button
                    @click="goToPage(currentPage - 1)"
                    :disabled="currentPage === 1"
                    :class="currentPage === 1 ? 'cursor-not-allowed opacity-50' : 'hover:bg-gray-100 hover:text-gray-700'"
                    class="block px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                    <span class="sr-only">Previous</span>
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
                        d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                        clip-rule="evenodd"></path>
                    </svg>
                  </button>
                </li>

                <li v-for="page in pageNumbers" :key="page">
                  <button v-if="page === '...'"
                    class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400"
                    disabled>
                    ...
                  </button>
                  <button v-else
                    @click="goToPage(page as number)"
                    :class="currentPage === page ? 'z-10 px-3 py-2 leading-tight text-blue-600 border border-blue-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white' : 'px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white'">
                    {{ page }}
                  </button>
                </li>

                <li>
                  <button
                    @click="goToPage(currentPage + 1)"
                    :disabled="currentPage === parseInt(data.meta.lastPage)"
                    :class="currentPage === parseInt(data.meta.lastPage) ? 'cursor-not-allowed opacity-50' : 'hover:bg-gray-100 hover:text-gray-700'"
                    class="block px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                    <span class="sr-only">Next</span>
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
                        d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                        clip-rule="evenodd"></path>
                    </svg>
                  </button>
                </li>
              </ul>
            </nav>
          </div>

          <div class="w-full max-w-xs space-y-8 shrink-0 md:top-20 md:sticky">
            <div class="rounded-lg bg-gray-50 dark:bg-gray-800">
              <div class="p-5 space-y-5">
                <form class="flex items-center" @submit.prevent>
                  <label for="simple-search" class="sr-only">Search</label>
                  <div class="relative w-full">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                      <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                        viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                          clip-rule="evenodd"></path>
                      </svg>
                    </div>
                    <input 
                      type="text" 
                      id="simple-search"
                      v-model="searchQuery"
                      @input="handleSearch"
                      class="bg-white border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                      placeholder="Cari artikel..." />
                  </div>
                </form>

                <h5 class="text-sm font-bold tracking-wide text-gray-900 uppercase dark:text-white">
                  Recommended topics
                </h5>
                <div class="flex flex-wrap items-center gap-4">
                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Technology
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Money
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Art
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Productivity
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Psychology
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Design
                  </span>

                  <span
                    class="px-3 py-0.5 text-sm font-medium text-blue-800 bg-blue-100 rounded-md dark:bg-blue-900 dark:text-blue-300">
                    Mindfulness
                  </span>
                </div>
              </div>
            </div>

            <div class="rounded-lg bg-gray-50 dark:bg-gray-800">
              <div class="p-5 space-y-5">
                <h5 class="text-sm font-bold tracking-wide text-gray-900 uppercase dark:text-white">
                  Who to follow
                </h5>

                <ul class="space-y-4">
                  <li class="flex items-start gap-2.5">
                    <img class="object-cover w-6 h-6 rounded-full shrink-0" src="../..//images/users/bonnie-green.png"
                      alt="">
                    <div class="flex-1 min-w-0">
                      <p class="text-base font-semibold text-gray-900 truncate dark:text-white">
                        Bonnie Green
                      </p>
                      <p class="text-sm font-normal text-gray-500 truncate dark:text-gray-400">
                        Web Designer
                      </p>
                    </div>

                    <button type="button"
                      class="px-3 py-2 text-xs font-medium text-gray-800 border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                      Follow
                    </button>
                  </li>

                  <li class="flex items-start gap-2.5">
                    <img class="object-cover w-6 h-6 rounded-full shrink-0" src="../..//images/users/jese-leos.png"
                      alt="">
                    <div class="flex-1 min-w-0">
                      <p class="text-base font-semibold text-gray-900 truncate dark:text-white">
                        Jese Leos
                      </p>
                      <p class="text-sm font-normal text-gray-500 truncate dark:text-gray-400">
                        Web Develoeper
                      </p>
                    </div>

                    <button type="button"
                      class="px-3 py-2 text-xs font-medium text-gray-800 border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                      Follow
                    </button>
                  </li>

                  <li class="flex items-start gap-2.5">
                    <img class="object-cover w-6 h-6 rounded-full shrink-0" src="../..//images/users/thomas-lean.png"
                      alt="">
                    <div class="flex-1 min-w-0">
                      <p class="text-base font-semibold text-gray-900 truncate dark:text-white">
                        Thomas Lean
                      </p>
                      <p class="text-sm font-normal text-gray-500 truncate dark:text-gray-400">
                        CEO at Flowbite
                      </p>
                    </div>

                    <button type="button"
                      class="px-3 py-2 text-xs font-medium text-gray-800 border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                      Follow
                    </button>
                  </li>
                </ul>
              </div>
            </div>

            <div class="rounded-lg bg-gray-50 dark:bg-gray-800">
              <div class="p-5 space-y-5">
                <h5 class="text-sm font-bold tracking-wide text-gray-900 uppercase dark:text-white">
                  Follow us
                </h5>

                <ul class="space-y-4">
                  <li>
                    <a href="#" title=""
                      class="flex items-center gap-2.5 text-base font-semibold hover:underline text-gray-900 dark:text-white">
                      <svg class="w-6 h-6 fill-[#1DA1F2]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                        fill="currentColor">
                        <path
                          d="M19.633 7.997c.013.175.013.349.013.523 0 5.325-4.053 11.461-11.46 11.461-2.282 0-4.402-.661-6.186-1.809.324.037.636.05.973.05a8.07 8.07 0 0 0 5.001-1.721 4.036 4.036 0 0 1-3.767-2.793c.249.037.499.062.761.062.361 0 .724-.05 1.061-.137a4.027 4.027 0 0 1-3.23-3.953v-.05c.537.299 1.16.486 1.82.511a4.022 4.022 0 0 1-1.796-3.354c0-.748.199-1.434.548-2.032a11.457 11.457 0 0 0 8.306 4.215c-.062-.3-.1-.611-.1-.923a4.026 4.026 0 0 1 4.028-4.028c1.16 0 2.207.486 2.943 1.272a7.957 7.957 0 0 0 2.556-.973 4.02 4.02 0 0 1-1.771 2.22 8.073 8.073 0 0 0 2.319-.624 8.645 8.645 0 0 1-2.019 2.083z">
                        </path>
                      </svg>
                      Twitter
                    </a>
                  </li>

                  <li>
                    <a href="#" title=""
                      class="flex items-center gap-2.5 text-base font-semibold hover:underline text-gray-900 dark:text-white">
                      <svg class="w-6 h-6 fill-[#1877F2]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                        fill="currentColor">
                        <path
                          d="M12.001 2.002c-5.522 0-9.999 4.477-9.999 9.999 0 4.99 3.656 9.126 8.437 9.879v-6.988h-2.54v-2.891h2.54V9.798c0-2.508 1.493-3.891 3.776-3.891 1.094 0 2.24.195 2.24.195v2.459h-1.264c-1.24 0-1.628.772-1.628 1.563v1.875h2.771l-.443 2.891h-2.328v6.988C18.344 21.129 22 16.992 22 12.001c0-5.522-4.477-9.999-9.999-9.999z">
                        </path>
                      </svg>
                      Facebook
                    </a>
                  </li>

                  <li>
                    <a href="#" title=""
                      class="flex items-center gap-2.5 text-base font-semibold hover:underline text-gray-900 dark:text-white">
                      <svg class="w-6 h-6 fill-[#111928]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                        fill="currentColor">
                        <path
                          d="M11.1731 9.79959C11.1731 12.68 8.85817 15.015 6.00267 15.015C3.14717 15.015 0.832031 12.6795 0.832031 9.79959C0.832031 6.91971 3.147 4.58398 6.00267 4.58398C8.85835 4.58398 11.1731 6.91918 11.1731 9.79959Z" />
                        <path
                          d="M16.8453 9.7996C16.8453 12.5109 15.6878 14.7097 14.26 14.7097C12.8321 14.7097 11.6746 12.5109 11.6746 9.7996C11.6746 7.08831 12.832 4.8895 14.2598 4.8895C15.6876 4.8895 16.8453 7.08761 16.8453 9.7996Z" />
                        <path
                          d="M19.1654 9.79959C19.1654 12.2282 18.7583 14.1983 18.2561 14.1983C17.7539 14.1983 17.347 12.2288 17.347 9.79959C17.347 7.37041 17.754 5.40092 18.2561 5.40092C18.7582 5.40092 19.1654 7.37024 19.1654 9.79959Z" />
                      </svg>
                      Medium
                    </a>
                  </li>

                  <li>
                    <a href="#" title=""
                      class="flex items-center gap-2.5 text-base font-semibold hover:underline text-gray-900 dark:text-white">
                      <svg class="w-6 h-6 fill-[#CD486B]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                        fill="currentColor">
                        <path
                          d="M11.999 7.377a4.623 4.623 0 1 0 0 9.248 4.623 4.623 0 0 0 0-9.248zm0 7.627a3.004 3.004 0 1 1 0-6.008 3.004 3.004 0 0 1 0 6.008z">
                        </path>
                        <circle cx="16.806" cy="7.207" r="1.078"></circle>
                        <path
                          d="M20.533 6.111A4.605 4.605 0 0 0 17.9 3.479a6.606 6.606 0 0 0-2.186-.42c-.963-.042-1.268-.054-3.71-.054s-2.755 0-3.71.054a6.554 6.554 0 0 0-2.184.42 4.6 4.6 0 0 0-2.633 2.632 6.585 6.585 0 0 0-.419 2.186c-.043.962-.056 1.267-.056 3.71 0 2.442 0 2.753.056 3.71.015.748.156 1.486.419 2.187a4.61 4.61 0 0 0 2.634 2.632 6.584 6.584 0 0 0 2.185.45c.963.042 1.268.055 3.71.055s2.755 0 3.71-.055a6.615 6.615 0 0 0 2.186-.419 4.613 4.613 0 0 0 2.633-2.633c.263-.7.404-1.438.419-2.186.043-.962.056-1.267.056-3.71s0-2.753-.056-3.71a6.581 6.581 0 0 0-.421-2.217zm-1.218 9.532a5.043 5.043 0 0 1-.311 1.688 2.987 2.987 0 0 1-1.712 1.711 4.985 4.985 0 0 1-1.67.311c-.95.044-1.218.055-3.654.055-2.438 0-2.687 0-3.655-.055a4.96 4.96 0 0 1-1.669-.311 2.985 2.985 0 0 1-1.719-1.711 5.08 5.08 0 0 1-.311-1.669c-.043-.95-.053-1.218-.053-3.654 0-2.437 0-2.686.053-3.655a5.038 5.038 0 0 1 .311-1.687c.305-.789.93-1.41 1.719-1.712a5.01 5.01 0 0 1 1.669-.311c.951-.043 1.218-.055 3.655-.055s2.687 0 3.654.055a4.96 4.96 0 0 1 1.67.311 2.991 2.991 0 0 1 1.712 1.712 5.08 5.08 0 0 1 .311 1.669c.043.951.054 1.218.054 3.655 0 2.436 0 2.698-.043 3.654h-.011z">
                        </path>
                      </svg>
                      Instagram
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div>
              <img class="object-cover w-full rounded-lg dark:hidden" src="../..//images/placeholder-image.png" alt="">
              <img class="hidden object-cover w-full rounded-lg dark:block"
                src="../..//images/placeholder-image-dark.png" alt="">
              <p class="mt-3 text-base font-normal text-gray-500 dark:text-gray-400">
                Students and Teachers, save up to 60% on Adobe Creative Cloud.
              </p>
              <a href="#" title="" class="text-xs block mt-1.5 font-medium text-gray-400 uppercase dark:">
                Ads placeholder
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts" setup>
import { ref, computed, watch } from 'vue'

interface BlogPost {
  id: number;
  title: string;
  slug: string;
  content: string;
  excerpt?: string;
  thumbnail?: string;
  created_at: string;
  updated_at: string;
  published_at?: string;
  status: string;
  comments_count?: number;
  category?: {
    id: number;
    name: string;
    slug: string;
  };
  author?: {
    id: number;
    name: string;
    email: string;
    avatar?: string;
    photo?: string;
  };
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
  status?: string;
  message?: string;
  meta: Meta;
  data: BlogPost[];
}

interface Category {
  id: number;
  name: string;
  slug: string;
  created_at: string;
  updated_at: string;
}

interface CategoryResponse {
  status: string;
  message?: string;
  data: Category[];
}

// Reactive state
const searchQuery = ref('')
const selectedCategory = ref('')
const currentPage = ref(1)

// Computed query parameters
const queryParams = computed(() => ({
  q: searchQuery.value,
  page: currentPage.value,
  category: selectedCategory.value,
}))

// Fetch blog posts
const { data, pending, error, refresh } = await useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/news`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
  query: queryParams,
  watch: [queryParams]
})

// Fetch categories
const { data: categoriesData } = await useFetch<CategoryResponse>(`${useRuntimeConfig().public.apiBase}/news/category`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
})

// Search functionality
const handleSearch = (event: Event) => {
  const target = event.target as HTMLInputElement
  searchQuery.value = target.value
  currentPage.value = 1 // Reset to first page when searching
}

// Category filter
const filterByCategory = (categorySlug: string) => {
  console.log(categorySlug)
  selectedCategory.value = categorySlug
  currentPage.value = 1 // Reset to first page when filtering
}

// Pagination
const goToPage = (page: number) => {
  currentPage.value = page
  // Scroll to top
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

const previousPage = () => {
  if (data.value?.meta && Number(data.value.meta.currentPage) > 1) {
    currentPage.value = Number(data.value.meta.currentPage) - 1
  }
}

const nextPage = () => {
  if (data.value?.meta && Number(data.value.meta.currentPage) < Number(data.value.meta.lastPage)) {
    currentPage.value = Number(data.value.meta.currentPage) + 1
  }
}

// Generate page numbers for pagination
const pageNumbers = computed(() => {
  if (!data.value?.meta) return []
  
  const current = Number(data.value.meta.currentPage)
  const last = Number(data.value.meta.lastPage)
  const pages = []
  
  // Always show first page
  if (current > 3) {
    pages.push(1)
    if (current > 4) {
      pages.push('...')
    }
  }
  
  // Show pages around current
  for (let i = Math.max(1, current - 2); i <= Math.min(last, current + 2); i++) {
    pages.push(i)
  }
  
  // Always show last page
  if (current < last - 2) {
    if (current < last - 3) {
      pages.push('...')
    }
    pages.push(last)
  }
  
  return pages
})

// Format date
const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('id-ID', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

// Truncate content
const truncateContent = (content: string, maxLength: number = 150) => {
  if (content.length <= maxLength) return content
  return content.substring(0, maxLength) + '...'
}

useHead({
  title: 'Blog - Torkata Tech Solution',
  meta: [
    { name: 'description', content: 'Temukan berita dan artikel terbaru seputar teknologi, bisnis, dan inovasi di Torkata Tech Solution.' },
    { property: 'og:title', content: 'Blog - Torkata Tech Solution' },
    { property: 'og:description', content: 'Temukan berita dan artikel terbaru seputar teknologi, bisnis, dan inovasi di Torkata Tech Solution.' },
    { property: 'og:url', content: `https://torkatatech.com/blog` },
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Blog - Torkata Tech Solution' },
    { name: 'twitter:description', content: 'Temukan berita dan artikel terbaru seputar teknologi, bisnis, dan inovasi di Torkata Tech Solution.' },
  ]
})
</script>

<style></style>