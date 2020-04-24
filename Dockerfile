FROM docker:stable
MAINTAINER Jan Boonen <jan.boonen@geodan.nl>

ARG VERSION
ENV OS "linux"
ENV BIT "64"

RUN apk add --no-cache curl
   
RUN VERSION=${VERSION:-latest} && \
    if [ $VERSION = 'latest' ]; then \
      echo "Downloading latest version of Operator SDK from Github..." && \
      curl -sL https://api.github.com/repos/operator-framework/operator-sdk/releases |\
        grep browser_download |\
        grep ${OS} |\
        cut -d '"' -f 4 |\
        grep operator-sdk |\
        grep x86_${BIT}-${OS} |\
        grep -v .asc |\
        head -n 1 |\
        xargs curl -sOL; \
   else \
      echo "Downloading version $VERSION of Operator SDK from Github..." && \
      curl -sOL "https://github.com/operator-framework/operator-sdk/releases/download/v${VERSION}/operator-sdk-v${VERSION}-x86_${BIT}-${OS}-gnu"; \
   fi && \
   cp ./operator-sdk-* /usr/local/bin/operator-sdk && rm -f ./operator-sdk* && \
   chmod a+x /usr/local/bin/operator-sdk && \
   mkdir -p /source

WORKDIR /source
CMD ["--help"]
ENTRYPOINT ["/usr/local/bin/operator-sdk"]
