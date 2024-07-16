### Use AWS base image obtained from https://gallery.ecr.aws/sam/build-python3.12
FROM public.ecr.aws/sam/build-python3.12:1

### Nominate a working directory inside the container.
WORKDIR /app

### Install OS-level dependencies
### AWS Lambda runtimes and similar (such as sam/build-python) use `dnf` instead of either `yum` or `apt-get`.
RUN dnf update
RUN dnf install zip -y

### Copy the Python requirements file to the working directory inside the container.
COPY requirements.txt .

### Install the Python packages listed in requirements.txt
RUN pip3 install -r requirements.txt -t /opt/python/
### This is an alternative install location that is specific for different Python versions
# RUN pip install -r requirements.txt -t /opt/python/lib/python3.12/site-packages/

### Keep the container alive to allow time for `docker exec` steps to run.
CMD sleep 3600
### Alternatively, zip the contents of Python dependencies as part of container startup, and then sleep to allow for time to copy out using `docker cp`
# CMD cd /opt && zip -r9q /app/layer.zip . && echo "layer.zip generated successfully." && sleep 3600