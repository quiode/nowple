FROM node:fermium
RUN git clone https://github.com/quiode/nowple-website
RUN git clone https://github.com/quiode/nowple-backend
WORKDIR /nowple-website
RUN npm install --no-package-lock
RUN npm run build
RUN cp -r dist/nowple-website/* /nowple-backend/client/
WORKDIR /nowple-backend
RUN npm install --no-package-lock
RUN npm run build
WORKDIR dist
CMD node main.js