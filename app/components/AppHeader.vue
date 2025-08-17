<template>
  <header>
    <nav id="mainNavbar" data-sticky="false"
      class="group fixed w-full z-50 top-0 transition-all duration-300 bg-transparent data-[sticky=true]:bg-white/95 data-[sticky=true]:backdrop-blur-lg data-[sticky=true]:border-b data-[sticky=true]:border-gray-200/20 dark:data-[sticky=true]:bg-gray-900/95 dark:data-[sticky=true]:border-gray-700/30">
      <div class="flex flex-wrap justify-between items-center mx-auto max-w-7xl px-4 py-4">

        <!-- Logo -->
        <NuxtLink to="/" class="flex items-center group">
            <div class="relative bg-white/80 rounded-xl p-1 shadow-lg backdrop-blur">
            <img src="/favicon-96x96.png" alt="Torkata Logo"
              class="w-10 h-10 rounded-xl group-hover:scale-105 transition-transform duration-300" />
            </div>
          <div class="ml-3">
            <span
              class="text-xl font-bold text-white group-data-[sticky=true]:text-gray-900 dark:group-data-[sticky=true]:text-white transition-colors">
              Torkata
            </span>
            <div
              class="text-xs text-blue-300 group-data-[sticky=true]:text-blue-600 dark:group-data-[sticky=true]:text-blue-400 font-medium">
              Tech Solution
            </div>
          </div>
        </NuxtLink>

        <!-- Desktop Navigation -->
        <div class="hidden lg:flex items-center space-x-1">
          <NuxtLink to="/"
            class="px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
            Home
          </NuxtLink>

          <NuxtLink to="/about"
            class="px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
            About
          </NuxtLink>

          <NuxtLink to="/services"
            class="px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
            Services
          </NuxtLink>

          <!-- Blog Dropdown -->
          <div class="relative" @mouseenter="handleDropdownEnter" @mouseleave="handleDropdownLeave">
            <button
              class="flex items-center px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
              Blog
              <svg class="w-4 h-4 ml-1 transition-transform duration-300" :class="{ 'rotate-180': showBlogDropdown }"
                fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </button>

            <!-- Dropdown Menu -->
            <div v-show="showBlogDropdown"
              class="absolute top-full left-0 mt-2 w-64 bg-white/95 dark:bg-gray-800/95 backdrop-blur-lg rounded-2xl shadow-xl border border-gray-200/20 dark:border-gray-700/30 overflow-hidden transform transition-all duration-300"
              :class="showBlogDropdown ? 'opacity-100 translate-y-0' : 'opacity-0 -translate-y-2'">

              <div class="p-2">
                <NuxtLink to="/blog"
                  class="flex items-center px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-blue-50 dark:hover:bg-blue-900/20 hover:text-blue-600 dark:hover:text-blue-400 rounded-xl transition-all duration-200 group">
                  <div
                    class="w-8 h-8 bg-blue-100 dark:bg-blue-900/30 rounded-lg flex items-center justify-center mr-3 group-hover:bg-blue-200 dark:group-hover:bg-blue-800/50 transition-colors">
                    <svg class="w-4 h-4 text-blue-600 dark:text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd"
                        d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z"
                        clip-rule="evenodd" />
                    </svg>
                  </div>
                  <div>
                    <div class="font-semibold">Semua Artikel</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">Browse all articles</div>
                  </div>
                </NuxtLink>

                <!-- Dynamic Categories -->
                <template v-if="data?.data?.length">
                  <NuxtLink v-for="category in data.data" :key="category.id" :to="`/blog/category/${category.slug}`"
                    class="flex items-center px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-purple-50 dark:hover:bg-purple-900/20 hover:text-purple-600 dark:hover:text-purple-400 rounded-xl transition-all duration-200 group">
                    <div
                      class="w-8 h-8 bg-purple-100 dark:bg-purple-900/30 rounded-lg flex items-center justify-center mr-3 group-hover:bg-purple-200 dark:group-hover:bg-purple-800/50 transition-colors">
                      <svg class="w-4 h-4 text-purple-600 dark:text-purple-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>
                    </div>
                    <div>
                      <div class="font-semibold">{{ category.name }}</div>
                      <div class="text-sm text-gray-500 dark:text-gray-400">{{ category.name }} articles</div>
                    </div>
                  </NuxtLink>
                </template>

                <!-- Loading State -->
                <div v-else-if="status === 'pending'" class="flex items-center justify-center px-4 py-3">
                  <div class="animate-spin rounded-full h-4 w-4 border-b-2 border-purple-600"></div>
                  <span class="ml-2 text-sm text-gray-500 dark:text-gray-400">Loading categories...</span>
                </div>

                <!-- Error State -->
                <div v-else-if="error" class="px-4 py-3 text-center">
                  <div class="text-sm text-red-600 dark:text-red-400">Failed to load categories</div>
                </div>
              </div>
            </div>
          </div>

          <NuxtLink to="/team"
            class="px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
            Team
          </NuxtLink>

          <NuxtLink to="/contact"
            class="px-4 py-2 text-white group-data-[sticky=true]:text-gray-700 dark:group-data-[sticky=true]:text-gray-200 hover:text-blue-400 transition-colors duration-300 font-medium rounded-lg hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800">
            Contact
          </NuxtLink>
        </div>

        <!-- Right Side Actions -->
        <div class="flex items-center space-x-3">
          <!-- Theme Toggle -->
          <button id="theme-toggle" type="button"
            class="p-2.5 text-white group-data-[sticky=true]:text-gray-600 dark:group-data-[sticky=true]:text-gray-300 hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800 rounded-xl transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-blue-500/50">
            <svg id="theme-toggle-dark-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
            </svg>
            <svg id="theme-toggle-light-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path
                d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                fill-rule="evenodd" clip-rule="evenodd" />
            </svg>
          </button>

          <!-- CTA Button -->
          <NuxtLink to="/contact"
            class="hidden sm:flex items-center px-6 py-2.5 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white font-semibold rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl">
            <span>Get Started</span>
            <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                clip-rule="evenodd" />
            </svg>
          </NuxtLink>

          <!-- Mobile Menu Button -->
          <button id="mobile-menu-button" @click="toggleMobileMenu" type="button"
            class="lg:hidden p-2.5 text-white group-data-[sticky=true]:text-gray-600 dark:group-data-[sticky=true]:text-gray-300 hover:bg-white/10 group-data-[sticky=true]:hover:bg-gray-100 dark:group-data-[sticky=true]:hover:bg-gray-800 rounded-xl transition-all duration-300 focus:outline-none">
            <svg class="w-6 h-6" :class="{ 'hidden': showMobileMenu }" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd" />
            </svg>
            <svg class="w-6 h-6" :class="{ 'hidden': !showMobileMenu }" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                clip-rule="evenodd" />
            </svg>
          </button>
        </div>
      </div>

      <!-- Mobile Menu -->
      <div v-show="showMobileMenu"
        class="lg:hidden bg-white/95 dark:bg-gray-900/95 backdrop-blur-lg border-t border-gray-200/20 dark:border-gray-700/30 transition-all duration-300"
        :class="showMobileMenu ? 'opacity-100' : 'opacity-0'">
        <div class="px-4 py-6 space-y-2">
          <NuxtLink to="/" @click="closeMobileMenu"
            class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
            Home
          </NuxtLink>
          <NuxtLink to="/about" @click="closeMobileMenu"
            class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
            About
          </NuxtLink>
          <NuxtLink to="/services" @click="closeMobileMenu"
            class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
            Services
          </NuxtLink>

          <!-- Mobile Blog Section -->
          <div>
            <button @click="toggleMobileBlog"
              class="flex items-center justify-between w-full px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
              Blog
              <svg class="w-4 h-4 transition-transform duration-300" :class="{ 'rotate-180': showMobileBlog }"
                fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </button>
            <div v-show="showMobileBlog" class="ml-4 mt-2 space-y-2">
              <NuxtLink to="/blog" @click="closeMobileMenu"
                class="block px-4 py-2 text-sm text-gray-600 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-lg transition-colors">
                Semua Artikel
              </NuxtLink>

              <!-- Dynamic Mobile Categories -->
              <template v-if="data?.data?.length">
                <NuxtLink v-for="category in data.data" :key="category.id" :to="`/blog/category/${category.slug}`"
                  @click="closeMobileMenu"
                  class="block px-4 py-2 text-sm text-gray-600 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-lg transition-colors">
                  {{ category.name }}
                </NuxtLink>
              </template>

              <!-- Mobile Loading State -->
              <div v-else-if="status === 'pending'" class="px-4 py-2">
                <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
                  <div class="animate-spin rounded-full h-3 w-3 border-b border-gray-400 mr-2"></div>
                  Loading...
                </div>
              </div>

              <!-- Mobile Error State -->
              <div v-else-if="error" class="px-4 py-2">
                <div class="text-sm text-red-600 dark:text-red-400">Failed to load categories</div>
              </div>
            </div>
          </div>

          <NuxtLink to="/team" @click="closeMobileMenu"
            class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
            Team
          </NuxtLink>
          <NuxtLink to="/contact" @click="closeMobileMenu"
            class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-xl transition-colors font-medium">
            Contact
          </NuxtLink>
        </div>
      </div>
    </nav>
  </header>
</template>

<script lang="ts" setup>
interface DropdownTimeout {
  value: ReturnType<typeof setTimeout> | null
}

interface BlogDropdownState {
  showBlogDropdown: boolean
}

interface MobileMenuState {
  showMobileMenu: boolean
  showMobileBlog: boolean
}

import { ref, onMounted, onUnmounted } from 'vue'

// Reactive state
const showBlogDropdown = ref<BlogDropdownState['showBlogDropdown']>(false)
const showMobileMenu = ref<MobileMenuState['showMobileMenu']>(false)
const showMobileBlog = ref<MobileMenuState['showMobileBlog']>(false)
let dropdownTimeout: DropdownTimeout['value'] = null

// Dropdown functions with delay
const handleDropdownEnter = (): void => {
  if (dropdownTimeout) {
    clearTimeout(dropdownTimeout)
    dropdownTimeout = null
  }
  showBlogDropdown.value = true
}

const handleDropdownLeave = (): void => {
  dropdownTimeout = setTimeout(() => {
    showBlogDropdown.value = false
  }, 800)
}

// Mobile menu functions
const toggleMobileMenu = (): void => {
  showMobileMenu.value = !showMobileMenu.value
  if (!showMobileMenu.value) {
    showMobileBlog.value = false
  }
}

const closeMobileMenu = (): void => {
  showMobileMenu.value = false
  showMobileBlog.value = false
}

const toggleMobileBlog = (): void => {
  showMobileBlog.value = !showMobileBlog.value
}

onMounted(() => {
  // Theme toggle functionality
  const themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon') as HTMLElement | null;
  const themeToggleLightIcon = document.getElementById('theme-toggle-light-icon') as HTMLElement | null;

  // Change the icons inside the button based on previous settings
  if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    if (themeToggleLightIcon) {
      themeToggleLightIcon.classList.remove('hidden');
    }
  } else {
    if (themeToggleDarkIcon) {
      themeToggleDarkIcon.classList.remove('hidden');
    }
  }

  const themeToggleBtn = document.getElementById('theme-toggle') as HTMLElement | null;

  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', function () {
      // toggle icons inside button
      themeToggleDarkIcon?.classList.toggle('hidden');
      themeToggleLightIcon?.classList.toggle('hidden');

      // if set via local storage previously
      if (localStorage.getItem('color-theme')) {
        if (localStorage.getItem('color-theme') === 'light') {
          document.documentElement.classList.add('dark');
          localStorage.setItem('color-theme', 'dark');
        } else {
          document.documentElement.classList.remove('dark');
          localStorage.setItem('color-theme', 'light');
        }
        // if NOT set via local storage previously
      } else {
        if (document.documentElement.classList.contains('dark')) {
          document.documentElement.classList.remove('dark');
          localStorage.setItem('color-theme', 'light');
        } else {
          document.documentElement.classList.add('dark');
          localStorage.setItem('color-theme', 'dark');
        }
      }
    });
  }

  // Sticky navbar functionality
  const navbar = document.getElementById('mainNavbar') as HTMLElement | null;

  const handleScroll = (): void => {
    if (window.scrollY > 50) {
      navbar?.setAttribute('data-sticky', 'true');
    } else {
      navbar?.setAttribute('data-sticky', 'false');
    }
  };

  // Close dropdowns when clicking outside
  const handleClickOutside = (event: MouseEvent): void => {
    const target = event.target as HTMLElement
    if (!target.closest('.relative')) {
      showBlogDropdown.value = false
    }
  };

  window.addEventListener('scroll', handleScroll);
  document.addEventListener('click', handleClickOutside);

  // Cleanup function
  onUnmounted(() => {
    window.removeEventListener('scroll', handleScroll);
    document.removeEventListener('click', handleClickOutside);
    if (dropdownTimeout) {
      clearTimeout(dropdownTimeout);
    }
  });
})

interface Category {
  id: number;
  name: string;
  slug: string;
  created_at: string;
  updated_at: string;
}


interface ApiResponse {
  status: string;
  message?: string;
  data: Category[];
}

const { data, status, error, refresh, clear } = await useFetch<ApiResponse>(`${useRuntimeConfig().public.apiBase}/news/category`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
});

</script>

<style scoped>
/* Glassmorphism effect */
.backdrop-blur-lg {
  backdrop-filter: blur(16px);
}

/* Smooth transitions for dropdown */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}

/* Navbar shadow when sticky */
nav[data-sticky="true"] {
  box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.1);
}

/* Logo animation */
.group:hover .group-hover\:scale-105 {
  transform: scale(1.05);
}

/* Dropdown animations */
@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.dropdown-enter {
  animation: slideDown 0.3s ease-out;
}

/* Custom scrollbar for mobile menu */
.mobile-menu::-webkit-scrollbar {
  width: 0px;
  background: transparent;
}

/* Active link styles */
.router-link-active {
  color: #3b82f6 !important;
}

/* Hover effect for CTA button */
.cta-button:hover {
  box-shadow: 0 20px 40px -10px rgba(59, 130, 246, 0.3);
}

/* Mobile menu animation */
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: all 0.3s ease;
}

.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

/* Responsive adjustments */
@media (max-width: 1024px) {
  .backdrop-blur-lg {
    backdrop-filter: blur(12px);
  }
}

/* Focus styles for accessibility */
button:focus,
a:focus {
  outline: 2px solid #3b82f6;
  outline-offset: 2px;
}

button:focus:not(:focus-visible),
a:focus:not(:focus-visible) {
  outline: none;
}
</style>