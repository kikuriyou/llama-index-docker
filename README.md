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

## 入れた
- LLMの選択
  - llm_name: {"chatgpt", "gpt3"}
- ベクトル検索の選択
  - vector_search_method = {"simple", "faiss", "qdrant"}
- ベクトル埋め込みのモデル選択
  - embed_model_name = {None, "oshizo/sbert-jsnli-luke-japanese-base-lite"}
  - Noneを選択すると
  - huggingfaceのモデルは後でGPU環境で検証
- chatgpt-retrieval-pluginの変更箇所
  - chatgpt-retrieval-plugin.dockerfileを追加
  - uvicornのport番号を変更(8000->7000)
- llamaindexのChatGPTRetrievalPluginIndexがなぜか使えなかったので自前で用意
  - llamaindexで対応されたら消す


## TODO
- 実際のデータソースをindex化してchatbotのUXを検証
  - wiki, notion, PDF, Twitter、Slack
- ChatGPTRetrievalPluginIndexをスクリプトに切り分ける
- UI作る


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
