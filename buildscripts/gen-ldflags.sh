#!/bin/sh

version=$(date -u +%FT%H:%M:%SZ)
releaseTag="${MINIO_RELEASE:-DEVELOPMENT}.$(echo $version | tr ' :' '--' | tr -d ',')"
commit=$(git log --format=%H -n1)
shortCommit=$(echo $commit | cut -c -12)

echo "-s -w \
-X github.com/minio/minio/cmd.Version=${version} \
-X github.com/minio/minio/cmd.ReleaseTag=${releaseTag} \
-X github.com/minio/minio/cmd.CommitID=${commit} \
-X github.com/minio/minio/cmd.ShortCommitID=${shortCommit} \
-X github.com/minio/minio/cmd.GOPATH=$GOPATH \
-X github.com/minio/minio/cmd.GOROOT=$GOROOT"
