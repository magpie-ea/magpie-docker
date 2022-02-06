#! /bin/env bash
rm -rf app
git clone --depth=1 --branch docker https://github.com/magpie-ea/magpie-backend "./app"
