#!/usr/bin/env bash
set -o xtrace
INPUT_DIR=../../
ENDPOINT="<endpoint>.<region>.amazonaws.com"
ROOT_CA_FILE=$INPUT_DIR/input/certs/root-CA.crt
CERT_FILE=$INPUT_DIR/out/certs/dxc-labs-mac1/<thing-name>-certificate.crt
PRIVATE_KEY_FILE=$INPUT_DIR/out/certs/<thing name>/<thing name>-private.pem.key
CLIENT_ID=mac1
TOPIC=<thing-name>/create
MESSAGE='HelloWorld'
MODE="[publish]"
THING="<thing name>"
PYTHON=python3

$PYTHON basicShadowUpdater.py --endpoint $ENDPOINT --rootCA $ROOT_CA_FILE --cert $CERT_FILE --key $PRIVATE_KEY_FILE --clientId $CLIENT_ID --thingName $THING

exit

$PYTHON basicShadowDeltaListener.py --endpoint $ENDPOINT --rootCA $ROOT_CA_FILE --cert $CERT_FILE --key $PRIVATE_KEY_FILE --clientId $CLIENT_ID --thingName $THING


$PYTHON basicPubSubAsync.py --endpoint $ENDPOINT --rootCA $ROOT_CA_FILE --cert $CERT_FILE --key $PRIVATE_KEY_FILE --clientId $CLIENT_ID --topic $TOPIC

$PYTHON3 basicPubSub.py --endpoint $ENDPOINT --rootCA $ROOT_CA_FILE --cert $CERT_FILE --key $PRIVATE_KEY_FILE --clientId $CLIENT_ID --topic $TOPIC --message $MESSAGE -- mode $MODE
