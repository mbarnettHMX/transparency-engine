# https://eng.ms/docs/more/containers-secure-supply-chain/approved-images
FROM mcr.microsoft.com/oryx/python:3.9

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install necessary dependencies to compile
RUN apt-get update -y \
  && apt-get install -y gcc \
  && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python - --version 1.3.2
ENV PATH="${PATH}:/root/.local/bin"

WORKDIR /api-backend

COPY . .

# Start backend either in API or worker mode, depending on the WORKER env var

CMD [ "./scripts/start-backend.sh" ]