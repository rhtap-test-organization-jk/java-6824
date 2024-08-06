# from init
export REBUILD=true
export SKIP_CHECKS=true

# from buildah-rhtap
TAG=$(git rev-parse HEAD)
export IMAGE_URL=quay.io/rhtap-test-organization-jk/rhtap-qe:jenkins-$TAG
export IMAGE=$IMAGE_URL
export RESULT_PATH=$DIR/results/temp/files/sbom-url

export DOCKERFILE=src/main/docker/Dockerfile.jvm.staged
export CONTEXT=.
export TLSVERIFY=false
export BUILD_ARGS=""
export BUILD_ARGS_FILE=""

# from ACS_*.*
export DISABLE_ACS=false
# Optionally set ROX_CENTRAL_ENDPOINT here instead of configuring a Jenkins secret
# export ROX_CENTRAL_ENDPOINT=central-acs.apps.user.cluster.domain.com:443
export INSECURE_SKIP_TLS_VERIFY=true
export GITOPS_REPO_URL=https://github.com/rhtap-test-organization-jk/java-6824-gitops

export PARAM_IMAGE=$IMAGE
export PARAM_IMAGE_DIGEST=$(cat "$BASE_RESULTS/buildah-rhtap/IMAGE_DIGEST" 2>/dev/null || echo "latest")

# From Summary
export SOURCE_BUILD_RESULT_FILE=

# gather images params

export TARGET_BRANCH=""
# enterprise contract
export POLICY_CONFIGURATION="github.com/enterprise-contract/config//rhtap-jenkins"
#internal, assumes jenkins is local openshift
export REKOR_HOST=http://rekor-server.rhtap.svc
export IGNORE_REKOR=false
export INFO=true
export STRICT=true
export EFFECTIVE_TIME=now
export HOMEDIR=$(pwd)
export TUF_MIRROR=http://tuf.rhtap.svc
