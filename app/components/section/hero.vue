<template>
  <div>
    <section class="relative min-h-screen overflow-hidden bg-gradient-to-br from-slate-900 via-blue-900 to-blue-800">
      <!-- Animated Background Elements -->
      <div class="absolute inset-0">
        <!-- Geometric shapes -->
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-600/15 rounded-full animate-pulse"></div>
        <div class="absolute top-40 right-32 w-24 h-24 bg-blue-700/15 rounded-full animate-ping"></div>
        <div class="absolute bottom-40 left-1/4 w-40 h-40 bg-blue-500/15 rounded-full animate-bounce"></div>

        <!-- Grid pattern -->
        <div class="absolute inset-0 opacity-20">
          <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
            <defs>
              <pattern id="grid" width="100" height="100" patternUnits="userSpaceOnUse">
                <circle cx="50" cy="50" r="1" fill="currentColor" opacity="0.3" />
              </pattern>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid)" class="text-white" />
          </svg>
        </div>
      </div>

      <!-- Gradient Overlay -->
      <div class="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent"></div>

      <div class="relative flex items-center min-h-screen px-4 mx-auto max-w-7xl">
        <div class="grid w-full gap-16 lg:grid-cols-2 lg:gap-20 items-center">

          <!-- Left Content -->
          <div class="text-white space-y-8 animate-fade-in-up">


            <!-- Main Title -->
            <div class="space-y-4">
              <h1 class="text-4xl font-bold leading-tight md:text-5xl lg:text-6xl xl:text-7xl">
                <span
                  class="block text-transparent bg-clip-text bg-gradient-to-r from-blue-300 via-blue-400 to-blue-200 animate-gradient">
                  Inovasi
                </span>
                <span class="block mt-2">
                  Teknologi untuk
                </span>
                <span class="block text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-blue-300">
                  Masa Depan
                </span>
              </h1>
            </div>

            <!-- Description -->
            <p class="text-xl leading-relaxed text-gray-300 max-w-2xl">
              TorkataTech menghadirkan solusi teknologi inovatif yang mengubah cara bisnis Anda beroperasi.
              Dari pengembangan web hingga transformasi digital, kami membantu mewujudkan visi teknologi Anda.
            </p>

            <!-- CTA Buttons -->
            <div class="flex flex-col sm:flex-row gap-4">
              <button
                class="group relative px-8 py-4 bg-gradient-to-r from-blue-700 to-blue-600 rounded-2xl font-semibold text-white overflow-hidden transition-all duration-300 hover:scale-105 hover:shadow-2xl hover:shadow-blue-600/25">
                <span class="relative z-10 flex items-center justify-center">
                  Mulai Konsultasi
                  <svg class="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" fill="currentColor"
                    viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
                      d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                      clip-rule="evenodd" />
                  </svg>
                </span>
                <div
                  class="absolute inset-0 bg-gradient-to-r from-blue-600 to-blue-700 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                </div>
              </button>

              <button
                class="px-8 py-4 border-2 border-white/20 rounded-2xl font-semibold text-white hover:bg-white/10 hover:border-white/40 transition-all duration-300 backdrop-blur-sm">
                Lihat Portfolio
              </button>
            </div>

            <!-- Stats -->
            <!-- <div class="flex gap-8 pt-8">
              <div class="text-center">
                <div class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">100+</div>
                <div class="text-sm text-gray-400">Project Selesai</div>
              </div>
              <div class="text-center">
                <div class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-400 to-pink-400">50+</div>
                <div class="text-sm text-gray-400">Client Puas</div>
              </div>
              <div class="text-center">
                <div class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-green-400 to-blue-400">5+</div>
                <div class="text-sm text-gray-400">Tahun Pengalaman</div>
              </div>
            </div> -->
          </div>

          <!-- Right Content - 3D Visual -->
          <div class="relative flex justify-center items-center">
            <!-- Main 3D Card -->
            <div class="relative w-80 h-96 perspective-1000">
              <div
                class="relative w-full h-full transform-gpu transition-transform duration-700 hover:rotate-y-12 hover:rotate-x-6 preserve-3d">
                <!-- Front Card -->
                <div
                  class="absolute inset-0 bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-lg rounded-3xl border border-white/20 shadow-2xl">
                  <div class="p-8 h-full flex flex-col justify-between">
                    <!-- Tech Icons -->
                    <div class="grid grid-cols-3 gap-4 mb-8">
                      <div class="w-12 h-12 bg-blue-500/20 rounded-xl flex items-center justify-center">
                        <svg class="w-6 h-6 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                          <path
                            d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" />
                        </svg>
                      </div>
                      <div class="w-12 h-12 bg-purple-500/20 rounded-xl flex items-center justify-center">
                        <svg class="w-6 h-6 text-purple-400" fill="currentColor" viewBox="0 0 20 20">
                          <path
                            d="M2 6a2 2 0 012-2h12a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6zM14.553 7.106A1 1 0 0014 8v4a1 1 0 00.553.894l2 1A1 1 0 0018 13V7a1 1 0 00-1.447-.894l-2 1z" />
                        </svg>
                      </div>
                      <div class="w-12 h-12 bg-cyan-500/20 rounded-xl flex items-center justify-center">
                        <svg class="w-6 h-6 text-cyan-400" fill="currentColor" viewBox="0 0 20 20">
                          <path fill-rule="evenodd"
                            d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                            clip-rule="evenodd" />
                        </svg>
                      </div>
                    </div>

                    <!-- Center Logo -->
                    <div class="flex justify-center mb-8">
                      <div
                        class="w-20 h-20 bg-gradient-to-br from-blue-600 to-blue-700 rounded-2xl flex items-center justify-center shadow-lg">
                        <span class="text-2xl font-bold text-white">TT</span>
                      </div>
                    </div>

                    <!-- Bottom Text -->
                    <div class="text-center">
                      <h3 class="text-lg font-semibold text-white mb-2">Technology Solutions</h3>
                      <p class="text-sm text-gray-300">Innovation • Quality • Excellence</p>
                    </div>
                  </div>
                </div>

                <!-- Floating Elements -->
                <div
                  class="absolute -top-4 -right-4 w-8 h-8 bg-green-400 rounded-full animate-bounce flex items-center justify-center">
                  <svg class="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
                      d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                      clip-rule="evenodd" />
                  </svg>
                </div>

                <div
                  class="absolute -bottom-4 -left-4 w-12 h-12 bg-gradient-to-r from-blue-600 to-blue-700 rounded-full animate-pulse flex items-center justify-center">
                  <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                </div>
              </div>
            </div>

            <!-- Background Orbs -->
            <div class="absolute top-0 right-0 w-32 h-32 bg-blue-600/20 rounded-full blur-xl animate-pulse"></div>
            <div class="absolute bottom-0 left-0 w-40 h-40 bg-blue-700/20 rounded-full blur-xl animate-pulse delay-300">
            </div>
          </div>
        </div>
      </div>

      <!-- Services Section -->
      <div class="relative px-4 pb-20 mx-auto max-w-7xl">
        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">

          <!-- Service 1 -->
          <div
            class="group p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300 hover:scale-105">
            <div
              class="w-12 h-12 bg-gradient-to-br from-blue-600 to-blue-700 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path
                  d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" />
              </svg>
            </div>
            <h3 class="text-lg font-bold text-white mb-2">Web Development</h3>
            <p class="text-sm text-gray-300 mb-4">Membangun website modern dan responsif dengan teknologi terkini</p>
            <a href="#"
              class="inline-flex items-center text-sm font-semibold text-blue-300 hover:text-blue-200 transition-colors">
              Pelajari lebih
              <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="currentColor"
                viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </a>
          </div>

          <!-- Service 2 -->
          <div
            class="group p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300 hover:scale-105">
            <div
              class="w-12 h-12 bg-gradient-to-br from-blue-500 to-blue-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path
                  d="M2 6a2 2 0 012-2h12a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6zM14.553 7.106A1 1 0 0014 8v4a1 1 0 00.553.894l2 1A1 1 0 0018 13V7a1 1 0 00-1.447-.894l-2 1z" />
              </svg>
            </div>
            <h3 class="text-lg font-bold text-white mb-2">Mobile Apps</h3>
            <p class="text-sm text-gray-300 mb-4">Aplikasi mobile yang user-friendly untuk iOS dan Android</p>
            <a href="#"
              class="inline-flex items-center text-sm font-semibold text-blue-300 hover:text-blue-200 transition-colors">
              Pelajari lebih
              <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="currentColor"
                viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </a>
          </div>

          <!-- Service 3 -->
          <div
            class="group p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300 hover:scale-105">
            <div
              class="w-12 h-12 bg-gradient-to-br from-blue-700 to-blue-800 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path
                  d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" />
              </svg>
            </div>
            <h3 class="text-lg font-bold text-white mb-2">Cloud Solutions</h3>
            <p class="text-sm text-gray-300 mb-4">Solusi cloud computing yang scalable dan aman untuk bisnis</p>
            <a href="#"
              class="inline-flex items-center text-sm font-semibold text-blue-300 hover:text-blue-200 transition-colors">
              Pelajari lebih
              <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="currentColor"
                viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </a>
          </div>

          <!-- Service 4 -->
          <div
            class="group p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300 hover:scale-105">
            <div
              class="w-12 h-12 bg-gradient-to-br from-blue-800 to-slate-700 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <h3 class="text-lg font-bold text-white mb-2">IT Consulting</h3>
            <p class="text-sm text-gray-300 mb-4">Konsultasi teknologi untuk optimalisasi infrastruktur IT</p>
            <a href="#"
              class="inline-flex items-center text-sm font-semibold text-blue-300 hover:text-blue-200 transition-colors">
              Pelajari lebih
              <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="currentColor"
                viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                  clip-rule="evenodd" />
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'

onMounted(() => {
  // Add any initialization code here
})
</script>

<style scoped>
/* Custom animations and 3D effects */
@keyframes gradient {

  0%,
  100% {
    background-position: 0% 50%;
  }

  50% {
    background-position: 100% 50%;
  }
}

@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(30px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-gradient {
  background-size: 200% 200%;
  animation: gradient 3s ease infinite;
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
}

.perspective-1000 {
  perspective: 1000px;
}

.preserve-3d {
  transform-style: preserve-3d;
}

.rotate-y-12 {
  transform: rotateY(12deg);
}

.rotate-x-6 {
  transform: rotateX(6deg);
}

/* Glassmorphism effects */
.backdrop-blur-sm {
  backdrop-filter: blur(4px);
}

.backdrop-blur-lg {
  backdrop-filter: blur(16px);
}

/* Hover effects */
.group:hover .group-hover\:translate-x-1 {
  transform: translateX(0.25rem);
}

.group:hover .group-hover\:scale-110 {
  transform: scale(1.1);
}

/* Custom gradient text */
.bg-clip-text {
  -webkit-background-clip: text;
  background-clip: text;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .perspective-1000 {
    perspective: 800px;
  }
}
</style>