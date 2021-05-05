FROM base-image

ARG shared_workspace=/opt/workspace


EXPOSE 8888
WORKDIR ${shared_workspace}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=