FROM registry.cn-hangzhou.aliyuncs.com/choerodon-tools/frontbase:0.5.0

ENV PRO_API_HOST gateway.choerodon.com.cn
ENV PRO_TESTMANAGER_HOST localhost:8060
ENV PRO_CLIENT_ID testManager
ENV PRO_LOCAL true
ENV PRO_TITLE_NAME Choerodon
ENV PRO_HEADER_TITLE_NAME Choerodon
ENV PRO_COOKIE_SERVER choerodon.com.cn
ENV PRO_HTTP http

RUN echo "Asia/shanghai" > /etc/timezone;
ADD dist /usr/share/nginx/html
COPY testManager-structure/testManager-enterpoint.sh /usr/share/nginx/html
COPY config.yml /usr/share/nginx/html
COPY structure/sql.py /usr/share/nginx/html
RUN chmod 777 /usr/share/nginx/html/testManager-enterpoint.sh
ENTRYPOINT ["/usr/share/nginx/html/testManager-enterpoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

