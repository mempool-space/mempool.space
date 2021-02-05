#!/bin/sh

#MEMPOOL
__MEMPOOL_BACKEND_MAINNET_HTTP_PORT__=${BACKEND_MAINNET_HTTP_PORT:=8999}
__MEMPOOL_BACKEND_MAINNET_CACHE_DIR__=${CACHE_DIR:=./}
# BITCOIN
__BITCOIN_MAINNET_RPC_HOST__=${RPC_HOST:=127.0.0.1}
__BITCOIN_MAINNET_RPC_PORT__=${RPC_PORT:=8332}
__BITCOIN_MAINNET_RPC_USER__=${RPC_USER:=mempool}
__BITCOIN_MAINNET_RPC_PASS__=${RPC_PASS:=mempool}
# ELECTRUM
__ELECTRS_MAINNET_HTTP_HOST__=${ELECTRS_HOST:=127.0.0.1}
__ELECTRS_MAINNET_HTTP_PORT__=${ELECTRS_PORT:=50002}
# MYSQL
__MYSQL_HOST__=${MYSQL_HOST:=127.0.0.1}
__MYSQL_PORT__=${MYSQL_PORT:=3306}
__MYSQL_DATABASE__=${MYSQL_DATABASE:=mempool}
__MYSQL_USERNAME__=${MYSQL_USER:=mempool}
__MYSQL_PASSWORD__=${MYSQL_PASS:=mempool}

mkdir -p "${__MEMPOOL_BACKEND_MAINNET_CACHE_DIR__}"

sed -i "s/__BITCOIN_MAINNET_RPC_HOST__/${__BITCOIN_MAINNET_RPC_HOST__}/g" mempool-config.json
sed -i "s/__BITCOIN_MAINNET_RPC_PORT__/${__BITCOIN_MAINNET_RPC_PORT__}/g" mempool-config.json
sed -i "s/__BITCOIN_MAINNET_RPC_USER__/${__BITCOIN_MAINNET_RPC_USER__}/g" mempool-config.json
sed -i "s/__BITCOIN_MAINNET_RPC_PASS__/${__BITCOIN_MAINNET_RPC_PASS__}/g" mempool-config.json
sed -i "s/__ELECTRS_MAINNET_HTTP_HOST__/${__ELECTRS_MAINNET_HTTP_HOST__}/g" mempool-config.json
sed -i "s/__ELECTRS_MAINNET_HTTP_PORT__/${__ELECTRS_MAINNET_HTTP_PORT__}/g" mempool-config.json
sed -i "s/__MYSQL_HOST__/${__MYSQL_HOST__}/g" mempool-config.json
sed -i "s/__MYSQL_PORT__/${__MYSQL_PORT__}/g" mempool-config.json
sed -i "s/__MYSQL_DATABASE__/${__MYSQL_DATABASE__}/g" mempool-config.json
sed -i "s/__MYSQL_USERNAME__/${__MYSQL_USERNAME__}/g" mempool-config.json
sed -i "s/__MYSQL_PASSWORD__/${__MYSQL_PASSWORD__}/g" mempool-config.json
sed -i "s!__MEMPOOL_BACKEND_MAINNET_CACHE_DIR__!${__MEMPOOL_BACKEND_MAINNET_CACHE_DIR__}!g" mempool-config.json
sed -i "s/__MEMPOOL_BACKEND_MAINNET_HTTP_PORT__/${__MEMPOOL_BACKEND_MAINNET_HTTP_PORT__}/g" mempool-config.json

node /backend/dist/index.js
