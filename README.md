# README.md

This repo is a collection of custom go-zero templates

## How to

1. Initialize the goctl template
```
goctl template init
```

2. The template can be found in `~/.goctl/GOCTL_VERSION/`, where `GOCTL_VERSION` can be found by
```
goctl --version
```
3. Replace files respectively. DO NOT copy folder 
```
# e.g. to replace tpl in api
cp api/* ~/.goctl/GOCTL_VERSION/api
```