<template>
  <div class="bg-white dark:bg-gray-900">
    <!-- Loading State -->
    <div v-if="pending" class="flex justify-between mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:py-24 pt-20 sm:pt-24 lg:pt-32">
      <div class="mx-auto w-full max-w-2xl">
        <div class="mb-4 lg:mb-6">
          <div class="animate-pulse">
            <div class="h-8 bg-gray-300 rounded w-3/4 mb-4"></div>
            <div class="h-4 bg-gray-300 rounded w-1/2 mb-2"></div>
            <div class="h-4 bg-gray-300 rounded w-1/3"></div>
          </div>
        </div>
        <div class="animate-pulse space-y-4">
          <div class="h-4 bg-gray-300 rounded w-full"></div>
          <div class="h-4 bg-gray-300 rounded w-full"></div>
          <div class="h-4 bg-gray-300 rounded w-3/4"></div>
        </div>
      </div>
    </div>

    <!-- Error State -->
    <div v-else-if="error" class="flex justify-between mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:py-24 pt-20 sm:pt-24 lg:pt-32">
      <div class="mx-auto w-full max-w-2xl text-center">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-4">Artikel Tidak Ditemukan</h1>
        <p class="text-gray-600 dark:text-gray-400 mb-6">Maaf, artikel yang Anda cari tidak dapat ditemukan.</p>
        <NuxtLink to="/blog" class="inline-flex items-center px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition-colors">
          Kembali ke Blog
        </NuxtLink>
      </div>
    </div>

    <!-- Blog Content -->
    <div v-else-if="data?.data" class="flex justify-between mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:py-24 pt-20 sm:pt-24 lg:pt-32">
     
      <article
        class="mx-auto w-full max-w-2xl format format-sm sm:format-base lg:format-lg format-blue dark:format-invert">
        <header class="mb-4 lg:mb-6 not-format">
          <!-- Featured Image -->
          <figure v-if="data.data.thumbnail" class="mb-6">
            <img 
              :src="data.data.thumbnail" 
              :alt="data.data.title"
              class="w-full h-auto rounded-lg"
              @error="(e) => (e.target as HTMLImageElement).src = '/images/blog/default-thumbnail.png'">
          </figure>

          <h1 class="mb-4 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl dark:text-white">
            {{ data.data.title }}
          </h1>
          <div class="text-base">
            <address class="inline">By 
              <a rel="author" class="text-gray-900 no-underline dark:text-white hover:underline" href="#">
                {{ data.data.author?.name || 'Anonymous' }}
              </a>
            </address> 
            <span v-if="data.data.category">
              in <a href="#" class="text-gray-900 no-underline dark:text-white hover:underline">
                {{ data.data.category.name }}
              </a>
            </span>
            on <time pubdate class="uppercase" :datetime="data.data.created_at" :title="formatDate(data.data.created_at)">
              {{ formatShortDate(data.data.created_at) }}
            </time>
          </div>
        </header>
        <div class="flex justify-between items-center">
          <aside aria-label="Share social media">
            <a href="#"
              class="inline-flex items-center py-2 px-3 mr-2 text-xs font-medium text-gray-900 no-underline bg-white rounded-lg border border-gray-200 focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
              <svg class="mr-2 w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                viewBox="0 0 8 19">
                <path fill-rule="evenodd"
                  d="M6.135 3H8V0H6.135a4.147 4.147 0 0 0-4.142 4.142V6H0v3h2v9.938h3V9h2.021l.592-3H5V3.591A.6.6 0 0 1 5.592 3h.543Z"
                  clip-rule="evenodd" />
              </svg>
              Share</a>
            <a href="#"
              class="inline-flex items-center py-2 px-3 mr-2 text-xs font-medium text-gray-900 no-underline bg-white rounded-lg border border-gray-200 focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
              <svg class="mr-2 w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                viewBox="0 0 20 20">
                <path fill="currentColor"
                  d="M12.186 8.672 18.743.947h-2.927l-5.005 5.9-4.44-5.9H0l7.434 9.876-6.986 8.23h2.927l5.434-6.4 4.82 6.4H20L12.186 8.672Zm-2.267 2.671L8.544 9.515 3.2 2.42h2.2l4.312 5.719 1.375 1.828 5.731 7.613h-2.2l-4.699-6.237Z" />
              </svg>
              Tweet</a>
            <a href="#"
              class="inline-flex items-center py-2 px-3 text-xs font-medium text-gray-900 no-underline bg-white rounded-lg border border-gray-200 focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
              <svg class="mr-2 w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                viewBox="0 0 19 19">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M11.013 7.962a3.519 3.519 0 0 0-4.975 0l-3.554 3.554a3.518 3.518 0 0 0 4.975 4.975l.461-.46m-.461-4.515a3.518 3.518 0 0 0 4.975 0l3.553-3.554a3.518 3.518 0 0 0-4.974-4.975L10.3 3.7" />
              </svg>
              Copy link</a>
          </aside>
          <button data-tooltip-target="tooltip-save"
            class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none dark:text-gray-400 focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
            type="button">
            <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 20">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="m13 19-6-5-6 5V2a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v17Z" />
            </svg>
          </button>
          <div id="tooltip-save" role="tooltip"
            class="inline-block absolute invisible z-10 py-2 px-3 text-sm font-medium text-white bg-gray-900 rounded-lg shadow-xs opacity-0 transition-opacity duration-300 tooltip dark:bg-gray-700">
            Save this article
            <div class="tooltip-arrow" data-popper-arrow></div>
          </div>
        </div>
        <!-- Article Content -->
        <div class="prose prose-lg dark:prose-invert max-w-none" v-html="data.data.content"></div>

        <!-- Article Tags/Categories -->
        <div v-if="data.data.category" class="mt-8 pt-6 border-t border-gray-200 dark:border-gray-700">
          <div class="flex items-center space-x-2">
            <span class="text-sm font-medium text-gray-600 dark:text-gray-400">Category:</span>
            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300">
              {{ data.data.category.name }}
            </span>
          </div>
        </div>
        <section class="not-format">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">Discussion ({{ data.data.comments_count || 0 }})</h2>
            <div>
              <button type="button"
                class="py-2 px-3 text-sm font-medium text-gray-900 bg-white rounded-lg border border-gray-200 focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Subscribe</button>
            </div>
          </div>
          <div class="flex">
            <div class="mr-3 shrink-0 hidden sm:block">
              <img class="w-9 h-9 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-4.jpg"
                alt="Michael Burry">
            </div>
            <form class="mb-6 w-full">
              <div
                class="mb-4 w-full bg-gray-50 rounded-lg border border-gray-200 dark:bg-gray-700 dark:border-gray-600">
                <div class="py-2 px-4 bg-white rounded-t-lg dark:bg-gray-800">
                  <label for="comment" class="sr-only">Your comment</label>
                  <textarea id="comment" rows="4"
                    class="px-0 w-full text-sm text-gray-900 bg-white border-0 dark:bg-gray-800 focus:ring-0 dark:text-white dark:placeholder-gray-400"
                    placeholder="Write a comment..." required></textarea>
                </div>
                <div class="flex justify-between items-center py-2 px-3 border-t border-gray-200 dark:border-gray-600">
                  <div class="flex flex-wrap items-center divide-gray-200 sm:divide-x dark:divide-gray-600">
                    <div class="flex items-center space-x-1 sm:pr-4">
                      <button type="button"
                        class="p-2 text-gray-500 rounded-sm cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                        <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                          viewBox="0 0 12 20">
                          <path stroke="currentColor" stroke-linejoin="round" stroke-width="2"
                            d="M1 6v8a5 5 0 1 0 10 0V4.5a3.5 3.5 0 1 0-7 0V13a2 2 0 0 0 4 0V6" />
                        </svg>
                        <span class="sr-only">Attach file</span>
                      </button>
                      
                    </div>
                    <div class="flex-wrap items-center space-x-1 sm:pl-4 hidden sm:flex">
                      <button type="button"
                        class="p-2 text-gray-500 rounded-sm cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                        <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                          viewBox="0 0 21 18">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M9.5 3h9.563M9.5 9h9.563M9.5 15h9.563M1.5 13a2 2 0 1 1 3.321 1.5L1.5 17h5m-5-15 2-1v6m-2 0h4" />
                        </svg>
                        <span class="sr-only">Add list</span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit"
                class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                Post comment
              </button>
            </form>
          </div>
          <article
            class="p-4 lg:p-6 mb-6 text-base bg-white border border-gray-100 dark:border-gray-700 rounded-lg dark:bg-gray-800">
            <div class="flex">
              <div class="mr-4">
                <div
                  class="rounded-lg bg-gray-100 w-9 flex flex-col items-center justify-center font-medium dark:bg-gray-700">
                  <button type="button"
                    class="text-gray-500 dark:text-gray-400 py-1 dark:hover:bg-gray-600 rounded-t-lg hover:bg-gray-200 w-full focus:ring-2 focus:outline-none focus:ring-gray-50 dark:bg-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-600">+</button>
                  <span class="text-gray-900 font-m py-1 px-2 lg:px-0 text-xs lg:text-sm dark:text-white">14</span>
                  <button type="button"
                    class="text-gray-500  dark:text-gray-400 py-1 dark:hover:bg-gray-600 rounded-b-lg hover:bg-gray-200 w-full focus:ring-2 focus:outline-none focus:ring-gray-50 dark:bg-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-600">-</button>
                </div>
              </div>
              <div class="w-full">
                <footer class="flex justify-between items-center mb-2 w-full">
                  <a href="#" class="flex items-center">
                    <img class="mr-2 w-6 h-6 rounded-full"
                      src="https://flowbite.com/docs/images/people/profile-picture-3.jpg" alt="Bonnie Green">
                    <p
                      class="inline-flex flex-col md:flex-row items-start mr-3 font-semibold text-sm text-gray-900 dark:text-white">
                      <span>Bonnie Green</span>
                      <time class="text-sm font-normal text-gray-600 dark:text-gray-400 md:ml-2" pubdate
                        datetime="2022-03-15" title="March 15th, 2022">Mar. 15,
                        2022</time>
                    </p>
                  </a>
                  <button id="dropdownComment1Button" data-dropdown-toggle="dropdownComment1"
                    class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:text-gray-400 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    type="button">
                    <svg class="w-4 h-4 text-gray-800 dark:text-white" aria-hidden="true"
                      xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3">
                      <path
                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                    </svg>
                    <span class="sr-only">Comment settings</span>
                  </button>
                  <!-- Dropdown menu -->
                  <div id="dropdownComment1"
                    class="hidden z-10 w-36 bg-white rounded-sm divide-y divide-gray-100 shadow-sm dark:bg-gray-700 dark:divide-gray-600">
                    <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                      aria-labelledby="dropdownMenuIconHorizontalButton">
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                      </li>
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                      </li>
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                      </li>
                    </ul>
                  </div>
                </footer>
                <p class="text-gray-500 dark:text-gray-400">The article covers the essentials,
                  challenges, myths and stages the UX designer should consider while creating the
                  design strategy.</p>
                <div class="flex items-center mt-4 space-x-4">
                  <button type="button"
                    class="flex items-center font-medium text-sm text-gray-500 hover:underline dark:text-gray-400">
                    <svg class="mr-1.5 w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                      fill="currentColor" viewBox="0 0 20 18">
                      <path
                        d="M18 0H2a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h2v4a1 1 0 0 0 1.707.707L10.414 13H18a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2Zm-5 4h2a1 1 0 1 1 0 2h-2a1 1 0 1 1 0-2ZM5 4h5a1 1 0 1 1 0 2H5a1 1 0 0 1 0-2Zm2 5H5a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Zm9 0h-6a1 1 0 0 1 0-2h6a1 1 0 1 1 0 2Z" />
                    </svg>
                    Reply
                  </button>
                </div>
              </div>
            </div>
          </article>
          <article
            class="ml-6 lg:ml-12 p-4 lg:p-6 mb-6 text-base bg-white border border-gray-100 dark:border-gray-700 rounded-lg dark:bg-gray-800">
            <div class="flex">
              <div class="mr-4">
                <div
                  class="rounded-lg bg-gray-100 w-9 flex flex-col items-center justify-center font-medium dark:bg-gray-700">
                  <button type="button"
                    class="text-gray-500 dark:text-gray-400 py-1 dark:hover:bg-gray-600 rounded-t-lg hover:bg-gray-200 w-full focus:ring-2 focus:outline-none focus:ring-gray-50 dark:bg-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-600">+</button>
                  <span class="text-gray-900 font-m py-1 px-2 lg:px-0 text-xs lg:text-sm dark:text-white">3</span>
                  <button type="button"
                    class="text-gray-500  dark:text-gray-400 py-1 dark:hover:bg-gray-600 rounded-b-lg hover:bg-gray-200 w-full focus:ring-2 focus:outline-none focus:ring-gray-50 dark:bg-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-600">-</button>
                </div>
              </div>
              <div class="w-full">
                <footer class="flex justify-between items-center mb-2 w-full">
                  <a href="#" class="flex items-center">
                    <img class="mr-2 w-6 h-6 rounded-full"
                      src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="Jese Leos">
                    <p
                      class="inline-flex flex-col md:flex-row items-start mr-3 font-semibold text-sm text-gray-900 dark:text-white">
                      <span>Jese Leos</span>
                      <time class="text-sm font-normal text-gray-600 dark:text-gray-400 md:ml-2" pubdate
                        datetime="2022-02-12" title="February 12th, 2022">Feb. 12,
                        2022</time>
                    </p>
                  </a>
                  <button id="dropdownComment2Button" data-dropdown-toggle="dropdownComment2"
                    class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:text-gray-400 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    type="button">
                    <svg class="w-4 h-4 text-gray-800 dark:text-white" aria-hidden="true"
                      xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3">
                      <path
                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                    </svg>
                    <span class="sr-only">Comment settings</span>
                  </button>
                  <!-- Dropdown menu -->
                  <div id="dropdownComment2"
                    class="hidden z-10 w-36 bg-white rounded-sm divide-y divide-gray-100 shadow-sm dark:bg-gray-700 dark:divide-gray-600">
                    <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                      aria-labelledby="dropdownMenuIconHorizontalButton">
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                      </li>
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                      </li>
                      <li>
                        <a href="#"
                          class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                      </li>
                    </ul>
                  </div>
                </footer>
                <p class="text-gray-500 dark:text-gray-400">Much appreciated! Glad you liked it ☺️
                </p>
                <div class="flex items-center mt-4 space-x-4">
                  <button type="button"
                    class="flex items-center font-medium text-sm text-gray-500 hover:underline dark:text-gray-400">
                    <svg class="mr-1.5 w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                      fill="currentColor" viewBox="0 0 20 18">
                      <path
                        d="M18 0H2a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h2v4a1 1 0 0 0 1.707.707L10.414 13H18a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2Zm-5 4h2a1 1 0 1 1 0 2h-2a1 1 0 1 1 0-2ZM5 4h5a1 1 0 1 1 0 2H5a1 1 0 0 1 0-2Zm2 5H5a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Zm9 0h-6a1 1 0 0 1 0-2h6a1 1 0 1 1 0 2Z" />
                    </svg>
                    Reply
                  </button>
                </div>
              </div>
            </div>
          </article>
        
        </section>
      </article>
      <aside class="hidden lg:block lg:w-72" aria-labelledby="sidebar-label">
        <div class="sticky top-20">
          <h3 id="sidebar-label" class="sr-only">Sidebar</h3>
          <div class="p-6 mb-6 text-gray-500 rounded-lg border border-gray-200 dark:border-gray-700 dark:text-gray-400">
            <div class="text-center mb-4">
              <div class="mx-auto mb-3 w-16 h-16">
                <img class="w-full h-full rounded-full object-cover"
                  :src="data.data.author?.photo || 'https://flowbite.com/docs/images/people/profile-picture-1.jpg'" 
                  :alt="data.data.author?.name || 'Anonymous'">
              </div>
              <h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-1">
                {{ data.data.author?.name || 'Anonymous' }}
              </h4>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">
                {{ data.data.author?.position || 'Content Writer' }}
              </p>
              <p class="text-sm text-gray-500 dark:text-gray-400 leading-relaxed mb-4">
                {{ data.data.author?.bio || 'Passionate writer who loves sharing knowledge and insights through engaging content.' }}
              </p>
            </div>

            <!-- Author Stats -->
            <div class="grid grid-cols-2 gap-4 mb-4 py-3 border-t border-b border-gray-200 dark:border-gray-600">
              <div class="text-center">
                <div class="text-lg font-bold text-gray-900 dark:text-white">24</div>
                <div class="text-xs text-gray-500 dark:text-gray-400">Articles</div>
              </div>
              <div class="text-center">
                <div class="text-lg font-bold text-gray-900 dark:text-white">1.2k</div>
                <div class="text-xs text-gray-500 dark:text-gray-400">Followers</div>
              </div>
            </div>

            <!-- Contact Info -->
            <div class="mb-4">
              <dl class="space-y-2">
                <div v-if="data.data.author?.email">
                  <dt class="text-xs font-semibold text-gray-900 uppercase dark:text-white">Email</dt>
                  <dd class="text-sm text-gray-500 dark:text-gray-400 break-all">
                    <a :href="`mailto:${data.data.author.email}`" class="hover:text-primary-600 dark:hover:text-primary-400">
                      {{ data.data.author.email }}
                    </a>
                  </dd>
                </div>
                <div>
                  <dt class="text-xs font-semibold text-gray-900 uppercase dark:text-white">Joined</dt>
                  <dd class="text-sm text-gray-500 dark:text-gray-400">September 20, 2018</dd>
                </div>
              </dl>
            </div>

            <!-- Social Media Links -->
            <div class="flex justify-center space-x-3 mb-4">
              <a v-if="data.data.author?.linkedIn" 
                 :href="data.data.author.linkedIn" 
                 target="_blank"
                 class="text-gray-500 hover:text-blue-600 dark:text-gray-400 dark:hover:text-blue-400">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M16.338 16.338H13.67V12.16c0-.995-.017-2.277-1.387-2.277-1.39 0-1.601 1.086-1.601 2.207v4.248H8.014v-8.59h2.559v1.174h.037c.356-.675 1.227-1.387 2.526-1.387 2.703 0 3.203 1.778 3.203 4.092v4.711zM5.005 6.575a1.548 1.548 0 11-.003-3.096 1.548 1.548 0 01.003 3.096zm-1.337 9.763H6.34v-8.59H3.667v8.59zM17.668 1H2.328C1.595 1 1 1.581 1 2.298v15.403C1 18.418 1.595 19 2.328 19h15.34c.734 0 1.332-.582 1.332-1.299V2.298C19 1.581 18.402 1 17.668 1z" clip-rule="evenodd"/>
                </svg>
              </a>
              <a v-if="data.data.author?.github" 
                 :href="data.data.author.github" 
                 target="_blank"
                 class="text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clip-rule="evenodd"/>
                </svg>
              </a>
              <a v-if="data.data.author?.instagram" 
                 :href="data.data.author.instagram" 
                 target="_blank"
                 class="text-gray-500 hover:text-pink-600 dark:text-gray-400 dark:hover:text-pink-400">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 0C7.284 0 6.944.012 5.877.06 2.246.227.227 2.242.06 5.877.012 6.944 0 7.284 0 10s.012 3.056.06 4.123c.167 3.632 2.182 5.65 5.817 5.817C6.944 19.988 7.284 20 10 20s3.056-.012 4.123-.06c3.629-.167 5.65-2.182 5.817-5.817C19.988 13.056 20 12.716 20 10s-.012-3.056-.06-4.123C19.833 2.245 17.818.227 14.183.06 13.056.012 12.716 0 10 0zm0 1.802c2.67 0 2.987.01 4.042.059 2.71.123 3.975 1.409 4.099 4.099.048 1.054.057 1.37.057 4.04 0 2.672-.01 2.988-.057 4.042-.124 2.687-1.387 3.975-4.1 4.099-1.054.048-1.37.058-4.041.058-2.67 0-2.987-.01-4.04-.058-2.717-.124-3.977-1.416-4.1-4.1-.048-1.054-.058-1.37-.058-4.041 0-2.67.01-2.986.058-4.04.124-2.69 1.387-3.977 4.1-4.1 1.054-.048 1.37-.058 4.04-.058zM10 4.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z" clip-rule="evenodd"/>
                </svg>
              </a>
            </div>

            <button type="button"
              class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800 w-full">Follow</button>
          </div>
          <div
            class="p-6 mb-6 font-medium text-gray-500 rounded-lg border border-gray-200 dark:border-gray-700 dark:text-gray-400">
            <form class="mb-6">
              <label for="default-search"
                class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-gray-300">Search</label>
              <div class="relative">
                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                  <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                  </svg>
                </div>
                <input type="search" id="default-search"
                  class="block py-2.5 pl-9 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Search..." required>
              </div>
            </form>
            <h4 class="mb-6 font-bold text-gray-900 uppercase dark:text-white">Recommended topics</h4>
            <div class="flex flex-wrap">
              <a href="#"
                class="bg-primary-100 text-primary-800 text-sm font-medium mr-3 px-2.5 py-0.5 rounded-sm dark:bg-primary-900 dark:text-primary-300 mb-3">Technology</a>
              <a href="#"
                class="bg-primary-100 text-primary-800 text-sm font-medium mr-3 px-2.5 py-0.5 rounded-sm dark:bg-primary-900 dark:text-primary-300 mb-3">Money</a>
            </div>
          </div>
         
        </div>
      </aside>
    </div>
    <SectionSubscribe />
  </div>

</template>

<script lang="ts" setup>
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
    position?: string;
    bio?: string;
    email: string;
    photo?: string;
    linkedIn?: string;
    github?: string;
    instagram?: string;
  };
}

interface ApiResponse {
  status?: string;
  message?: string;
  data: BlogPost;
}

const formatDate = (dateString: string) => {
  return new Date(dateString).toLocaleDateString('id-ID', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

const formatShortDate = (dateString: string) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  })
}

// Get composables directly in setup
const route = useRoute()
const config = useRuntimeConfig()
const slug = route.params.slug as string

// Fetch blog post data
const { data, pending, error, refresh } = await useFetch<ApiResponse>(`${config.public.apiBase}/news/${slug}`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
})

// Handle 404 if post not found
if (error.value) {
  throw createError({
    statusCode: 404,
    statusMessage: 'Blog post not found'
  })
}

// SEO Meta tags - use computed values for reactivity
useHead({
  title: computed(() => data.value?.data?.title || 'Blog Post'),
  meta: [
    { 
      name: 'description', 
      content: computed(() => data.value?.data?.excerpt || data.value?.data?.content?.substring(0, 160) || 'Read this blog post')
    },
    { 
      property: 'og:title', 
      content: computed(() => data.value?.data?.title || 'Blog Post')
    },
    { 
      property: 'og:description', 
      content: computed(() => data.value?.data?.excerpt || 'Read this blog post')
    },
    { 
      property: 'og:image', 
      content: computed(() => data.value?.data?.thumbnail || '/images/blog/default-thumbnail.png')
    },
    { property: 'og:type', content: 'article' },
    { 
      property: 'og:url', 
      content: computed(() => `${config.public.baseUrl}/blog/${data.value?.data?.slug}`)
    },
    { name: 'twitter:card', content: 'summary_large_image' },
    { 
      name: 'twitter:title', 
      content: computed(() => data.value?.data?.title || 'Blog Post')
    },
    { 
      name: 'twitter:description', 
      content: computed(() => data.value?.data?.excerpt || 'Read this blog post')
    },
    { 
      name: 'twitter:image', 
      content: computed(() => data.value?.data?.thumbnail || '/images/blog/default-thumbnail.png')
    }
  ]
})
</script>

<style></style>