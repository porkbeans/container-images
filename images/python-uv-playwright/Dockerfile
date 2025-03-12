ARG PYTHON_VERSION=3.13

FROM ghcr.io/porkbeans/python-uv:${PYTHON_VERSION}

# Create /opt/playwright
ENV PLAYWRIGHT_BROWSERS_PATH="/opt/playwright"
RUN mkdir -p "${PLAYWRIGHT_BROWSERS_PATH}" \
    && chmod 0777 "${PLAYWRIGHT_BROWSERS_PATH}"

# Install playwright
RUN \
    --mount=type=cache,target=/root/.cache \
    uv tool install playwright

# Install browser dependencies
RUN \
    --mount=type=cache,target=/root/.cache \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    uv tool run playwright install-deps chromium firefox
