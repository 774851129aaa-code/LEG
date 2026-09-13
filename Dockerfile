FROM node:18-alpine

WORKDIR /app

# نسخ ملفات package.json (وإن وجد lock)
COPY package*.json ./

# تثبيت الاعتماديات (يدعم وجود أو عدم وجود lock-file)
RUN npm install --omit=dev

# نسخ باقي الملفات
COPY . .

ENV PORT=10000
EXPOSE 10000

CMD ["npm", "start"]
