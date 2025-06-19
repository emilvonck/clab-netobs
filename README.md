# clab-netobs

## A project demonstraing enrichin telegraf metrics via a graphql data source (netbox in this case) using a processor plugin.
To get this working you must build the required docker images first
```bash
vrnetlab/cisco_iol:17.15.01
telegraf:graphql -> https://github.com/emilvonck/telegraf/tree/graphql
```

## Once you have the required docker images, deploy the demo
```bash
make
```

## There will be a pre-provisioned dashboard showcasing the below

![Dashboard](./images/dashboard.png)



## To clean up
```bash
make destroy
```