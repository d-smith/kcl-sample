# Kcl-Sample

## Notes

There are various overrises that can be provided, but based on the defauls I needed the following policies:

For cloud watch:

```console
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "cloudwatch:PutMetricData",
            "Resource": "*"
        }
    ]
}
```

DynamoDB:

```console
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:CreateTable",
                "dynamodb:PutItem",
                "dynamodb:DeleteItem",
                "dynamodb:DescribeTable",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:UpdateItem"
            ],
            "Resource": "arn:aws:dynamodb:us-east-1:account-no:table/foo"
        }
    ]
}
```

Kinesis:

```console
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStreamSummary",
                "kinesis:ListShards"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStreamConsumer",
                "kinesis:SubscribeToShard"
            ],
            "Resource": "arn:aws:kinesis:us-east-1:account-no:stream/foo/consumer/foo*"
        },
        {
            "Effect": "Allow",
            "Action": "kinesis:RegisterStreamConsumer",
            "Resource": "arn:aws:kinesis:us-east-1:account-no:stream/foo"
        }
    ]
}
```

## Build, run, etc.

```console
./gradlew build
env AWS_PROFILE=kclapp ./gradlew run --args="foo"
```

Can run the fat jar too.

```console
env AWS_PROFILE=kclapp java -jar ./build/libs/kcl-sample-all.jar foo
```

## Docker

```make image
docker run -e AWS_ACCESS_KEY_ID=kkkkk -e AWS_SECRET_ACCESS_KEY=ssss kcl-sample foo
```