FROM cirrusci/flutter:2.8.0

# Set environment variables
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

WORKDIR /app

COPY pubspec.yaml pubspec.yaml
COPY pubspec.lock pubspec.lock

RUN flutter pub get

COPY . .

# Run flutter doctor
RUN flutter doctor

RUN flutter build apk --release

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Record the exposed port
EXPOSE 9000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]