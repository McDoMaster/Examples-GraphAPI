# Step 1 : Install modules

Install-module "Microsoft.graph" -scope currentUser

# Step 2 : Import Authentication Module

import-module "microsoft.graph.authentication"
import-module "microsoft.graph.users"

# Step 3 : Get credentials and login

$private:ClientID = "CLIENT ID"
$private:TenantID = "TENANT ID"
$private:Secret = "SECRET"

$body = @{
    Grant_Type = "client_credentials"
    Scope = "https://graph.microsoft.com/.default"
    Client_ID = $private:ClientID
    Client_Secret = $private:Secret
}

$conn = invoke-restmethod -uri "https://login.microsoftonline.com/$private:TenantID/oauth2/v2.0/token" -Method POST -body $body

connect-mggraph -accessToken $conn.access_token
