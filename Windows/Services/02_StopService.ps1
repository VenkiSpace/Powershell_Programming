StopService -serviceName "Spooler"

###
#   Task : Stop the specified service 
###

Function StopService
{
	param
	(
		$serviceName
	)
	
    "`nTask : Stop $serviceName Service "
	
	$service = Get-Service -Name $serviceName

	if ($service.Status -eq "Stopped")
	{
		"Service $serviceName is not running. No action will be taken."
	}
	else
	{
		"Service $serviceName is running. Service will be stopped."
		
		Stop-Service -Name $serviceName

		if ($service.Status -eq "Stopped")
		{
			"Service $serviceName is stopped successfully."
		}
		else
		{
			"Unable to stop service $serviceName."
		}
	}
}