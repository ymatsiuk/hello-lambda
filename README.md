# hello-lambda
Only for the test purpose

### Build

```bash
docker build -t test .
```

### Run

```bash
docker run -p 8081:8080 -it test
```

### Invoke

Using aws cli:

```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_REGION=us-east-1
aws lambda invoke --endpoint http://localhost:8081 --no-sign-request --function-name function --cli-binary-format raw-in-base64-out --payload '{"name": "bla"}' output.json
```

Using curl:

```bash
curl -d '{"name": "bla"}' http://localhost:8081/2015-03-31/functions/function/invocations
```

Use in `docker-compose.yaml` for local testing:

```yaml
    lambda:
      image: test
      ports:
        - "8081:8080"

```
