# llama-index-docker

## Overview

In-context learningによって事前に与えた情報にもとづくchatbotのUXを検証する


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

## 環境変数の設定
- BEARER_TOKEN
  - [jwt.io](https://jwt.io/)のEncodedで表示されるtokenを使用
- OPENAI_API_KEY
  - OpenAI APIのtokenを使用
- DATASTORE, QDRANT_URL
  - 特に変更しない


## 入れた
- LLMの選択
  - llm_name: {"chatgpt", "gpt3"}
- ベクトル検索の選択
  - vector_search_method: {"simple", "faiss", "qdrant"}
- ベクトル埋め込みのモデル選択
  - embed_model_name: {"default", "oshizo/sbert-jsnli-luke-japanese-base-lite"}
  - defaultを選択するとtext-embedding-ada-002が設定される
  - huggingfaceのモデルは後でGPU環境で検証
- chatgpt-retrieval-pluginの変更箇所
  - chatgpt-retrieval-plugin.dockerfileを追加
  - uvicornのport番号を変更(8000->7000)
- llamaindexのChatGPTRetrievalPluginIndexがなぜか使えなかったので自前で用意(llamaindexで対応されたら消す)


## TODO
- 実際のデータソースをindex化してchatbotのUXを検証
  - wiki, notion, PDF, Twitter、Slack
- ChatGPTRetrievalPluginIndexをスクリプトに切り分ける
- UI作る

## Reference
- [ChatGPT Retrieval Plugin を試す](https://note.com/npaka/n/n238d33db593e)
- [ChatGPT Retrieval Pluginに任意のベクトル検索エンジンProviderを実装する](https://www.m3tech.blog/entry/chatgpt-retrieval-plugin-vector-search)
- [Llamaindex を用いた社内文書の ChatGPT QA ツールをチューニングする](https://recruit.gmo.jp/engineer/jisedai/blog/llamaindex-chatgpt-tuning/)
- [LlamaIndex クイックスタートガイド - v0.6.0](https://note.com/npaka/n/n50475d6c3118)
- [ChatGPTに自社データを組み込んで新しい検索体験を模索してみました](https://note.com/masa_kazama/n/n246df4af19f6)
- [GPT Index でのHuggingFaceの埋め込みモデルの利用](https://note.com/npaka/n/nee11eb7e620e)
- [GPT Index のインデックスの種類](https://note.com/npaka/n/n5d4ff4380055)


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
