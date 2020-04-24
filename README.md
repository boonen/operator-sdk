# operator-sdk
Run the [Kubernetes Operator SDK](https://github.com/operator-framework/operator-sdk) using Docker. This is especially useful in environments where 
installing the binaries is not an option (e.g. in CI/CD pipelines).

## Usage
Build a custom operator using the `operator-sdk` command:

```bash
docker run --rm -v ${PWD}:/source build operator-image:operator-version
```
