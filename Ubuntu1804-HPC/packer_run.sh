tenant=$(az ad sp show --id http://dvpackersp --query "appOwnerTenantId" -o tsv)
subscription=$(az account show --query id -o tsv)
client_id=$(az ad sp show --id http://dvpackersp --query "appId" -o tsv)
secret=$(az keyvault secret show --name dvpackersp --vault-name images-kv -o tsv --query value)
resource_group='dv-images'
region=$(az group show --name $resource_group -o tsv --query location)
image_definition='ubuntu1804-hpc'
image='ubuntu-hpc'
version='18.04.522200'
gallery='dvgallery'
sku='Standard_HB120rs_v2'

logfile="./packer_$(date +%Y%m%d%H%M%S).log"
printf "\n>>> Saving log in file: %s\n\n" $logfile

export PACKER_LOG=1
export PACKER_LOG_PATH=$logfile

packer build -var "var_tenant_id=$tenant" \
             -var "var_client_id=$client_id" \
             -var "var_client_secret=$secret" \
             -var "var_image=$image" \
             -var "var_img_version=$version" \
             -var "var_subscription_id=$subscription" \
             -var "var_resource_group=$resource_group" \
             -var "var_gallery=$gallery" \
             -var "var_imgver=$version" \
             -var "var_imgdef=$image_definition" \
             -var "var_replication_region=$region" \
             -var "var_build_sku=$sku" \
             ubuntu1804-ofed.json
