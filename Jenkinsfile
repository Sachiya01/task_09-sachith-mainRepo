pipeline {
    agent any

    environment {
        AWS_REGION      = "us-east-1"         
        PROD_CLUSTER_NAME    = "task_09-sachith-prod-ecs-cluster"  
        DEV_CLUSTER_NAME    = "task_09-sachith-dev-ecs-cluster"  
        PROD_SERVICE_NAME    = "task_09-sachith-prod_service"     
        DEV_SERVICE_NAME    = "task_09-sachith-dev_service"     
        DEV_TASK_DEF_NAME   = "dev_task" 
        PROD_TASK_DEF_NAME  = "prod_task"        
        ECR_REPO        = "041360578609.dkr.ecr.us-east-1.amazonaws.com/sachith_test" 
        IMAGE_TAG       = "build-${env.BUILD_NUMBER}"

    }
    

    stages {

        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh '''
                    cd Application/App
                    docker build -t ${ECR_REPO}:${IMAGE_TAG} .
                    '''
                }
            }
        }

        stage('Authenticate to  ECR') {
            steps {
                script {
                    echo "Logging in to ECR..."
                    sh '''
                        aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
                    '''
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    echo "Pushing Docker image to ECR.."
                    sh "docker push ${ECR_REPO}:${IMAGE_TAG}"
                }
            }
        }
        stage('Update ECS Task Definition') {
            steps {
            script {
                        if (env.BRANCH_NAME == "dev"){
                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."

                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."
                                echo "Updating the developement task definition..."
                                sh '''
                                    # Fetch current task definition
                                    aws ecs describe-task-definition \
                                        --task-definition $DEV_TASK_DEF_NAME \
                                        --query 'taskDefinition' \
                                        > taskdef.json

                                    # Remove read-only fields
                                    jq 'del(
                                        .taskDefinitionArn,
                                        .revision,
                                        .status,
                                        .requiresAttributes,
                                        .compatibilities,
                                        .registeredAt,
                                        .registeredBy
                                    )' taskdef.json > taskdef-stripped.json

                                    # Update container image
                                    jq --arg IMAGE "$ECR_REPO:$IMAGE_TAG" \
                                        '.containerDefinitions[0].image = $IMAGE' \
                                        taskdef-stripped.json \
                                        > new-taskdef.json

                                    # Register the cleaned-up task definition
                                    aws ecs register-task-definition \
                                        --cli-input-json file://new-taskdef.json \
                                        > new-taskdef-output.json

                                    NEW_REV=$(jq -r '.taskDefinition.taskDefinitionArn' new-taskdef-output.json)
                                    echo "New task definition ARN: $NEW_REV"
                                '''
                        }


                        if (env.BRANCH_NAME == "main") {
                            echo "Updating the PROD task definition..."
                            sh '''
                                # Fetch current task definition
                                aws ecs describe-task-definition \
                                    --task-definition $PROD_TASK_DEF_NAME \
                                    --query 'taskDefinition' \
                                    > taskdef.json

                                # Remove read-only fields
                                jq 'del(
                                    .taskDefinitionArn,
                                    .revision,
                                    .status,
                                    .requiresAttributes,
                                    .compatibilities,
                                    .registeredAt,
                                    .registeredBy
                                )' taskdef.json > taskdef-stripped.json

                                # Update container image
                                jq --arg IMAGE "$ECR_REPO:$IMAGE_TAG" \
                                    '.containerDefinitions[0].image = $IMAGE' \
                                    taskdef-stripped.json \
                                    > new-taskdef.json

                                # Register the cleaned-up task definition
                                aws ecs register-task-definition \
                                    --cli-input-json file://new-taskdef.json \
                                    > new-taskdef-output.json

                                NEW_REV=$(jq -r '.taskDefinition.taskDefinitionArn' new-taskdef-output.json)
                                echo "New task definition ARN: $NEW_REV"
                                    '''
                        }

                    }
            }
        }

        stage('Deploy to ECS Service') {
            steps {
                script {

                    if (env.BRANCH_NAME == "dev") {
                        echo "Updating DEV ECS service with new task definition..."
                    sh '''
                        NEW_REV=$(jq -r '.taskDefinition.taskDefinitionArn' new-taskdef-output.json)
                        aws ecs update-service \
                            --cluster $DEV_CLUSTER_NAME \
                            --service $DEV_SERVICE_NAME \
                            --task-definition $NEW_REV \
                            --force-new-deployment
                    '''
                    }
                    if (env.BRANCH_NAME == "main") {
                        echo "Updating PROD ECS service with new task definition..."
                    sh '''
                        NEW_REV=$(jq -r '.taskDefinition.taskDefinitionArn' new-taskdef-output.json)
                        aws ecs update-service \
                            --cluster $PROD_CLUSTER_NAME \
                            --service $PROD_SERVICE_NAME \
                            --task-definition $NEW_REV \
                            --force-new-deployment
                    '''
                    }
                }
            }
        }

    }   

    post {
        success {
            echo "Deployment Successful"
        }
        failure {
            echo "Deployment Failed!"
        }
        always {
            echo "Cleaning workspace leftovers..."
            sh '''
                docker system prune -af || true
            '''
            cleanWs()
        }   
    }
}
