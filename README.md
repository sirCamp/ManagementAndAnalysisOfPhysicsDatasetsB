# Management and Analysis of Physics Datasets (Mod. B) - 2020/2021

## First step

Clone this repo if has not already been done: `git clone https://github.com/sirCamp/ManagementAndAnalysisOfPhysicsDatasetsB.git`
All the lectures will be pushed on the repo. Update it before each lecture.

## Docker Users

It is possible to run all the exercises using docker. This is particularly usefull if you are experiencing problems with virtual
or you don't want to go to the trouble of setting up the environment. 

In this way, the only thing you need to install is docker itself (instructions for Mac, Windows and linux
can be found [here](https://docs.docker.com/get-docker/))


### Single container

Run the following command, from inside `ManagementAndAnalysisOfPhysicsDatasetsB` directory, to create a container with dask, jupyter and others packages already installed.
The first time you run it may take a while because it needs to download all the necessary components and libraries.

**Due to the large amount of data that have to be download, please do it before the lectures**


However, the next times you will need this container it will be created instantly since all the components are cached.

```
docker run --rm -it \
        -p 8888:8888 \
        -p 8787:8787 \
        -v $PWD:/opt/workspace \
        sircamp/mapd:parallel
```

Once it has been created,  you will see some logs from the jupyter server. At this point you can connect to jupyter from 
your browser typing `localhost:8888`. Make sure that other jupyter are not using this port. 

### Docker cluster

We can simulate multiple nodes by using multiple docker containers: 
+ A container hosting jupyter server and acting as the client
+ A container hosting the dask-scheduler (aka the master node)
+ A/multiple container/s hosting the dask-worker nodes that will connect to the scheduler. 
  
As for the Spark part, this setup is simulating what you experience on a real cluster. 

This cluster can be spawned with 

```
docker compose up --scale dask-worker-custom=0 --scale dask-worker-gpu-big=0
```

By default only one worker is created. If you want to use N workers you can scale the cluster with

```
docker compose up --scale dask-worker=N
```
*Please pay attention when you want to scale up the workers number, each worker is designed to have 1 core - 1 thread -1Gb of RAM.
Do not exceed your machine resources* 

*Please note that for some of you that use older version of docker have to install the docker compose ([here you can find how](https://docs.docker.com/compose/install/)), and the command should be replaced by ```docker-compose```*


If you want to add "on the fly" new nodes with particular resource to the cluster (on a different CMD):
```
sudo docker-compose run  -e DASK_WORKER_RESOURCES=3 -e DASK_WORKER_RESOURCES_NAME=GPU dask-worker-custom
```
or
```
sudo docker-compose run  dask-worker-gpu-big
```
## Virtual Machine Users

If you prefer to use you VM in VirtualBox or your own machine before the lectures please install the following packages:
+ The graphviz package via apt-get: `sudo apt-get install graphviz`.
+ The following python packages:
```bash
pip3 install  pandas \
   numpy \
   "dask[complete]" \
   "dask[array]"    \
   "dask[dataframe]"  \
   "dask[diagnostics]"  \
   "dask[distributed]"  \
   dask-ml \
   scikit-learn \
   numba \
   notebook \
   jupyterlab \
   matplotlib \
   Pillow \
   seaborn \
   graphviz \
   xgboost \
   joblib \
   pyarrow \
   tensorflow==2.4.1 \
   keras \
   torch \
   scikeras==0.3.3 \
   jupyter-server-proxy \
```

+ Check if all is running by typing ```dask-scheduler --help``` in your command line.


## Lectures

### Lecture 1

+ Introduction on what is Dask
+ Parallel computing base
+ ~~Distributed computing base~~
+ Examples
+ Exercises

### Lecture 2

+ Distributed computing base
+ Dask Examples
+ Distributed ML  
+ Exercises discussion

### Lecture 3

+ Lecture 2 remaining
+ Dask Bag
+ Dask dataframe  
+ Map Reduce Concepts
+ Exercises
