# ci-images

CI related building environments for private use of gitlab


# 在gitlab中为项目设置如下缺省的CI变量

- CI_DOCKER_UPLOAD_REPO_NAME upload.docker.nexus.irhawks.com
- CI_DOCKER_UPLOAD_USER docker
- CI_DOCKER_UPLOAD_PASS docker

# 在gitlab中为项目再设置如下的CI变量

- CI_MAVEN_REMOTE_NAME: http://nexus.irhawks.com/repository/maven-public/
- CI_MAVEN_RELEASES_NAME: http://nexus.irhawks.com/repository/maven-releases/
- CI_MAVEN_RELEASES_USER: maven
- CI_MAVEN_RELEASES_PASS: maven
