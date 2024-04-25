
pipeline {
    agent any
    
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    triggers {
        // Every Sunday
        cron("H 0 * * 0")
    }

    stages {

        stage('Setup') {
            steps {
                sh 'printenv'

                // Allow docker to run multiple architectures
                sh 'docker run --rm --privileged multiarch/qemu-user-static:register --reset'

                cleanWs disableDeferredWipeout: true, deleteDirs: true
            }
        }

        stage('Builders') {
            steps {
                checkout scm;

                script {
                    dir("builder") {
                        
                        def OSList = [];
                        findFiles(glob: "*/Dockerfile").each {
                            file -> OSList.add(file.path.split('/')[-2]);
                        }

                        parallel OSList.collectEntries {

                            OS -> [ "${OS}": {
                                stage("${OS}") {

                                    dir("${OS}") {
                                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                                            docker.build("mdsplus/builder:${OS}", '--no-cache .').push();
                                        }
                                    }
                                    
                                }
                            }]

                        }
                    }
                }
            }
        }
    }
}

