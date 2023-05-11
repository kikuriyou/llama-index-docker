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


# **以降は作業中**

## Cloud Run デプロイのセットアップ

docker image をビルド
```
make build
```

image をデプロイ
```
make deploy
```
