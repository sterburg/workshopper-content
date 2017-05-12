oc new-project workshop

# Generated artifact is located in /wildfly/standalone/deployments/ROOT.war
oc new-build --name=workshop \
   --docker-image=osevg/workshopper:latest \
   --dockerfile=$'FROM osevg/workshopper:latest\nEXPOSE 8080\nCOPY . /content'

oc start-build workshop --from-dir=. --follow

# Deploy and expose the app once built
oc new-app workshop --name=paris-workshop \
           -e WORKSHOPS_URLS='file:///content/_workshops/paris.yml' \
           -e CONTENT_URL_PREFIX='file:///content' 

# Print the endpoint URL
echo "Access the service at http://$(oc get route/paris-workshop -o jsonpath='{.status.ingress[0].host}')/"
echo ""
echo "To rebuild your application again:"
echo ""
echo "     oc start-build workshop --from-dir=. --follow"
