# operator-sdk

Run the [Kubernetes Operator SDK](https://github.com/operator-framework/operator-sdk) using Docker. This is especially 
useful in environments where installing the binaries is not an option (e.g. in CI/CD pipelines). The `latest` version of
this image will be the latest release of the *Operator SDK*.

## Usage

Before you start, you must have a Docker daemon running on the host machine. You can check this by using the command 
`docker version`. In order to build a custom operator using the `operator-sdk` binary, use the following command:

```bash
docker run --rm -v ${PWD}:/source -v /var/run/docker.sock:/var/run/docker.sock --privileged boonen/operator-sdk:latest build operator-image:operator-version
```

This command will mount the current working directory in `/source` and build the operator based on the source code in the
working directory. 
