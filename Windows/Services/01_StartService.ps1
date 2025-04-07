StartService -serviceName "Spooler"

###
#   Task : Start the specified service 
###

Function StartService
{
	param
	(
		$serviceName
	)
	
    "`nTask : Start $serviceName Service "
	
	$service = Get-Service -Name $serviceName

	if ($service.Status -eq "Running")
	{
		"Service $serviceName is already running. No action will be taken."
	}
	else
	{
		"Service $serviceName is not running. Service will be started."
		
		Start-Service -Name $serviceName

		if ($service.Status -eq "Running")
		{
			"Service $serviceName is started successfully."
		}
		else
		{
			"Unable to start service $serviceName."
		}
	}
}