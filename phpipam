node('Ansible'){
    def dir = fileExists 'check'
    if(dir) {
    stage('Create Instance'){
    sh './instance.sh'
        }
    } else {
	stage('Create Role and Instance'){
    sh './role_instance.sh'
        }
    }
}
