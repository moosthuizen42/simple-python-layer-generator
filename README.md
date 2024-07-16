# Build a Python layer for AWS Lambda

This repo contains scripting to create a Python layer for use in AWS Lambda that contains all the dependencies required to run separately-deployed function code.

The layer is built using a Docker image; the base image used is one published by AWS and closely resembles the Lambda runtime for Python 3.12 (which matches the most recent Lambda Python runtime at time of writing):

https://gallery.ecr.aws/sam/build-python3.12

If needed, adapting the `Dockerfile` to match other Python versions (ie. other Lambda runtimes) should be trivial.

## Usage

### Step 1: Defining required Python packages
Modify `requirements.txt` as needed.

### Step 2: Build the layer
```sh
./make_layer.sh
```

### Step 3: Done!

Find your newly-created layer at `layers/layer.zip`.

If using the web-based AWS Console to create your Lambda layer, the direct upload limit is usually insufficient. Instead, upload the resulting layer to S3 first (via CLI or web).


# TLDR
Specify `requirements.txt` -> Run `./make_layer.sh` -> Receive `layer.zip` ready for use with Lambda (Python 3.12).