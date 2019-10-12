# AI powered SURFALERT prototype

Demonstrates an ML model trained on detecting when there are surfers visible on webcam images. The assumption being, if surfers are present then conditions are surfable. Subscribers will receive alerts indicating conditions are "surfable"

### Components

- colab juypter notebook to train model
- tensorflow using trained model running on AWS Fargate
- flaskapp frontend with stripe integration running on AWS ECS.

### Training

Training is done via colab and the model and label files are written to an AWS S3 bucket to be accessed by the classifier.

### Operation

A scheduled job runs at predetermined times during the day. The webcam image is fetch and written to an AWS S3 bucket.
This event triggers AWS Lambda to launch the tensorflow container running on FARGATE. The result is written to AWS S3 for display and notification via the flask app.

Example images

![alt text](https://fdc0580f5e1566dde1f6c9a23000a522.s3.amazonaws.com/images/69b7ea03dec4f4d6d1cfa768f3ca166c.jpeg "webcam image")

surfing 0.9540997
notsurfing 0.045900255

https://fdc0580f5e1566dde1f6c9a23000a522.s3.amazonaws.com/results/69b7ea03dec4f4d6d1cfa768f3ca166c.txt
