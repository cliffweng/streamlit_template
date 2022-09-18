FROM python:3.9-slim
LABEL maintainer="cliffweng"

# Install OS dependencies
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install --upgrade pip

# Copy the requirements and install them
RUN mkdir -p /home/streamlit
WORKDIR /home/streamlit
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the files
COPY . /home/streamlit

EXPOSE 8501

ENTRYPOINT [ "streamlit", "run"]
CMD ["Main.py"]