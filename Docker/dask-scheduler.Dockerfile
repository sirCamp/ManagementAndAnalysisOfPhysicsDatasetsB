FROM base-image

EXPOSE 8787 8786
ARG shared_workspace=/opt/workspace
WORKDIR ${shared_workspace}
#ENV DASK_SCHEDULER_HOST=dask-scheduler

CMD dask-scheduler --host ${DASK_SCHEDULER_HOST} --port 8786 --dashboard-address ${DASK_SCHEDULER_HOST}:8787