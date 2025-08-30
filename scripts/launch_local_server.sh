#!/bin/bash
set -ex

WIKI2018_WORK_DIR=/path/to/wiki2018

index_file=$WIKI2018_WORK_DIR/e5.index/e5_Flat.index
corpus_file=$WIKI2018_WORK_DIR/wiki_corpus.jsonl
pages_file=$WIKI2018_WORK_DIR/wiki_webpages.jsonl
retriever_name=e5
retriever_path=intfloat__e5-base-v2

python3  tools/local_retrieval_server.py --index_path $index_file \
                                            --corpus_path $corpus_file \
                                            --pages_path $pages_file \
                                            --topk 3 \
                                            --retriever_name $retriever_name \
                                            --retriever_model $retriever_path \
                                            --faiss_gpu --port $1 \
                                            --save-address-to $2