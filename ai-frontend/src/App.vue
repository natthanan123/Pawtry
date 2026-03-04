<script setup>
import { ref } from 'vue'

// ระบบ Dark Mode Toggle
const isDarkMode = ref(false)

// ฟังก์ชันสำหรับสลับโหมด (จัดการทั้งตัวแปรและ Class ที่ <html>)
const toggleDarkMode = (value) => {
  isDarkMode.value = value
  if (value) {
    document.documentElement.classList.add('dark')
  } else {
    document.documentElement.classList.remove('dark')
  }
}

// ข้อมูลจำลอง (Mock Data)
const columns = ref([
  { id: 1, title: 'To Do', count: 4, dot: 'bg-blue-500' },
  { id: 2, title: 'In Progress', count: 3, dot: 'bg-yellow-400' },
  { id: 3, title: 'Review', count: 2, dot: 'bg-purple-500' },
  { id: 4, title: 'Done', count: 3, dot: 'bg-green-500' }
])

const tasks = ref([
  { id: 1, status_id: 1, title: 'Redesign Landing Page', desc: 'Update the hero section and improve mobile responsiveness', category: 'Marketing', catClass: 'text-purple-600 dark:text-purple-400', date: 'Mar 15, 2024' },
  { id: 2, status_id: 1, title: 'Setup CI/CD Pipeline', desc: 'Configure automated deployment for staging environment', category: 'IT', catClass: 'text-blue-600 dark:text-blue-400', date: 'Mar 18, 2024' },
  { id: 3, status_id: 1, title: 'Employee Onboarding Process', desc: 'Create comprehensive onboarding documentation for new hires', category: 'HR', catClass: 'text-green-600 dark:text-green-400', date: 'Mar 20, 2024' },
  { id: 4, status_id: 2, title: 'Database Optimization', desc: 'Optimize queries and improve database performance', category: 'IT', catClass: 'text-blue-600 dark:text-blue-400', date: 'Mar 12, 2024' },
  { id: 5, status_id: 2, title: 'User Research Interview', desc: 'Conduct interviews with 10 users to gather feedback', category: 'Marketing', catClass: 'text-purple-600 dark:text-purple-400', date: 'Mar 14, 2024' },
  { id: 6, status_id: 3, title: 'API Documentation Update', desc: 'Review and update API documentation for v2.0 release', category: 'IT', catClass: 'text-blue-600 dark:text-blue-400', date: 'Mar 10, 2024' },
  { id: 7, status_id: 3, title: 'Brand Guidelines Document', desc: 'Final review of updated brand guidelines before publishing', category: 'Marketing', catClass: 'text-purple-600 dark:text-purple-400', date: 'Mar 11, 2024' },
  { id: 8, status_id: 4, title: 'Security Audit Report', desc: 'Complete security audit findings and finalize final report', category: 'IT', catClass: 'text-blue-600 dark:text-blue-400', date: 'Mar 5, 2024' }
])
</script>

<template>
  <div class="flex h-screen bg-[#F8F9FA] dark:bg-[#0F172A] font-sans text-gray-800 dark:text-gray-100 transition-colors duration-300">
    
    <aside class="w-[260px] bg-white dark:bg-[#1E293B] border-r border-gray-200 dark:border-gray-800 hidden md:flex flex-col">
      <div class="h-[72px] flex items-center px-6">
        <div class="flex items-center gap-3 text-xl font-bold text-gray-800 dark:text-white">
          <div class="w-8 h-8 bg-blue-600 rounded flex items-center justify-center text-white">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
          </div>
          TaskFlow
        </div>
      </div>
      
      <nav class="flex-1 px-4 py-6">
        <a href="#" class="flex items-center gap-3 px-4 py-2.5 bg-blue-600 text-white rounded-lg font-medium shadow-sm transition-all">
          <span>✓</span> Tasks
        </a>
      </nav>

      <div class="p-6">
        <a href="#" class="flex items-center gap-3 text-gray-500 dark:text-gray-400 hover:text-gray-800 dark:hover:text-white font-medium transition-colors">
          <span></span> Logout
        </a>
      </div>
    </aside>

    <main class="flex-1 flex flex-col overflow-hidden">
      
      <header class="h-[72px] bg-white dark:bg-[#1E293B] border-b border-gray-200 dark:border-gray-800 flex items-center justify-between px-8">
        <div class="flex items-center gap-6 flex-1">
          <h1 class="text-2xl font-bold text-gray-800 dark:text-white">Task Board</h1>
          <div class="relative w-80 hidden lg:block">
            <input type="text" placeholder="Search tasks..." class="w-full pl-10 pr-4 py-2 rounded-lg border border-gray-200 dark:border-gray-700 bg-gray-50 dark:bg-[#0F172A] focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all text-sm text-gray-900 dark:text-gray-100">
            <span class="absolute left-3 top-2.5 text-gray-400">🔍</span>
          </div>
        </div>

        <div class="flex items-center gap-5">
          <button class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2.5 rounded-lg text-sm font-semibold flex items-center gap-2 shadow-sm transition-colors">
            <span>+</span> New Task
          </button>
          
          <div class="flex items-center gap-1 bg-gray-100 dark:bg-gray-800 p-1 rounded-full border border-gray-200 dark:border-gray-700">
            <button 
              @click="toggleDarkMode(false)" 
              :class="!isDarkMode ? 'bg-white dark:bg-gray-600 shadow-sm' : 'text-gray-400'" 
              class="p-1.5 rounded-full transition-all text-sm">
              ☀️
            </button>
            <button 
              @click="toggleDarkMode(true)" 
              :class="isDarkMode ? 'bg-white dark:bg-gray-600 shadow-sm' : 'text-gray-400'" 
              class="p-1.5 rounded-full transition-all text-sm">
              🌙
            </button>
          </div>
          
          <div class="flex items-center gap-3 pl-4 border-l border-gray-200 dark:border-gray-700">
            <img src="https://i.pravatar.cc/150?img=32" alt="User" class="w-9 h-9 rounded-full border-2 border-white dark:border-gray-800 shadow-sm">
            <div class="hidden sm:block">
              <p class="text-sm font-semibold leading-tight text-gray-800 dark:text-gray-100">Sarah Miller</p>
              <p class="text-xs text-gray-500 dark:text-gray-400">Admin</p>
            </div>
          </div>
        </div>
      </header>

      <div class="flex-1 overflow-x-auto p-8">
        <div class="flex gap-6 h-full items-start min-w-max">
          <div v-for="col in columns" :key="col.id" class="w-[340px] flex-shrink-0 flex flex-col">
            <div class="flex items-center justify-between mb-4">
              <div class="flex items-center gap-2.5">
                <span class="w-2.5 h-2.5 rounded-full" :class="col.dot"></span>
                <h2 class="font-bold text-lg text-gray-700 dark:text-gray-200">{{ col.title }}</h2>
                <span class="text-sm font-medium text-blue-600 dark:text-blue-400">{{ col.count }}</span>
              </div>
              <button class="text-gray-400 hover:text-gray-600">•••</button>
            </div>
            
            <div class="space-y-4">
              <div v-for="task in tasks.filter(t => t.status_id === col.id)" :key="task.id" 
                   class="bg-white dark:bg-[#1E293B] p-5 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-md transition-all cursor-pointer group">
                
                <div class="flex justify-between items-start mb-2">
                  <h3 class="font-bold text-[15px] leading-snug group-hover:text-blue-600 dark:group-hover:text-blue-400 transition-colors text-gray-800 dark:text-gray-100">
                    {{ task.title }}
                  </h3>
                </div>
                
                <p class="text-sm text-gray-500 dark:text-gray-400 mb-5 line-clamp-2 leading-relaxed">
                  {{ task.desc }}
                </p>
                
                <div class="flex items-center gap-4 mb-5">
                  <span class="text-xs font-semibold uppercase tracking-wider" :class="task.catClass">{{ task.category }}</span>
                  <span class="text-xs text-gray-500 dark:text-gray-500 flex items-center gap-1.5">
                    📅 {{ task.date }}
                  </span>
                </div>
                
                <div class="flex justify-between items-center border-t border-gray-100 dark:border-gray-800 pt-4 mt-2">
                  <div class="flex items-center gap-2">
                    <span class="text-[10px] text-gray-400 uppercase font-bold">Created</span>
                    <img :src="`https://i.pravatar.cc/150?img=${task.id + 10}`" class="w-6 h-6 rounded-full grayscale opacity-70">
                  </div>
                  <div class="flex items-center gap-2">
                    <span class="text-[10px] text-gray-400 uppercase font-bold">Assigned</span>
                    <div class="flex -space-x-2">
                      <img :src="`https://i.pravatar.cc/150?img=${task.id + 20}`" class="w-6 h-6 rounded-full border-2 border-white dark:border-[#1E293B]">
                      <img :src="`https://i.pravatar.cc/150?img=${task.id + 30}`" class="w-6 h-6 rounded-full border-2 border-white dark:border-[#1E293B]">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
  </div>
</template>