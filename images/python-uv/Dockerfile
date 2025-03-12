FROM ubuntu:24.04

ARG PYTHON_VERSION=3.13
ARG UV_BASE_DIR=/opt/uv

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Customize uv
ENV PATH="${UV_BASE_DIR}/bin:${PATH}" \
    UV_PYTHON="${PYTHON_VERSION}" \
    UV_PYTHON_INSTALL_DIR="${UV_BASE_DIR}/python" \
    UV_PYTHON_BIN_DIR="${UV_BASE_DIR}/bin" \
    UV_TOOL_DIR="${UV_BASE_DIR}/tool" \
    UV_TOOL_BIN_DIR="${UV_BASE_DIR}/bin"

# Install python
RUN mkdir -p \
        "${UV_PYTHON_INSTALL_DIR}" \
        "${UV_TOOL_DIR}" \
        "${UV_BASE_DIR}/bin" \
    && chmod 0777 \
        "${UV_PYTHON_INSTALL_DIR}" \
        "${UV_TOOL_DIR}" \
        "${UV_BASE_DIR}/bin" \
    && uv python install "${PYTHON_VERSION}"

# Create /app
ENV APP_DIR="/app"
RUN mkdir "${APP_DIR}" \
    && chmod 0777 "${APP_DIR}"
WORKDIR "${APP_DIR}"
