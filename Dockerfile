# Use an official lightweight base image
FROM alpine:3.18

# Set environment variables
ENV HELM_VERSION="v3.13.0"

# Install necessary packages, including Helm
RUN apk add --no-cache curl bash \
    && curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && apk del curl

# Verify Helm installation
RUN helm version

# Default command to run Helm (can be overridden)
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["--help"]
