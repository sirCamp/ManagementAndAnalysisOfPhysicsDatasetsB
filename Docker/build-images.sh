docker build \
 -f base-image.Dockerfile \
 -t base-image .

#local-images
docker build \
 -f parallel.Dockerfile \
 -t parallel-local .

docker build \
 -f dask-scheduler.Dockerfile \
 -t dask-scheduler-local .


docker build \
 -f dask-worker.Dockerfile \
 -t dask-worker-local .


docker build \
 -f dask-client-jupyter.Dockerfile \
 -t dask-client-jupyter-local .
