This is a python code which exposes port 3333 with a 
simple "hello world message".

There are two files:
1. DockerFile (which build the docker image)
2. hello_world.py (python code with hello world message)

A Kubernetes Folder that containes 2 files:
1. lbalancer.yaml (this is the k8s deployment file which will load the docker image in minikube)
2. a service file which load balances traffic and exposes port 3333 into k8s cluster

How to run:

Step 1 - test python code:

in your terminal make sure you have python3 installed and
go into the same dir where you downloaded the .py code and run
**python3 hello_world.py**
you should see a message 'Running on http://x.x.x.x:3333 (Press CTRL+C to quit)
open your browser and type in localhost:3333 and press Enter this should show you the Hello world message

Step 2. 
Run:
 - minikube start
 - minikube docker-env
 - eval $(minikube docker-env)
 - minikube tunel

cd into Kube folder

To create a docker Image do:

type **docker build -f Dockerfile -t helloworld:1 .** 

You can run **docker run -it helloworld:1 sh** if you want to see inside the docker image you built

Then finally run
**kubectl apply -f .**

which should build two pods with same docker image and a service loadbalancer exposing port 3333

Then run

**kubectl get svc** this will show you the external IP address of your cluster, which you can then 
use to access the application.

Copy the External IP onto a browser like so: **externalIP:3333**

You can also try  run:
1. kubectl get pods
2. kubectl describe pod xxpodnamexx


And to delete it all
Just type:

**kubectl delete -f .**

End.