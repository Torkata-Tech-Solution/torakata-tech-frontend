<template>
  <footer
    class="relative bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 dark:from-gray-950 dark:via-gray-900 dark:to-gray-950 overflow-hidden">
    <!-- Background Pattern -->
    <div class="absolute inset-0 opacity-10">
      <svg class="w-full h-full" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000">
        <defs>
          <pattern id="grid" width="50" height="50" patternUnits="userSpaceOnUse">
            <circle cx="25" cy="25" r="1" fill="currentColor" opacity="0.3" />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#grid)" />
      </svg>
    </div>

    <!-- Gradient Overlay -->
    <div class="absolute inset-0 bg-gradient-to-t from-blue-600/20 via-transparent to-purple-600/20"></div>

    <div class="relative max-w-7xl mx-auto px-4 py-16 sm:py-24">
      <!-- Main Footer Content -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 lg:gap-8">

        <!-- Company Info -->
        <div class="lg:col-span-2">
          <div class="flex items-center mb-6">
            <div class="relative">
              <img src="/images/logo.png" alt="TorkataTech Logo"
                class="w-12 h-12 rounded-xl shadow-lg object-cover bg-white" />
            </div>
            <div class="ml-4">
              <h3 class="text-2xl font-bold text-white">Torkata</h3>
              <p class="text-blue-300 text-sm">Tech Solution</p>
            </div>
          </div>

          <p class="text-gray-300 text-lg leading-relaxed mb-8 max-w-md">
            Inovasi teknologi terdepan untuk transformasi digital perusahaan Anda. Kami menghadirkan solusi yang handal
            dan modern.
          </p>

          <!-- Newsletter -->
          <div class="bg-white/5 backdrop-blur-sm rounded-2xl p-6 border border-white/10">
            <h4 class="text-white font-semibold mb-3">Newsletter</h4>
            <p class="text-gray-300 text-sm mb-4">Dapatkan update terbaru tentang teknologi dan layanan kami</p>
            <div class="flex flex-col sm:flex-row gap-3">
              <input type="email" placeholder="Email address"
                class="flex-1 px-4 py-3 bg-white/10 border border-white/20 rounded-xl text-white placeholder-gray-400 focus:outline-none focus:border-blue-400 focus:bg-white/20 transition-all duration-300">
              <button
                class="px-6 py-3 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-xl hover:from-blue-600 hover:to-purple-700 transition-all duration-300 transform hover:scale-105 shadow-lg font-medium">
                Subscribe
              </button>
            </div>
          </div>
        </div>

        <!-- Quick Links -->
        <div>
          <h3 class="text-white font-bold text-lg mb-6 relative">
            Layanan
            <div class="absolute -bottom-2 left-0 w-12 h-1 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full">
            </div>
          </h3>
          <ul class="space-y-4">
            <li>
              <NuxtLink to="/services/web-development"
                class="text-gray-300 hover:text-white transition-colors duration-300 flex items-center group">
                <svg class="w-4 h-4 mr-3 text-blue-400 group-hover:text-blue-300 transition-colors" fill="currentColor"
                  viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                    clip-rule="evenodd" />
                </svg>
                Web Development
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/services/mobile-app"
                class="text-gray-300 hover:text-white transition-colors duration-300 flex items-center group">
                <svg class="w-4 h-4 mr-3 text-blue-400 group-hover:text-blue-300 transition-colors" fill="currentColor"
                  viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                    clip-rule="evenodd" />
                </svg>
                Mobile Apps
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/services/cloud-solutions"
                class="text-gray-300 hover:text-white transition-colors duration-300 flex items-center group">
                <svg class="w-4 h-4 mr-3 text-blue-400 group-hover:text-blue-300 transition-colors" fill="currentColor"
                  viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                    clip-rule="evenodd" />
                </svg>
                Cloud Solutions
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/services/consulting"
                class="text-gray-300 hover:text-white transition-colors duration-300 flex items-center group">
                <svg class="w-4 h-4 mr-3 text-blue-400 group-hover:text-blue-300 transition-colors" fill="currentColor"
                  viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                    clip-rule="evenodd" />
                </svg>
                IT Consulting
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- Contact Info -->
        <div>
          <h3 class="text-white font-bold text-lg mb-6 relative">
            Kontak
            <div class="absolute -bottom-2 left-0 w-12 h-1 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full">
            </div>
          </h3>
          <ul class="space-y-4">
            <li class="flex items-start">
              <div class="w-10 h-10 bg-blue-500/20 rounded-lg flex items-center justify-center mr-3 mt-1">
                <svg class="w-5 h-5 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z"
                    clip-rule="evenodd" />
                </svg>
              </div>
              <div>
                <p class="text-gray-300 text-sm">Padang, Indonesia</p>
                <p class="text-gray-400 text-xs">{{ site?.data?.address || '-' }}</p>
              </div>
            </li>
            <li class="flex items-center">
              <div class="w-10 h-10 bg-green-500/20 rounded-lg flex items-center justify-center mr-3">
                <svg class="w-5 h-5 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                  <path
                    d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
                </svg>
              </div>
              <div>
                <p class="text-gray-300 text-sm">{{ site?.data?.phone || '-' }}</p>
                <p class="text-gray-400 text-xs">Senin - Jumat, 9:00 - 17:00</p>
              </div>
            </li>
            <li class="flex items-center">
              <div class="w-10 h-10 bg-purple-500/20 rounded-lg flex items-center justify-center mr-3">
                <svg class="w-5 h-5 text-purple-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                  <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                </svg>
              </div>
              <div>
                <p class="text-gray-300 text-sm">{{ site?.data?.email || '-' }}</p>
                <p class="text-gray-400 text-xs">Response within 24h</p>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <!-- Social Media & Bottom -->
      <div class="mt-16 pt-8 border-t border-white/10">
        <div class="flex flex-col lg:flex-row justify-between items-center">

          <!-- Social Media -->
          <div class="flex items-center space-x-6 mb-6 lg:mb-0">
            <p class="text-gray-300 font-medium">Follow Us:</p>
            <div class="flex space-x-4">
              <a :href="site?.data?.twitter || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-blue-600 rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z" />
                </svg>
              </a>
              <a :href="site?.data?.facebook || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-blue-800 rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
              </a>
              <a :href="site?.data?.instagram || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-pink-600 rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M12.004 5.838c-3.403 0-6.158 2.758-6.158 6.158 0 3.403 2.758 6.158 6.158 6.158 3.403 0 6.158-2.758 6.158-6.158 0-3.403-2.758-6.158-6.158-6.158zm0 10.155c-2.209 0-3.997-1.789-3.997-3.997s1.789-3.997 3.997-3.997 3.997 1.789 3.997 3.997c0 2.208-1.789 3.997-3.997 3.997z" />
                  <circle cx="18.406" cy="5.594" r="1.44" />
                  <path
                    d="M12.004 0C8.852 0 8.44.015 7.052.072 5.668.13 4.718.333 3.897.63c-.848.313-1.567.731-2.284 1.448S.943 3.897.63 4.745C.333 5.566.13 6.516.072 7.9.012 9.289 0 9.701 0 12.004s.015 2.715.072 4.103c.058 1.384.261 2.334.558 3.155.313.848.731 1.567 1.448 2.284s1.436 1.136 2.284 1.448c.821.297 1.771.5 3.155.558 1.388.058 1.8.072 4.103.072s2.715-.015 4.103-.072c1.384-.058 2.334-.261 3.155-.558.848-.313 1.567-.731 2.284-1.448s1.136-1.436 1.448-2.284c.297-.821.5-1.771.558-3.155.058-1.388.072-1.8.072-4.103s-.015-2.715-.072-4.103c-.058-1.384-.261-2.334-.558-3.155-.313-.848-.731-1.567-1.448-2.284S19.552.943 18.704.63c-.821-.297-1.771-.5-3.155-.558C15.161.012 14.749 0 12.446 0h-.442zm0 2.16c3.203 0 3.585.016 4.85.071 1.17.055 1.805.249 2.227.415.562.217.96.477 1.382.896.419.42.679.819.896 1.381.164.422.36 1.057.413 2.227.057 1.266.07 1.646.07 4.85s-.015 3.585-.074 4.85c-.061 1.17-.256 1.805-.421 2.227-.224.562-.479.96-.899 1.382-.419.419-.824.679-1.38.896-.42.164-1.065.36-2.235.413-1.274.057-1.649.07-4.859.07-3.211 0-3.586-.015-4.859-.074-1.171-.061-1.816-.256-2.236-.421-.569-.224-.96-.479-1.379-.899-.421-.419-.69-.824-.9-1.38-.165-.42-.359-1.065-.42-2.235-.045-1.26-.061-1.649-.061-4.844 0-3.196.016-3.586.061-4.861.061-1.17.255-1.814.42-2.234.21-.57.479-.96.9-1.381.419-.419.81-.689 1.379-.898.42-.166 1.051-.361 2.221-.421 1.275-.045 1.65-.06 4.859-.06l.045.03zm0 3.678c-3.405 0-6.162 2.76-6.162 6.162 0 3.405 2.76 6.162 6.162 6.162 3.405 0 6.162-2.76 6.162-6.162 0-3.405-2.76-6.162-6.162-6.162zM12.004 16c-2.209 0-3.997-1.789-3.997-3.996 0-2.209 1.789-3.997 3.997-3.997s3.997 1.789 3.997 3.997c0 2.207-1.789 3.996-3.997 3.996zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
                </svg>
              </a>
              <a :href="site?.data?.linkedin || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-blue-700 rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
              </a>
              <a :href="site?.data?.youtube || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-red-600 rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M23.498 6.186a2.994 2.994 0 0 0-2.112-2.112C19.545 3.5 12 3.5 12 3.5s-7.545 0-9.386.574a2.994 2.994 0 0 0-2.112 2.112C0 8.027 0 12 0 12s0 3.973.502 5.814a2.994 2.994 0 0 0 2.112 2.112C4.455 20.5 12 20.5 12 20.5s7.545 0 9.386-.574a2.994 2.994 0 0 0 2.112-2.112C24 15.973 24 12 24 12s0-3.973-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
                </svg>
              </a>
              <a :href="site?.data?.tiktok || '#'" target="_blank" rel="noopener"
                class="w-12 h-12 bg-white/10 hover:bg-black rounded-xl flex items-center justify-center transition-all duration-300 transform hover:scale-110 group">
                <svg class="w-5 h-5 text-gray-300 group-hover:text-white transition-colors" fill="currentColor"
                  viewBox="0 0 24 24">
                  <path
                    d="M12.004 2.002c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10 4.477-10 10-10zm2.5 3.5v7.5a2.5 2.5 0 1 1-2.5-2.5h1V7.5h-1a4 4 0 1 0 4 4V5.502h-1.5z" />
                </svg>
              </a>
             
            </div>
          </div>

          <!-- Copyright -->
          <div class="text-center lg:text-right">
            <p class="text-gray-400 text-sm">
              © <span id="currentYear">2024</span> TorkataTech Solutions. All rights reserved.
            </p>
            <p class="text-gray-500 text-xs mt-1">
              PT. TORKATA JAYA PERSADA
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Floating elements for visual appeal -->
    <div class="absolute top-20 left-10 w-2 h-2 bg-blue-400 rounded-full animate-ping opacity-75"></div>
    <div class="absolute top-40 right-20 w-1 h-1 bg-purple-400 rounded-full animate-pulse"></div>
    <div class="absolute bottom-32 left-1/4 w-1 h-1 bg-green-400 rounded-full animate-bounce"></div>
  </footer>
</template>

<script lang="ts" setup>

import { onMounted } from 'vue'
const { data: site } = useNuxtData < any > ('site-meta')

onMounted(() => {
  // Update current year
  const currentYearElement = document.getElementById('currentYear')
  if (currentYearElement) {
    currentYearElement.textContent = new Date().getFullYear().toString()
  }
})
</script>

<style scoped>
/* Additional custom animations */
@keyframes float {

  0%,
  100% {
    transform: translateY(0px);
  }

  50% {
    transform: translateY(-10px);
  }
}

.animate-float {
  animation: float 3s ease-in-out infinite;
}

/* Custom scrollbar for newsletter input */
input::-webkit-scrollbar {
  width: 0px;
  background: transparent;
}

/* Glassmorphism effect */
.backdrop-blur-sm {
  backdrop-filter: blur(4px);
}
</style>