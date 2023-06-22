# Overview

Hello there, I am Long(Bobby), this is project building a CI/CD Pipeline for 'DevOps Engineer for Microsoft Azure' program from Udacity.

This project consists of flask application that is developed to predict housing prices in Boston (the model is already created by the instructor). 

This repositry demonstrate:
- Deploying the app in Azure CloudShell
- Deploying the app as a web server using Azure App Service.

Once anything has been changed (commits) in the github repositry, it will trigger an action for test automation (CI). A pipeline has been created using Azure DevOps tool, and also any changes will be tested in the pipeline and deployed to app service. All these steps are explianed well in the demo below. 
 

## Project Plan

A [Trello](https://trello.com/b/8fbVJFdr/udacity-devops-azure-project2) board has been created to keep track of the tasks.

A [spreadsheet](project-schedule-h.xlsx) has been created to manage the project schedule.

## Instructions

Here is an architectural diagram:
![arch diagram](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/architechture-diagram.png)

## Deploy the app in Azure Cloud Shell

In Azure Cloud Shell, clone the repo:
```
git clone git@github.com:bobbynguyen147/udacity-azure-devops-project2.git
```
![screenshot-gitClone-AzureCloud](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/git-clone.png)

Create a virtual environment:
```
python -m venv ~/.AzureDevops
```

Activate the virtual environment:
```
source ~/.AzureDevops/bin/activate
```

Change into the new directory:
```
cd udacity-azure-devops-project2
```

Install dependencies in the virtual environment and run tests:
```
make all
```
![make-all](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/make-all1.png)
![make-all2](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/make-all2.png)

A successful GitHub build test 
![screenshot-build-success-actiongithub](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/ci.png)

## Deploy the app to an Azure App Service

Create an App Service in Azure. In this example the App Service is cicd-nanodegree-haneen and the resource group is flask-app, you can either create it using Azure cloudShell or the portal itself.
In the Azure cloudShell type:

```
az webapp up --name bobbynguyen-pythonapp1 --sku FREE --location eastus --runtime "PYTHON|3.9" --resource-group Azuredevops
```

Next, create the pipeline in Azure DevOps. More information on this process can be found [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops&WT.mc_id=udacity_learn-wwl). The basic steps to set up the pipeline are:

- Go to [https://dev.azure.com](https://dev.azure.com) and sign in.
- Create a new private project.
-Create a new service connection to Azure Resource Manager, select subscription and the app service.
- Create a new pipeline linked to your GitHub repo using GiThub YAML File.

Screenshot of the App Service in Azure:

![screenshot-webapp-service](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/webapp.png)

Screenshot of config devops pipeline agent:
![screenshot-azure-pipeline-agent-pool](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/agent-pool.png)
![screenshot-azure-pipeline-agent-config](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/agent-config.png)

Screenshot of a successful deployment of the project in Azure Pipelines:

![screenshot-azure-pipeline-deployment](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/cd.png)

To test the app running in Azure App Service, edit line 28 of the make_predict_azure_app.sh script with the DNS name of your app. Then run the script:
```
./make_predict_azure_app.sh 
```

If it's working you should see the following output:

![screenshot-prediction](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/predict.png)

You can also visit the URL of the App Service via the browser and you should see the following page:

![screenshot-browser](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/app-url.png)

> 

## Enhancements
Improving the model performance.

## Load testing

We can use locust to do a load test against our application locally. 

Install locust:
```
pip install locust
```
Ensure the app is running:
```
python app.py
```

Start locust:
```
locust
```
Open a browser and go to [http://localhost:8089](http://localhost:8089). Enter the total number of users to simulate, spawn rate, set the host to your <app-service>, and click Start Swarming:

![screenshot-loadtest](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/locust-config.png)

You can then watch the load test:

![screenshot-locust](https://raw.githubusercontent.com/bobbynguyen147/udacity-azure-devops-project2/main/Screenshot/locust.png)

## Demo 
Youtube video demo
https://youtu.be/zOpJrOEBC4c



