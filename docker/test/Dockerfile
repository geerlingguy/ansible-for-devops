FROM busybox
LABEL maintainer="Jeff Geerling"

# Install curl and wget
RUN opkg-install curl wget

WORKDIR /app

COPY myscript.sh .

EXPOSE 80

# Define the command to run when the container starts
CMD ["/bin/true"]