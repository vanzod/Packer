# Ubuntu 18.04 + Mellanox OFED 5.2-2.2.0.0 For Azure HB/HC VMs

**Notes:**
* Do not use a more recent base image than `18_04-lts-gen2:18.04.2021012901` because of MOFED incompatibilities (see https://github.com/vanzod/Packer/issues/1)
* Before running Packer an image definition must be created in the resource group with:
  ```
  $ az sig image-definition create --resource-group <rg_name> \
                                   --gallery-name <gallery_name> \
                                   --gallery-image-definition <def_name> \
                                   --publisher <pub_name> \
                                   --offer Ubuntu-HPC \
                                   --sku 18.04 \
                                   --os-type Linux \
                                   --hyper-v-generation V2
  ```
