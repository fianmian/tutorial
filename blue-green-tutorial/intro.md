## Blue-Green Deployment
Blue-Green deployment is a software deployment method used for safely deploying a new version of an app. In this method we have two servers: the "blue" server and the "green" server. The blue server is the old version and the green server is the new version. We make changes to the green server. We then redirect requests from the blue server to the green server. If there would be any problems, we can easily rollback to the blue server. 

## Smoke tests
Smoke tests are types of software tests that are fairly easy to test that there are not any major failures. These tests test the most important functionalities of the system to make sure it is ready for release. This can be paired with the Blue-Green deployment strategy in doing a smoke test of the green version to see if we can reroute request from the blue server to the green one. 

## Tutorial step by step
1. Deploy blue version
2. Deploy green version
3. Smoke test of green version
4. Switch traffic from blue version to green version
5. Rollback to blue version
6. Make an automated pipeline of the previous steps

## Intended Learning Outcomes (ILO)
By the end of this tutorial, you will:
- understand and implement Blue-Green deployment in Kubernetes.
- implement smoke testing of the green deployment.
- implement rollback logic.
- simulate a CD pipeline including deployment, testing, traffic switching and rollback.