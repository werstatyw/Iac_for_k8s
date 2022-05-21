kubectl create ns gitlab-runner
helm upgrade --install --namespace gitlab-runner gitlab-runner gitlab/gitlab-runner --set gitlabUrl=http://gitlab.com,runners.secret=gitlab-runner-secret
