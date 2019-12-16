pipeline {
   agent {
       docker {
           image "donatolucas96/python-robot"
           args "--network=skynet"
       }
   }

   stages {
      stage("Build") {
          steps {
              sh "pip install -r requirements.txt"
          }
      }
      stage("Tests") {
         steps {
            sh "robot -d ./results specs"
         }
         post {
            always {
               robot otherFiles: '**/*.png', outputPath: 'results'
            }
         }
      }
   }
}
