FROM base-image

#EXPOSE 8787 8786
ARG shared_workspace=/opt/workspace
WORKDIR ${shared_workspace}

CMD dask-worker ${DASK_SCHEDULER_HOST}:8786 --memory-limit ${DASK_WORKER_MEMORY} --nprocs ${DASK_WORKER_CORES} --nthreads ${DASK_WORKER_THREADS}