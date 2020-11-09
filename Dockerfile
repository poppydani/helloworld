
FROM node:10-alpine
  
# 代表生产环境
ENV PROJECT_ENV production
# 许多 package 会根据此环境变量，做出不同的行为
# 另外，在 webpack 中打包也会根据此环境变量做出优化，但是 create-react-app 在打>包时会写死该环境变量
ENV NODE_ENV production
RUN mkdir /public
ADD . /public
WORKDIR /public
RUN npm install --production
CMD cd /public && echo 'watch file list' && ls && npm run dev
EXPOSE 8080