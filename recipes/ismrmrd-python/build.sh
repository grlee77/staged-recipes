#!/bin/bash

python setup.py install --single-version-externally-managed --record record.txt

cd ${SRC_DIR}/tests
nosetests *.py
