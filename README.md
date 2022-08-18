# Simple FastAPI example with Poetry


# Running

To run locally

    uvicorn main:app --host 0.0.0.0 --port 8080

To run container locally

    # Build the container and give it a label
    docker build . -t fastapiexample:latest
    # run container and bind container 80 to host 8080
    docker run --rm -p 127.0.0.1:8080:80/tcp fastapiexample:latest 


## Viewing documentation

 * [Swagger](http://127.0.0.1:8080/docs)
 * [ReDocs](http://127.0.0.1:8080/redoc)

# Container builds

 * https://fastapi.tiangolo.com/deployment/docker/
 * https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker/54763270#54763270
