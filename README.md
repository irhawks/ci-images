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

## 设计思想

在命名上面尽量简单。比如说，在ubuntu上面的肯定是安装ubuntu的组件。所以直接用install_ssh_daemon.sh作为名子就可以了，不用添加ubuntu_install_ssh_daemon.sh这样的命子。如果添加这些名子，又显得太冗余了。

我们的定位是初步的CI-Image而不是生产级别的镜像。如果强行构建生产级别的镜像并且为ubuntu之外的发行版，也会比较痛苦的。所以默认无论是java还是其它的组件，CI的镜像都全部基于ubuntu来构建。虽然安全性等都会降低，但是使用还是会一直更方便一些的。
