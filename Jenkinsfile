node {
    def jdkTool = "jdk11"
    def mavenTool = "maven"
    def repoUrl = "https://github.com/ssvkotamraju/E-ticketing.git"

    try {
        stage('Prepare') {
            echo "Checking out ${repoUrl}"
            checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                      userRemoteConfigs: [[url: repoUrl]]])

            try { env.JAVA_HOME = tool jdkTool; env.PATH = "${env.JAVA_HOME}/bin:${env.PATH}" } catch(err) { echo "JDK tool not found" }
            try { def mvnHome = tool mavenTool; env.MAVEN_HOME = mvnHome; env.PATH = "${mvnHome}/bin:${env.PATH}" } catch(err) { echo "Maven tool not found" }
        }

        stage('Build') {
            sh 'mvn -B clean package -DskipTests=true'
            archiveArtifacts artifacts: '**/target/*.jar, **/target/*.war', allowEmptyArchive: true
        }

        stage('Test') {
            sh 'mvn test'
            junit '*/target/surefire-reports/*.xml'
        }

        stage('Docker Build (optional)') {
            if (fileExists('Dockerfile')) {
                try { def img = docker.build("e-ticket:${env.BUILD_NUMBER}"); echo "Docker image built" } catch (err) { echo "Docker not available: ${err}" }
            } else { echo "No Dockerfile found — skipping" }
        }

    } catch (err) {
        currentBuild.result = 'FAILURE'
        throw err
    } finally {
        stage('Cleanup') { echo "Build finished" }
    }
}
