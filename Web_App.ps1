login-AzureRmAccount
Set-AzureRmContext -SubscriptionID ef8a6779-72de-4032-a1af-95857bd45091


$appserviceplan = "USWTECASP10"
$webappname="USWTECAPPNON$(Get-Random)"
$location="West US"

# Create a resource group.
New-AzureRmResourceGroup -Name USWTECNONRG10 -Location $location

# Create an App Service plan
New-AzureRmAppServicePlan -Name $appserviceplan -Location $location -ResourceGroupName USWTECNONRG10 -Tier Standard

# Create a web app.
New-AzureRmWebApp -Name $webappname -Location $location -AppServicePlan $appserviceplan -ResourceGroupName USWTECNONRG10


#Create a deployment slot with the name "staging".
New-AzureRmWebAppSlot -Name $webappname -ResourceGroupName  USWTECNONRG10 -Slot staging

# Configure GitHub deployment to the staging slot from your GitHub repo and deploy once.
#$PropertiesObject = @{
#    repoUrl = "$gitrepo";
#    branch = "master";
#}
#Set-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName myResourceGroup `
#-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
#-ResourceName $webappname/staging/web -ApiVersion 2015-08-01 -Force

# Swap the verified/warmed up staging slot into production.
#Switch-AzureRmWebAppSlot -Name $webappname -ResourceGroupName myResourceGroup `
#-SourceSlotName staging -DestinationSlotName production


