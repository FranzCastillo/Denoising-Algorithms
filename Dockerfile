FROM python:3.12

# Dependencies Intall and Update
RUN apt-get update && apt-get install -y \
    build-essential \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Install requirements
COPY requirements.txt /temp/requirements.txt
RUN pip install -r /temp/requirements.txt

# Set the working directory
WORKDIR /app

# Expose the port
EXPOSE 8888

# Run the Jupyter notebook
CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root && tail -f /dev/null"]
