[![Build Status](https://travis-ci.org/jfenc91/aws-lambda-python-template.svg?branch=master)](https://travis-ci.org/jfenc91/aws-lambda-python-template)

# AWS Lambda Template

This is a template project for writing a lambda

## Getting Started
First install the requirements for the project using pip:

```
pip install -r requirements.txt
```

The tests can now be run with:

```
make test
```

To package the lambdas run:

```
make build
```

This creates zip files with the lambda code and its dependencies. This packaging is the only way to include dependencies
from a requirements.txt file inside a lambda. 

In order to publish the lambdas to s3 so that they can be deployed, two variables need to be set in the makefile:
* BUILD_LOCATION - A place on s3 that you can upload the lambda zip file to
* REGION - the aws region of the s3 bucket 

After those two parameters are set, build can be uploaded with the following:
```
make publish
```

## Motivation

As I have started using aws lambdas much more frequently, I have found them to be an excellent way of running simple 
deployment, maintenance, monitoring, and testing tasks. However, the initial development setup was a bit tedious to 
get off the ground. So I created this project.


## TODO

* Introduce a dockerfile that can run the build steps. It can be difficult to get the correct python setup on osx. 
* Add a deployment methodology. This project stops at uploading the lambda code at s3.
* Switch to pytest. It seems more full featured. I am particularly a fan of: https://github.com/joeyespo/pytest-watch
