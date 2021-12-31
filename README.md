# phpPgAdmin for Cloudrun & CloudSQL

## phpPgAdmin

> phpPgAdmin is a free software tool written in PHP, intended to handle the administration of PostgreSQL databases over the Web. phpPgAdmin supports a wide range of operations on PostgreSQL.

[Overview of phpPgAdmin](https://github.com/phppgadmin/phppgadmin)

### Arch

```
Apache < - > phpPgAdmin <- TCP -> CloudSQLProxy < - > CloudSQL
```


## Configuration

### Environment variables

- `PORT` HTTP Port (Cloudrun set PORT)
- `DB_DESC` Description
- `INSTANCE_CONNECTION_NAME` CloudSQL Instance connection name eg) <ProjectId>:<Region>:<DBName>
- `GOOGLE_APPLICATION_CREDENTIALS` for local test use

## Install

### Install gcloud cli

TBD

### Build Container & push container repository
```shell
gcloud config set project <ProjectId>
gcloud auth configure-docker
docker build . -t gcr.io/<ProjectId>/phppgadmin:local --platform linux/x86_64
docker -- push gcr.io/<ProjectId>/phppgadmin:local
```
### Install Cloudrun
TBD

