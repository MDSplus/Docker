
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

                checkout scm;

                cleanWs disableDeferredWipeout: true, deleteDirs: true
            }
        }

        stage('Builders') {
            steps {
                script {
                    dir("builder") {
                        
                        def OSList = [];
                        findFiles(glob: "*/Dockerfile").each {
                            file -> OSList.add(file.path.split('/')[-2]);
                        }

                        parallel OSList.collectEntries {

                            OS -> [ "${OS} Build & Push": {
                                stage("${OS} Build & Push") {

                                    dir("${OS}") {
                                        docker.withRegistry('https://hub.docker.com/', 'dockerhub') {
                                            docker.build("mdsplus/builder:${OS}", '--no-cache').push();
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

