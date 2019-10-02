# Set the build task in place

$ACR_NAME = Read-Host "Enter the name of your acr registry"
$GIT_PAT = Read-Host "Enter the value of your github token"

az acr task create `
    --registry $ACR_NAME `
    --name taskBlazorClient `
    --image blazorclient:{{.Run.ID}} `
    --context https://github.com/Hartdrooz/blazordemo.git `
    --file Dockerfile `
    --git-access-token $GIT_PAT