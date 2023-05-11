# llama-index-docker

## Overview

LlamaIndexを試す


## ローカルでのセットアップ
```
docker-compose build
docker-compose up
```

上手く行かない場合は以下を試してください
```
docker-compose down
docker-compose build --no-cache
docker-compose up
```


## Cloud Run デプロイのセットアップ

docker image をビルド(フロントエンド・バックエンドとも)
```
make build
```

バックエンドの image をデプロイ(フロントエンドのデプロイに BACKEND_URL が必要なため先にデプロイする)
```
make deploy_fe
```

フロントエンドの image をデプロイ
```
make deploy_be
```
