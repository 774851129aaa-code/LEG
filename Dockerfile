# اختيار صورة Node خفيفة
FROM node:18-alpine

# تحديد المجلد داخل الحاوية
WORKDIR /app

# نسخ ملفات الاعتماديات أولاً لتحسين الكاش
COPY package*.json ./

# تثبيت الاعتماديات (بما فيها الإنتاج فقط)
RUN npm ci --only=production

# نسخ باقي ملفات الموقع والمشروع
COPY . .

# منفذ التطبيق (Render يزود المتغير PORT تلقائياً)
ENV PORT=10000
EXPOSE 10000

# أمر التشغيل
CMD ["npm", "start"]
