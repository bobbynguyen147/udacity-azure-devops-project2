git clone git@github.com:bobbynguyen147/udacity-azure-devops-project2.git
cd udacity-azure-devops-project2
git pull
make all
az webapp up --name bobbynguyen-pythonapp1 --sku FREE --location eastus --runtime "PYTHON|3.9" --resource-group Azuredevops