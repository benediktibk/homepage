FROM nginx
COPY me/*.png /usr/share/nginx/html/
COPY me/*.xml /usr/share/nginx/html/
COPY me/*.svg /usr/share/nginx/html/
COPY me/*.ico /usr/share/nginx/html/
COPY me/*.html /usr/share/nginx/html/
COPY me/*.json /usr/share/nginx/html/
COPY me/css /usr/share/nginx/html/css
COPY me/data /usr/share/nginx/html/data
COPY me/pic /usr/share/nginx/html/pic
