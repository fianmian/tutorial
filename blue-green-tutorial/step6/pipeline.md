Automate the previous with a pipeline. 

Write `cat assets/deploy.sh` to explore a automated pipeline of the previous steps of this tutorial combined. It is given that the blue version is already deployed and used as the server(s) of our service. This pipeline deploys the green version, makes a smoke test, and if test is successful makes our green version endpoint(s) of our service. 

Run `./assets/deploy.sh` to simulate continuous deployment. 