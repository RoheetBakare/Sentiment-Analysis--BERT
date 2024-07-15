FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y python3-pip && \
    apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender-dev && \
    apt-get clean

# Install Python packages
RUN pip3 install torch transformers flask

# Copy the model script
COPY inference.py /opt/ml/model/code/inference.py

ENV PATH="/usr/local/bin:${PATH}"

# Define entrypoint
ENTRYPOINT ["python3", "/opt/ml/model/code/inference.py"]
