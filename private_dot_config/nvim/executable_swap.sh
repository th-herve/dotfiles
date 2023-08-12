#!/usr/bin/env bash


if ls | grep -q "^init.lua"; then
    mv init.lua vinit.lua
    mv vinit.vim init.vim
else
    mv vinit.lua init.lua
    mv init.vim vinit.vim
fi
