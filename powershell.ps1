# Define new password as a secure string
$NewPassword = ConvertTo-SecureString "123456@123" -AsPlainText -Force

# Path to the file containing usernames (one per line)
$UserListFile = "userlist.txt"

# Check if the file exists
if (-Not (Test-Path $UserListFile)) {
Write-Host "User file not found: $UserListFile"
exit
}

# Read usernames and update password for each
Get-Content $UserListFile | ForEach-Object {
$username = $_.Trim()
if ($username) {
try {
Write-Host "Updating password for user: $username"
Set-LocalUser -Name $username -Password $NewPassword
Write-Host "Password updated successfully for $username"
} catch {
Write-Host "Failed to update password for $username. Error: $_"
}
}
}

Write-Host "All operations completed."