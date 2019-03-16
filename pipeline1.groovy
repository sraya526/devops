node {
  stage('Target-ID') {
  sh ('aws elbv2 describe-target-groups --region ap-south-1 --load-balancer-arn arn:aws:elasticloadbalancing:ap-south-1:724016494080:loadbalancer/app/Flipgo-ALB/7b2381190f854f37')
  }
  stage('TG') {
  sh '/var/lib/jenkins/TG.sh'
  }
  stage('IP') {
  sh 'cd /var/lib/jenkins/ ; chown jenkins ip.sh ; chmod 700 ip.sh ; /var/lib/jenkins/ip.sh'      
  }
}
