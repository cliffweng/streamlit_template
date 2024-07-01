FROM python:3.9-slim
LABEL maintainer="wengs"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements and install them
RUN mkdir -p /home/streamlit
WORKDIR /home/streamlit

COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the files
# COPY . /home/streamlit

ENTRYPOINT [ "streamlit", "run"]
CMD ["Main.py"]
