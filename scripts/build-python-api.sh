#!/usr/bin/env bash

#----
#
#  Run using command line: $build-python-api.sh
#
#----

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

set -e

export PYTHON_API_BUILD_TEMP='/tmp/python-api/build/'
export MCAPI_BASE="${HOME}/workspace/src/github.com/materials-commons/mcapi/python"
export DOC_BASE="${HOME}/workspace/src/github.com/materials-commons/materials-commons.github.io"

# Create a temp directory.
mkdir -p $PYTHON_API_BUILD_TEMP

# Clear previous build, if necessary
rm -rf $PYTHON_API_BUILD_TEMP/*

# Copy the source tree into it.
cp -R $MCAPI_BASE/* $PYTHON_API_BUILD_TEMP

# Copy the configuration and layout files into it:
#	Makefile config.py, index.rst, deom_project.rst, and mcapi.rst
pushd $DOC_BASE/python-doc-conf
cp * $PYTHON_API_BUILD_TEMP
popd

# Run make html and convert the dirs, html, and js
#	with: _static -> source_static, _modules -> source_modules, _sources -> source_sources
pushd $PYTHON_API_BUILD_TEMP
make html
pushd ./_build/html
mv _static site-static
mv _modules site-modules
mv _sources site-sources
find . -name "*.html" -exec sed -i -- 's/_static/site-static/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_static/site-static/g' \{\} \;
find . -name "*.html" -exec sed -i -- 's/_modules/site-modules/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_modules/site-modules/g' \{\} \;
find . -name "*.html" -exec sed -i -- 's/_sources/site-sources/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_sources/site-sources/g' \{\} \;
find . -name "*.html--" -exec rm \{\} \;
find . -name "*.js--" -exec rm \{\} \;
popd
popd

# back up current version
# clear current version
# set current version to new version
cp -R $PYTHON_API_BUILD_TEMP/_build/html $DOC_BASE/python-api/sphinx/

echo "Copied html site from _build/html to $DOC_BASE/python-api/sphinx/"


