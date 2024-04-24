
pipeline {
    agent any
    
    options {
        skipDefaultCheckout()
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

                            OS -> [ "${OS} Build & Push": {
                                stage("${OS} Build & Push") {

                                    stage("${OS} Build") {
                                        sh "make ${OS}"
                                    }

                                    stage("${OS} Push") {
                                        echo "Pushing ${OS}"
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

