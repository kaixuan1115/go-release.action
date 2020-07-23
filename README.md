# Go Release Binary GitHub Action

Automate publishing Go build artifacts for GitHub releases through GitHub Actions

This action is a fork of `ngs/go-release.action` with the following updates:  

- use go modules if a `go.mod` file exists
- go build with symbol and dwarf tables omitted via `ldflags`
- repack executable with `upx` resulting in a reduced binary size
- compress windows release binary using `zip`

```yaml
# .github/workflows/release.yaml

on:
  release:
    types: [published]
name: Build
jobs:
  release-linux-386:
    name: release linux/386
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: "386"
        GOOS: linux
        CGO_ENABLED: 0
  release-linux-amd64:
    name: release linux/amd64
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: amd64
        GOOS: linux
        CGO_ENABLED: 0
  release-darwin-386:
    name: release darwin/386
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: "386"
        GOOS: darwin
        CGO_ENABLED: 0
  release-darwin-amd64:
    name: release darwin/amd64
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: amd64
        GOOS: darwin
        CGO_ENABLED: 0
  release-windows-386:
    name: release windows/386
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: "386"
        GOOS: windows
  release-windows-amd64:
    name: release windows/amd64
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: compile and release
      uses: kaixuan1115/go-release.action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GOARCH: amd64
        GOOS: windows
```

