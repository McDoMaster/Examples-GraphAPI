# Import Module
import-module "microsoft.graph.users"

# Get All Users
$users = Get-MGUser -all 

$users | select-object DisplayName,UserPrincipalName,Id

# Get All atributes
$users | get-member