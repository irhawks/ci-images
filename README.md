# ci-images

CI related building environments for private use of gitlab


# 在gitlab中为项目设置如下缺省的CI变量

- CI_DOCKER_REGISTRY_REPO_NAME upload.docker.nexus.irhawks.com
- CI_DOCKER_REGISTRY_USER docker
- CI_DOCKER_REGISTRY_PASS docker

# 在gitlab中为项目再设置如下的CI变量

- CI_MAVEN_REPO_URL: http://nexus.irhawks.com/repository/maven-public/
- CI_MAVEN_UPLOAD_URL: http://nexus.irhawks.com/repository/maven-upload/
- CI_MAVEN_UPLOAD_USER: maven
- CI_MAVEN_UPLOAD_PASS: maven
